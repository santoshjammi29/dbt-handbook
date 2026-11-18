# Module 09: dbt Semantic Layer & MetricFlow

## 1. MetricFlow Semantic Model Components
- **Entities**: Join keys (e.g., `customer_id`, `order_id`).
- **Dimensions**: Categorical or time attributes (`order_status`, `order_date`).
- **Measures**: Aggregations on numerical columns (`sum(order_amount_usd)`).
- **Metrics**: High-level business indicators exposed to BI tools (Tableau, PowerBI, Hex).
