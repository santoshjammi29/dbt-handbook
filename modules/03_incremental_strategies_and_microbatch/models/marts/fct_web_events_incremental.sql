-- Incremental web events fact table with dynamic 3-day lookback window
{{ config(
    materialized='incremental',
    unique_key='event_id',
    incremental_strategy='merge',
    cluster_by=['event_date', 'event_type'],
    on_schema_change='sync_all_columns'
) }}

with raw_events as (
    select * from {{ ref('stg_telemetry__web_events') }}
    {% if is_incremental() %}
        -- 3-day buffer handles late-arriving events
        where event_timestamp >= (
            select dateadd('day', -3, max(event_timestamp)) from {{ this }}
        )
    {% endif %}
)
select
    event_id,
    session_id,
    user_id,
    event_type,
    cast(event_timestamp as date) as event_date,
    event_timestamp,
    page_url,
    device_category
from raw_events
