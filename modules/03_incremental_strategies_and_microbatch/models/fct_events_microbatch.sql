-- =============================================================================
-- fct_events_microbatch.sql — dbt Microbatch Incremental (dbt 1.9+)
-- Handbook: R05 dbt-handbook | Module 03: Incremental Strategies & Microbatch
-- =============================================================================

{{
  config(
    materialized='incremental',
    incremental_strategy='microbatch',
    event_time='event_timestamp',
    batch_size='day',
    lookback=3,
    begin='2024-01-01',
    on_schema_change='append_new_columns'
  )
}}

select
    event_id,
    user_id,
    event_type,
    event_timestamp,
    session_id,
    platform,
    cast(date_trunc('day', event_timestamp) as date) as event_date,
    properties,
    current_timestamp()                               as dbt_updated_at

from {{ source('raw_events', 'clickstream') }}

-- Microbatch: dbt automatically filters event_timestamp to the batch window
-- No manual incremental filter needed — the framework handles partitioned loads
