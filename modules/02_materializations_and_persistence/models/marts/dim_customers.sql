-- Dimensional model for enterprise customer entities
{{ config(
    materialized='table',
    tags=['core', 'daily'],
    cluster_by=['customer_country', 'customer_tier']
) }}

with customers as (
    select * from {{ ref('stg_ecommerce__customers') }}
),
order_aggregates as (
    select
        customer_id,
        count(distinct order_id) as total_lifetime_orders,
        sum(order_amount_usd) as lifetime_revenue_usd,
        max(ordered_at_utc) as last_order_date
    from {{ ref('stg_ecommerce__orders') }}
    group by customer_id
)
select
    c.customer_sk,
    c.customer_id,
    c.customer_country,
    c.customer_tier,
    coalesce(o.total_lifetime_orders, 0) as total_lifetime_orders,
    coalesce(o.lifetime_revenue_usd, 0.0) as lifetime_revenue_usd,
    o.last_order_date
from customers c
left join order_aggregates o on c.customer_id = o.customer_id
