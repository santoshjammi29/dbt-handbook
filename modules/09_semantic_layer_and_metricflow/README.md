# Module 09: dbt Semantic Layer & MetricFlow


![Kimball Dimensional Modeling & Enterprise Star Schema](../../assets/whiteboards/kimball_dimensional_star_schema.webp)
> *Architectural Blueprint: [Kimball Dimensional Modeling & Enterprise Star Schema](../../docs/whiteboard_diagrams/README.md#kimball-dimensional-star-schema). View full multi-persona breakdown and engine mechanisms in the master index.*



## 1. MetricFlow Semantic Model Components
- **Entities**: Join keys (e.g., `customer_id`, `order_id`).
- **Dimensions**: Categorical or time attributes (`order_status`, `order_date`).
- **Measures**: Aggregations on numerical columns (`sum(order_amount_usd)`).
- **Metrics**: High-level business indicators exposed to BI tools (Tableau, PowerBI, Hex).
