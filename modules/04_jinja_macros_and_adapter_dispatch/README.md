# Module 04: Jinja2 Macros & Cross-Database Adapter Dispatch

## 1. Adapter Dispatch Architecture
Enterprise dbt packages must execute cleanly across Snowflake, BigQuery, Databricks, and PostgreSQL. The `adapter.dispatch` pattern routes function calls to engine-specific SQL implementations:

```sql
{% macro generate_surrogate_key(field_list) %}
    {{ return(adapter.dispatch('generate_surrogate_key', 'dbt_handbook')(field_list)) }}
{% endmacro %}
```
