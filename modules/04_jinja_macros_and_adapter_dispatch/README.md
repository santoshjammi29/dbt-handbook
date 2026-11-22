# Module 04: Jinja2 Macros & Cross-Database Adapter Dispatch

![Databricks Compute: Catalyst Optimizer, AQE & Photon](../../assets/whiteboards/catalyst_photon_engine.webp)
> *Architectural Blueprint: [Databricks Compute: Catalyst Optimizer, AQE & Photon](../../docs/whiteboard_diagrams/README.md#spark-catalyst-photon-engine). View full multi-persona breakdown and engine mechanisms in the master index.*

## 1. Adapter Dispatch Architecture
Enterprise dbt packages must execute cleanly across Snowflake, BigQuery, Databricks, and PostgreSQL. The `adapter.dispatch` pattern routes function calls to engine-specific SQL implementations:

```sql
{% macro generate_surrogate_key(field_list) %}
    {{ return(adapter.dispatch('generate_surrogate_key', 'dbt_handbook')(field_list)) }}
{% endmacro %}
```
