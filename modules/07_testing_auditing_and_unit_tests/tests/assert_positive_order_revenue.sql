-- Singular test: Returns failing rows where revenue is negative
select
    order_id,
    order_amount_usd
from {{ ref('fct_web_events_incremental') }}
where order_amount_usd < 0
