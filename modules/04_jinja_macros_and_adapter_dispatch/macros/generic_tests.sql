-- =============================================================================
-- generic_tests.sql — Custom Generic Tests via dbt Macros
-- Handbook: R05 dbt-handbook | Module 04: Jinja, Macros & Adapter Dispatch
-- =============================================================================

{% test not_negative(model, column_name) %}
-- Generic test: asserts no negative values in a numeric column
select {{ column_name }}
from {{ model }}
where {{ column_name }} < 0
{% endtest %}


{% test is_valid_ifrs9_stage(model, column_name) %}
-- Generic test: validates IFRS 9 stage classification values
select {{ column_name }}
from {{ model }}
where {{ column_name }} not in ('Stage_1', 'Stage_2', 'Stage_3')
  and {{ column_name }} is not null
{% endtest %}


{% test row_count_is_positive(model, column_name) %}
-- Generic test: validates table has at least 1 row
select count(*)
from {{ model }}
having count(*) = 0
{% endtest %}


{% macro generate_schema_name(custom_schema_name, node) -%}
  {%- set default_schema = target.schema -%}
  {%- if custom_schema_name is none -%}
    {{ default_schema }}
  {%- else -%}
    {{ default_schema }}_{{ custom_schema_name | trim }}
  {%- endif -%}
{%- endmacro %}


{% macro safe_divide(numerator, denominator, default_value=0) %}
  -- Null-safe division macro for financial calculations
  case
    when {{ denominator }} = 0 or {{ denominator }} is null
    then {{ default_value }}
    else {{ numerator }} / {{ denominator }}
  end
{% endmacro %}
