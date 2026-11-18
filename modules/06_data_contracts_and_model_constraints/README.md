# Module 06: Data Contracts & Model Constraints

## 1. Model Contracts in dbt 1.5+
Data contracts ensure that models adhere strictly to predefined schemas before building in production. If a column name changes, datatype changes, or a constraint is violated, the build fails immediately.

```yaml
version: 2
models:
  - name: fct_orders_contracted
    config:
      contract:
        enforced: true
    columns:
      - name: order_id
        data_type: string
        constraints:
          - type: not_null
          - type: primary_key
      - name: customer_id
        data_type: string
        constraints:
          - type: not_null
      - name: order_amount_usd
        data_type: numeric(18,2)
        constraints:
          - type: check
            expression: "order_amount_usd >= 0"
```
