# Module 10: Production CI/CD, Slim CI & State Deferral

## 1. Slim CI Mechanics
Slim CI uses `--defer` and `--state` against a production `manifest.json` artifact:
```bash
dbt run --select state:modified+ --defer --state path/to/prod/artifacts
dbt test --select state:modified+ --defer --state path/to/prod/artifacts
```
Only models that have been altered (and their downstream dependents) are built into temporary PR schemas, reducing cloud compute spend by $> 85\%$.
