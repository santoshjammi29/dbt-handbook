-- Production model with contract enforcement
{{ config(
    materialized='table',
    contract={'enforced': true}
) }}

select
    cast(order_id as string) as order_id,
    cast(customer_id as string) as customer_id,
    cast(order_amount_usd as numeric(18,2)) as order_amount_usd,
    cast(ordered_at_utc as timestamp) as ordered_at_utc
from {{ ref('stg_ecommerce__orders') }}
