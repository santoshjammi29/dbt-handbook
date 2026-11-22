# Module 07: Testing Pyramid, Data Quality & Native Unit Tests

![Data Quality Observability & Write-Audit-Publish (WAP) Circuit Breaker Flow](../../assets/whiteboards/data_quality_wap_quarantine_architecture.webp)
> *Architectural Blueprint: [Data Quality Observability & Write-Audit-Publish (WAP) Circuit Breaker Flow](../../docs/whiteboard_diagrams/README.md#data-quality-wap-quarantine). View full multi-persona breakdown and engine mechanisms in the master index.*

## 1. Modern dbt Testing Architecture
1. **Generic Column Tests**: `unique`, `not_null`, `relationships`, `accepted_values`.
2. **Singular SQL Tests**: Queries that return failing records (`select * from ... where condition_violated`).
3. **Native Unit Tests (dbt 1.8+)**: Mock input data in YAML fixtures to validate SQL business logic without warehouse data dependencies.
