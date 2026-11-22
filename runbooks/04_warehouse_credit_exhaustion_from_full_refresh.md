# 🚨 Production Runbook 04: Warehouse Credit Exhaustion from Accidental Full Refresh

> **Incident Severity**: `SEV-1`  
> **Domain**: FinOps & Data Warehouse Cost Governance  
> **Target Systems**: Snowflake, Databricks SQL, BigQuery, dbt Cloud  
> **Objective**: Terminate runaway multi-terabyte full refresh queries, isolate cost impact, and install CI/CD guardrails.

---

## 1. Emergency Decision Tree

```mermaid
flowchart TD
    Alert["SEV-1 Alert: Warehouse Spend Spike / Accidental --full-refresh in Prod"] --> KillQuery["Step 1: Immediately Kill Active Full-Refresh Query"]
    KillQuery --> CheckTableSize["Step 2: Inspect Target Table Size & Scan Volume"]

    CheckTableSize --> TableStatus{"Table Corrupted / Dropped?"}
    TableStatus -->|"Table Dropped (dbt DROP TABLE)"| RestoreTimeTravel["Restore Table via Delta/Snowflake Time Travel"]
    TableStatus -->|"Query Killed Mid-Write"| RebuildIncremental["Rebuild Incremental Watermark"]

    RestoreTimeTravel --> InstallGuardrail["Deploy prevent_prod_full_refresh Macro"]
    RebuildIncremental --> InstallGuardrail
```

---

## 2. Immediate Diagnostic Procedures (First 5 Minutes)

### Step 1: Terminate Runaway Query Immediately
```sql
-- Snowflake: Find and abort full refresh query
SELECT query_id, user_name, warehouse_name, total_elapsed_time / 1000 AS seconds_running
FROM table(information_schema.query_history_by_warehouse('PROD_TRANSFORM_WH'))
WHERE execution_status = 'RUNNING' AND query_text ILIKE '%drop table%'
ORDER BY start_time DESC;

-- Kill query
SELECT SYSTEM$CANCEL_QUERY('<QUERY_ID>');
```

---

## 3. Root Cause Analysis & Production Remediation

### Primary Root Cause
A developer ran `dbt run --full-refresh` targeting production instead of staging, causing dbt to execute `DROP TABLE` and initiate a multi-billion-row full rescan on multi-cluster warehouses.

### Production Remediation: Full Refresh Guardrail Macro

```sql
-- macros/prevent_prod_full_refresh.sql
{% macro prevent_prod_full_refresh() %}
    {% if flags.FULL_REFRESH and target.name in ['prod', 'production'] %}
        {% set allow_override = var('allow_full_refresh', false) %}
        {% if not allow_override %}
            {{ exceptions.raise_compiler_error(
                "❌ BLOCKED: dbt --full-refresh is disabled in production! " ~
                "To force a full refresh, you must explicitly pass: --vars '{"allow_full_refresh": true}'"
            ) }}
        {% endif %}
    {% endif %}
{% endmacro %}
```

#### Hook Guardrail into dbt_project.yml
```yaml
# dbt_project.yml
on-run-start:
  - "{{ prevent_prod_full_refresh() }}"
```

---

## 4. Verification & Prevention
- [ ] Test `dbt run --full-refresh --target prod` locally and confirm compilation error blocks execution.
- [ ] Verify `dbt run --full-refresh --target prod --vars '{"allow_full_refresh": true}'` permits authorized bypass.
- [ ] Configure auto-suspension timeout on Snowflake warehouse to $\le 60	ext{ seconds}$.
