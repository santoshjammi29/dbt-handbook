# Module 10: Production CI/CD, Slim CI & State Deferral

![Enterprise Lakehouse CI/CD Multi-Environment Promotion & Rollback Flow](../../assets/whiteboards/lakehouse_cicd_promotion_lifecycle_architecture.webp)
> *Architectural Blueprint: [Enterprise Lakehouse CI/CD Multi-Environment Promotion & Rollback Flow](../../docs/whiteboard_diagrams/README.md#lakehouse-cicd-promotion-lifecycle). View full multi-persona breakdown and engine mechanisms in the master index.*

## 1. Slim CI Mechanics
Slim CI uses `--defer` and `--state` against a production `manifest.json` artifact:
```bash
dbt run --select state:modified+ --defer --state path/to/prod/artifacts
dbt test --select state:modified+ --defer --state path/to/prod/artifacts
```
Only models that have been altered (and their downstream dependents) are built into temporary PR schemas, reducing cloud compute spend by $> 85\%$.
