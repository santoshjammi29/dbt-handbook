-- Staging model for raw orders
-- Enforces surrogate keys, datatype casting, and column renames
with source as (
    select * from {{ source('ecommerce', 'orders') }}
),
standardized as (
    select
        -- Hash surrogate key for cross-engine stability
        {{ dbt_utils.generate_surrogate_key(['order_id']) }} as order_sk,
        cast(order_id as string) as order_id,
        cast(customer_id as string) as customer_id,
        cast(order_amount_cents as numeric) / 100.0 as order_amount_usd,
        upper(trim(order_status)) as order_status,
        cast(created_at_utc as timestamp) as ordered_at_utc,
        cast(_loaded_at_utc as timestamp) as ingested_at_utc
    from source
)
select * from standardized
