# 🗂️ The dbt & Analytics Engineering Handbook — Technical Flashcard Deck (50 Active Recall Questions)

> **Coverage**: Modules 01 through 10 of The dbt & Analytics Engineering Handbook
> **Focus**: 50 Rapid-Fire Architectural Invariants, Jinja Mechanics, Materializations, and Governance Rules

---

### 1. What does the `ref()` function do in dbt?

**Answer:**  
Interpolates schema/table names and builds the DAG dependency graph dynamically between models.

---

### 2. What does the `source()` function accomplish?

**Answer:**  
Declares and references raw operational tables, enabling freshness tracking and lineage visualization.

---

### 3. Difference between ephemeral, view, table, and incremental materializations?

**Answer:**  
Ephemeral creates CTEs; view creates database views; table drops and recreates tables; incremental appends/updates delta records.

---

### 4. What is an incremental strategy in dbt?

**Answer:**  
Defines how dbt merges new data into existing tables: `merge` (UPSERT), `delete+insert`, `append`, or `microbatch`.

---

### 5. How does `is_incremental()` conditional logic work in SQL?

**Answer:**  
Evaluates to True only when the target table exists and `--full-refresh` is NOT passed in the CLI.

---

### 6. What is the unique key config in an incremental model?

**Answer:**  
Column(s) used by the database MERGE engine to determine matching rows for UPDATE vs INSERT.

---

### 7. What is microbatch incremental materialization introduced in dbt 1.9+?

**Answer:**  
Splits incremental processing into discrete time-grain batches (e.g., hourly/daily) to bound memory and enable parallel backfills.

---

### 8. What is a snapshot in dbt and what problem does it solve?

**Answer:**  
Implements SCD Type 2 dimension tables by tracking historical changes over time using timestamp or check strategy.

---

### 9. Difference between `timestamp` and `check` strategies in dbt snapshots?

**Answer:**  
`timestamp` relies on an `updated_at` column; `check` compares a hash or list of column values to detect mutations.

---

### 10. What are generic tests in dbt?

**Answer:**  
Reusable parameterized tests (`unique`, `not_null`, `accepted_values`, `relationships`) applied in YAML schema files.

---

### 11. What are singular tests in dbt?

**Answer:**  
Custom SQL queries in the `tests/` directory that fail if they return any rows (assertion model).

---

### 12. What is test severity in dbt and how is it configured?

**Answer:**  
Controls whether test failures halt the pipeline (`error`) or log alerts (`warn`); configured via `severity: warn` in YAML.

---

### 13. What are unit tests in dbt (introduced in dbt 1.8+)?

**Answer:**  
Mock input fixtures in YAML and assert SQL logic behaves as expected without connecting to live production data.

---

### 14. What is dbt Mesh?

**Answer:**  
Architectural pattern enabling cross-project collaboration where multiple dbt projects communicate via public models and cross-project `ref()`.

---

### 15. What is a model access level in dbt Mesh (`private`, `protected`, `public`)?

**Answer:**  
`private` is project-internal; `protected` is accessible in the same package; `public` is contract-enforced and queryable cross-project.

---

### 16. What is a Data Contract in dbt?

**Answer:**  
Formal schema contract specifying column names, data types, and nullability constraints guaranteed at compile time.

---

### 17. What happens if a contract-enforced model violates a constraint during build?

**Answer:**  
The build fails immediately before or during table creation, preventing breaking schema mutations downstream.

---

### 18. What is model versioning in dbt?

**Answer:**  
Allows parallel existence of model versions (e.g. `orders_v1`, `orders_v2`) to prevent breaking consumers during major changes.

---

### 19. What is the dbt Semantic Layer and MetricFlow?

**Answer:**  
Centralized metrics definition framework ensuring business metrics (e.g. MRR, churn) are calculated consistently across all BI tools.

---

### 20. What is an entity in MetricFlow?

**Answer:**  
The join keys (primary, foreign, unique) representing business concepts (e.g., `customer_id`, `order_id`).

---

### 21. What is a measure in MetricFlow?

**Answer:**  
Aggregations performed on columns (e.g., `SUM(order_total)`, `COUNT(DISTINCT user_id)`).

---

### 22. What is a dimension in MetricFlow?

**Answer:**  
Categorical or time attributes used for slicing and grouping measures (e.g., `country`, `order_date`).

---

### 23. What is Jinja in dbt?

**Answer:**  
A templating language that compiles dynamic logic, loops, conditionals, and environment variables into pure SQL.

---

### 24. What is a dbt macro?

**Answer:**  
A reusable piece of Jinja code (similar to a function) that returns SQL or executes operational tasks.

---

### 25. What is `adapter.dispatch()` in Jinja macros?

**Answer:**  
Dynamically routes macro execution to warehouse-specific implementations (e.g., Snowflake, BigQuery, Databricks, Postgres).

---

### 26. What is the `manifest.json` file in dbt?

**Answer:**  
The complete compiled AST metadata artifact containing all models, sources, tests, exposures, and their dependencies.

---

### 27. How does `--state` and `state:modified` enable Slim CI?

**Answer:**  
Compares the current project state against a production `manifest.json` to execute and test only models that were edited or affected.

---

### 28. What does the `+` operator mean in dbt graph selection syntax (`state:modified+`)?

**Answer:**  
Selects modified models AND all of their downstream dependents (`+` downstream, `+model+` both upstream and downstream).

---

### 29. What does the `@` operator mean in dbt selection syntax (`@model`)?

**Answer:**  
Selects the model, all its downstream dependents, and all upstream ancestors of those dependents.

---

### 30. What is `partial_parsing` in dbt?

**Answer:**  
Accelerates compilation by only re-parsing YAML/SQL files that were modified since the last manifest build.

---

### 31. What is the purpose of `dbt compile` vs `dbt run`?

**Answer:**  
`dbt compile` generates the raw SQL target files without executing them on the warehouse; `dbt run` executes them.

---

### 32. What does `dbt build` do?

**Answer:**  
Runs models, tests, snapshots, and seeds in topological dependency order, aborting downstream tasks if an upstream test fails.

---

### 33. What are seeds in dbt and when should they be used?

**Answer:**  
CSV files in `seeds/` loaded into the warehouse via `dbt seed`; intended for small, static lookup tables, NOT large data feeds.

---

### 34. What is an exposure in dbt?

**Answer:**  
Declares downstream consumer assets (e.g., Tableau dashboards, ML models) in YAML to visualize full end-to-end lineage.

---

### 35. What is a source freshness check in dbt?

**Answer:**  
Executes `dbt source freshness` to compare source table max loaded timestamps against warning/error SLA thresholds.

---

### 36. What is the `on_schema_change` config for incremental models?

**Answer:**  
Controls how schema drift is handled: `ignore`, `fail`, `append_new_columns`, or `sync_all_columns`.

---

### 37. What does `sync_all_columns` do during incremental schema change?

**Answer:**  
Adds new columns and removes dropped columns in the target table to match the model definition exactly.

---

### 38. How does dbt handle database transactions during `dbt run`?

**Answer:**  
Models are materialized inside transactional blocks or via atomic table swapping depending on adapter support.

---

### 39. What is a hook in dbt (`pre-hook` and `post-hook`)?

**Answer:**  
Custom SQL executed before or after a model, seed, or snapshot is built (e.g., granting permissions, audit logging).

---

### 40. What is the `query-comment` config in `dbt_project.yml`?

**Answer:**  
Prepends JSON metadata (model name, git commit, invocation id) as SQL comments to trace warehouse credit consumption.

---

### 41. How do you handle late-arriving data in incremental models?

**Answer:**  
Add a lookback window in the `is_incremental()` filter (e.g. `event_time >= (select max(event_time) - interval '3 days' from {{ this }})`).

---

### 42. What are dbt packages and how are they installed?

**Answer:**  
Modular dbt libraries (e.g., `dbt-utils`, `dbt-expectations`) declared in `packages.yml` and installed via `dbt deps`.

---

### 43. What is `dbt clone`?

**Answer:**  
Creates zero-copy clones of tables/views from production into development schemas in supported warehouses (Snowflake, Databricks).

---

### 44. What is a custom generic test macro in dbt?

**Answer:**  
A Jinja macro prefixed with `test_` that returns failing records for any model and column argument.

---

### 45. What is the purpose of `target-database` vs `target-schema` in profiles?

**Answer:**  
Directs compiled queries to specific warehouse compute and schema namespaces depending on dev/staging/prod targets.

---

### 46. What are dbt Python models and where do they execute?

**Answer:**  
DataFrames executed on warehouse serverless compute (Snowflake Snowpark, Databricks Spark, BigQuery Python) rather than locally.

---

### 47. What are the limitations of dbt Python models?

**Answer:**  
Cannot be materialized as views or ephemeral; cannot write raw SQL; require warehouse engine runtime support.

---

### 48. How does dbt interact with warehouse access control (RBAC)?

**Answer:**  
Configures grants (`grant: {select: ['analyst_role']}`) directly in model configs to enforce least-privilege security.

---

### 49. How do you implement Blue-Green deployment with dbt?

**Answer:**  
Build models into an ephemeral staging schema, run tests, and atomically swap schemas with production upon zero test failures.

---

### 50. What is the recommended Git branching strategy for dbt teams?

**Answer:**  
Trunk-based development with short-lived feature branches, automated Slim CI checks on PRs, and squash merges to `main`.

---
