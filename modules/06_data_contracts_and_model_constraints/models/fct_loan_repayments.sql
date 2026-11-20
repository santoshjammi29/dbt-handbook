-- =============================================================================
-- fct_loan_repayments.sql  — Production dbt Model with Data Contracts (v1.9+)
-- Handbook: R05 dbt-handbook | Module 06: Data Contracts & Model Constraints
-- Cross-link: https://github.com/santoshjammi29/data-system-design-handbook/tree/main/modules/08_zero_trust_security_and_governance
-- =============================================================================

{{
  config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='repayment_id',
    on_schema_change='fail',
    contract={
      "enforced": true
    },
    meta={
      "owner": "data-engineering-team",
      "sla": "daily-06:00-UTC",
      "pii_fields": ["borrower_id"],
      "regulatory": ["IFRS9", "BCBS239"]
    }
  )
}}

-- Contract-enforced columns (types must match schema.yml exactly)
select
    cast(repayment_id        as string)    as repayment_id,
    cast(loan_id             as string)    as loan_id,
    cast(borrower_id         as string)    as borrower_id,
    cast(repayment_date      as date)      as repayment_date,
    cast(principal_amount    as numeric)   as principal_amount,
    cast(interest_amount     as numeric)   as interest_amount,
    cast(total_payment       as numeric)   as total_payment,
    cast(outstanding_balance as numeric)   as outstanding_balance,
    cast(days_past_due       as integer)   as days_past_due,
    -- IFRS 9 Stage classification
    case
        when days_past_due = 0  then 'Stage_1'
        when days_past_due <= 90 then 'Stage_2'
        else 'Stage_3'
    end                                    as ifrs9_stage,
    cast(loaded_at           as timestamp) as loaded_at

from {{ ref('stg_loan_repayments') }}

{% if is_incremental() %}
where loaded_at > (select max(loaded_at) from {{ this }})
{% endif %}
