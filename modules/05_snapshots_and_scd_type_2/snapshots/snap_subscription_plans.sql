-- SCD Type 2 snapshot tracking subscription plan mutations
{% snapshot snap_subscription_plans %}

{{ config(
    target_schema='snapshots',
    unique_key='subscription_id',
    strategy='timestamp',
    updated_at='updated_at_utc',
    invalidate_hard_deletes=True
) }}

select
    subscription_id,
    customer_id,
    plan_name,
    monthly_rate_usd,
    is_auto_renew,
    status as subscription_status,
    updated_at_utc
from {{ source('billing', 'subscriptions') }}

{% endsnapshot %}
