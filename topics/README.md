# 🧠 Curriculum Topics Directory — 57 Topics Covered

> **Curriculum Scope**: **57 Production Topics** verified against real-world lakehouse internals, query engines, and distributed architectures.
> **Organization**: Grouped by **Relevant Functional Sections** and then by **Difficulty Level**.
> **Navigation**: All sections are **collapsible and collapsed by default** for rapid scanning.
> **Live Web Hub**: Explore interactive search and mindmaps at [moderndataengineer.uk/concepts](https://moderndataengineer.uk/concepts).

---

## 📑 Topics Directory at a Glance

| Pillar / Module | Topics | Functional Sections Covered | Status |
|:---|:---:|:---|:---:|
| 🛠️ **dbt Core, Analytics Engineering & Semantic Modeling** | **57** | Project Architecture & Modeling Primitives, Incremental Materialization & Microbatch, Contracts, Testing & Governance, and 1 more | ✅ Collapsible Deck |

---

## 📚 Comprehensive Topic Specifications (Grouped by Section & Difficulty)

<details>
<summary><b>🛠️ dbt Core, Analytics Engineering & Semantic Modeling (57 Topics across 4 Sections)</b> — <i>Click to expand module</i></summary>

<details>
<summary>&nbsp;&nbsp;📂 <b>Section: Project Architecture & Modeling Primitives (24 Topics)</b> — <i>Click to expand functional domain</i></summary>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟢 Easy: <b>🟢 Easy (Level 1) (8 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **dbt Model** | `🟢 Easy` | A dbt model is a single SQL SELECT statement defined in a .sql file that compiles and materializes a table, view, or incremental dataset in the data warehouse. |
| 2 | **dbt run command** | `🟢 Easy` | The dbt run command is the core CLI command that compiles and executes SQL models in the target warehouse according to the project's dependency DAG. |
| 3 | **dbt Seed** | `🟢 Easy` | A dbt seed is a static CSV file placed in the seeds/ directory that dbt loads directly into the data warehouse as a version-controlled lookup table. |
| 4 | **dbt Source** | `🟢 Easy` | A dbt source represents an external raw table loaded by an ingestion tool (e.g. Fivetran, Airbyte) that is registered in dbt using YAML configuration files. |
| 5 | **profiles.yml** | `🟢 Easy` | The profiles.yml file stores warehouse connection configurations, authentication credentials, and environment target settings outside of the project code repository. |
| 6 | **ref() Function** | `🟢 Easy` | The ref() function is dbt's core interpolation macro used to reference other models within a project, automatically building the Directed Acyclic Graph (DAG) of dependencies. |
| 7 | **Table Materialization** | `🟢 Easy` | Table materialization rebuilds the target model as a physical relational table in the data warehouse on every dbt run using CREATE TABLE AS SELECT (CTAS) logic. |
| 8 | **View Materialization** | `🟢 Easy` | View materialization defines the model as a virtual database view using CREATE VIEW AS SELECT, storing only the SQL query definition without persisting physical data. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟡 Intermediate: <b>🟡 Intermediate (Level 2) (7 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **Analyses** | `🟡 Intermediate` | Analyses are one-off SQL queries stored in the analyses/ directory that utilize dbt Jinja and ref() functions but are compiled without being materialized in the database. |
| 2 | **dbt build Command** | `🟡 Intermediate` | The dbt build command executes models, runs tests, creates snapshots, and loads seeds in a unified DAG sequence, halting downstream nodes if an upstream model or test fails. |
| 3 | **dbt Macros** | `🟡 Intermediate` | dbt Macros are reusable, parameterizable Jinja code blocks defined in the macros/ directory that compile into dynamic SQL during project execution. |
| 4 | **dbt Snapshot (SCD Type 2)** | `🟡 Intermediate` | A dbt snapshot captures and records changes to mutable source data over time, automatically maintaining a Slowly Changing Dimension (SCD Type 2) history table. |
| 5 | **dbt Snapshot Timestamp vs. Check Strategy** | `🟡 Intermediate` | Slowly Changing Dimension Type 2 implementation strategies comparing updated timestamps versus hashing column values. |
| 6 | **dbt-utils Package** | `🟡 Intermediate` | dbt-utils is the foundational open-source macro package maintained by dbt Labs that provides essential utility macros, cross-database SQL helpers, and advanced schema tests. |
| 7 | **Pre/Post Hooks** | `🟡 Intermediate` | Pre-hooks and post-hooks are SQL statements or macros executed immediately before or after a dbt model is materialized in the database. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🔴 Advanced: <b>🔴 Advanced (Level 3) (5 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **dbt Compile vs Run vs Build** | `🔴 Advanced` | The core architectural distinction between dbt compile (generating warehouse SQL), dbt run (executing model DDL/DML), and dbt build (unified execution of seeds, models, tests, and snapshots). |
| 2 | **dbt Model Contracts** | `🔴 Advanced` | Explicit schema constraints enforced by dbt at build time, guaranteeing column names, data types, and nullability. |
| 3 | **Manifest.json Internals** | `🔴 Advanced` | The manifest.json file is a comprehensive JSON artifact generated during compilation that contains the full semantic model, dependency graph, and metadata of the entire dbt project. |
| 4 | **Partial Parsing** | `🔴 Advanced` | Partial Parsing is a performance optimization engine in dbt Core that caches previously parsed project files in manifest.json, reparsing only modified files on subsequent runs. |
| 5 | **Source Freshness Checks** | `🔴 Advanced` | Source Freshness Checks are automated SLA validations executed via dbt source freshness that assert whether raw source tables have received recent data updates. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟣 Architect: <b>🟣 Staff Architect (Level 4) (4 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **dbt Core vs dbt Cloud** | `🟣 Architect` | The strategic architectural evaluation between hosting open-source dbt-core via custom orchestrators versus adopting the managed enterprise SaaS platform, dbt Cloud. |
| 2 | **dbt Mesh & Cross-Project Dependencies** | `🟣 Architect` | An enterprise multi-project architecture in dbt that enables decentralized teams to maintain independent dbt repositories while referencing public models across project boundaries. |
| 3 | **dbt Mesh (Cross-Project Refs)** | `🟣 Architect` | dbt Mesh is an enterprise data architecture that decomposes monolithic dbt repositories into multiple autonomous, domain-owned projects connected via cross-project ref() calls. |
| 4 | **Monorepo vs Multi-Project dbt** | `🟣 Architect` | The architectural trade-off between consolidating all corporate data transformations in a single Git monorepo versus establishing decentralized, domain-specific multi-project dbt repositories. |

</details>

</details>

<details>
<summary>&nbsp;&nbsp;📂 <b>Section: Incremental Materialization & Microbatch (7 Topics)</b> — <i>Click to expand functional domain</i></summary>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟢 Easy: <b>🟢 Easy (Level 1) (2 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **Ephemeral Materialization** | `🟢 Easy` | Ephemeral materialization creates a reusable SQL code block that is not written to the database at all, but rather interpolated as a Common Table Expression (CTE) into downstream models. |
| 2 | **Incremental Materialization** | `🟢 Easy` | Incremental materialization allows dbt to transform and insert only newly arrived or modified records since the previous pipeline run, rather than rebuilding the entire table. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟡 Intermediate: <b>🟡 Intermediate (Level 2) (1 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **Incremental Models (unique_key)** | `🟡 Intermediate` | The unique_key configuration in incremental models specifies the primary key column(s) used by dbt to update existing records and insert new records during MERGE operations. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🔴 Advanced: <b>🔴 Advanced (Level 3) (3 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **Custom Materializations** | `🔴 Advanced` | Custom Materializations are user-defined dbt materialization macros that control the exact DDL, staging steps, and transaction mechanics used to persist models in the warehouse. |
| 2 | **dbt Incremental Microbatch Strategy** | `🔴 Advanced` | A partition-aware incremental loading strategy dividing large table updates into discrete time-based batches. |
| 3 | **Semantic Metric Verification for AI-Generated SQL** | `🔴 Advanced` | An automated validation layer that intercepts AI-generated analytical SQL and verifies its table joins, filter predicates, and metric grains against governed semantic contracts before execution. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟣 Architect: <b>🟣 Staff Architect (Level 4) (1 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **Cost Governance with dbt** | `🟣 Architect` | Cost Governance in dbt involves implementing architectural practices, query tagging, incremental models, and compute warehouse sizing to optimize cloud data warehouse expenditures. |

</details>

</details>

<details>
<summary>&nbsp;&nbsp;📂 <b>Section: Contracts, Testing & Governance (10 Topics)</b> — <i>Click to expand functional domain</i></summary>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟢 Easy: <b>🟢 Easy (Level 1) (2 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **Generic Tests** | `🟢 Easy` | Generic tests are parameterized, reusable schema validation tests defined in YAML that assert data quality constraints against columns or models. |
| 2 | **schema.yml** | `🟢 Easy` | A schema.yml file is a configuration file where models, columns, descriptions, tests, and documentation metadata are declaratively registered in dbt. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟡 Intermediate: <b>🟡 Intermediate (Level 2) (2 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **Custom Schema Override** | `🟡 Intermediate` | Custom Schema Override is the pattern of overriding dbt's default `generate_schema_name` macro to control how schema names are generated across dev and prod environments. |
| 2 | **Singular Tests** | `🟡 Intermediate` | A singular test is a standalone SQL query stored in the tests/ directory that defines a custom business assertion that fails if the query returns any rows. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🔴 Advanced: <b>🔴 Advanced (Level 3) (2 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **Data Product Contract and Service Objectives** | `🔴 Advanced` | A consumer-facing agreement that describes a data product's schema, semantics, quality checks, freshness, availability, ownership, and change policy. |
| 2 | **State-Based CI** | `🔴 Advanced` | State-Based CI (Slim CI) is a continuous integration testing strategy that compares pull request code against a production manifest to test strictly modified models and their first-order dependents. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟣 Architect: <b>🟣 Staff Architect (Level 4) (4 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **dbt Testing Pyramid** | `🟣 Architect` | The dbt Testing Pyramid is a quality architecture framework that structures data testing across unit tests, generic schema assertions, singular business assertions, and data observability. |
| 2 | **Open Data Contract Specification (ODCS)** | `🟣 Architect` | A standardized, vendor-neutral schema and metadata contract format that explicitly defines schema, semantics, SLA targets, and access permissions between data producers and consumers. |
| 3 | **Semantic Context Contract for Data Agents** | `🟣 Architect` | A versioned definition of business terms, metrics, entities, and permitted joins that an AI system can use when answering data questions. |
| 4 | **Slim CI for dbt** | `🟣 Architect` | Slim CI is an automated pull request verification pattern that uses state comparison artifacts to test exclusively modified models and their downstream dependencies in temporary sandboxes. |

</details>

</details>

<details>
<summary>&nbsp;&nbsp;📂 <b>Section: dbt Mesh & Semantic Layer Modeling (16 Topics)</b> — <i>Click to expand functional domain</i></summary>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟡 Intermediate: <b>🟡 Intermediate (Level 2) (5 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **Data Trust Service-Level Objective** | `🟡 Intermediate` | A measurable commitment that a data product meets agreed freshness, quality, lineage, and ownership expectations for its consumers. |
| 2 | **dbt Semantic Layer** | `🟡 Intermediate` | The dbt Semantic Layer (powered by MetricFlow) allows organizations to centrally define metrics and dimensions on top of dbt models, providing consistent metric calculation across all BI tools. |
| 3 | **dbt Slim CI & State:Modified Execution** | `🟡 Intermediate` | A CI/CD optimization technique that compares the current Git branch against production manifest artifacts, running and testing only models modified in the pull request. |
| 4 | **Exposures** | `🟡 Intermediate` | Exposures are YAML declarations in dbt that document downstream consumers of dbt models, such as dashboards, ML models, and operational APIs. |
| 5 | **Jinja Templating in dbt** | `🟡 Intermediate` | Jinja is the Python-based templating engine embedded within dbt that compiles dynamic SQL, enables control flow loops and conditionals, and evaluates environment parameters. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🔴 Advanced: <b>🔴 Advanced (Level 3) (6 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **--defer Flag** | `🔴 Advanced` | The --defer flag allows dbt to resolve unbuilt upstream dependencies in a developer sandbox by pointing to production models recorded in a production manifest.json artifact. |
| 2 | **Adapter-Specific Macros** | `🔴 Advanced` | Adapter-Specific Macros use dbt's multiple-dispatch mechanism to execute different SQL implementations depending on the target database engine (Snowflake, BigQuery, Databricks). |
| 3 | **Cross-Database Macros** | `🔴 Advanced` | Cross-Database Macros provide standardized SQL syntax for functions that vary across database dialects, allowing dbt projects to run on any cloud warehouse platform. |
| 4 | **dbt Slim CI with Deferred State Modification** | `🔴 Advanced` | A CI/CD optimization pattern in dbt that runs and tests only newly modified or upstream/downstream impacted models by comparing git branch artifacts against production manifests. |
| 5 | **dbt-audit-helper** | `🔴 Advanced` | dbt-audit-helper is a dbt package that provides macros to compare row-by-row data parity between two relations, verifying refactored models against legacy tables. |
| 6 | **Graph Selection Syntax** | `🔴 Advanced` | Graph Selection Syntax is dbt's powerful query language used in CLI arguments (--select, --exclude) to selectively execute targeted subgraphs of models, tests, and sources. |

</details>

<details>
<summary>&nbsp;&nbsp;&nbsp;&nbsp;🟣 Architect: <b>🟣 Staff Architect (Level 4) (5 Topics)</b></summary>

| # | Topic / Concept | Difficulty | Architectural Definition & Core Principle |
|:---:|---|:---:|---|
| 1 | **dbt + Airflow Orchestration** | `🟣 Architect` | The enterprise integration pattern combining Apache Airflow as the global workflow orchestrator with dbt as the specialized in-warehouse transformation engine. |
| 2 | **dbt + Databricks Integration** | `🟣 Architect` | The architectural design pairing dbt with Databricks, utilizing dbt-databricks adapters against Databricks SQL Serverless Warehouses and Unity Catalog. |
| 3 | **dbt Production Deployment** | `🟣 Architect` | The production deployment architecture for dbt encompassing containerization, blue/green environment promotion, automated rollback strategies, and observability integration. |
| 4 | **dbt Semantic Layer & MetricFlow** | `🟣 Architect` | A unified semantic specification defining business metrics (e.g. Net Revenue, Customer Churn) centrally in dbt. |
| 5 | **dbt Semantic Layer at Scale** | `🟣 Architect` | The enterprise deployment architecture for the dbt Semantic Layer, serving unified metric definitions to thousands of concurrent BI, dashboard, and AI consumption consumers. |

</details>

</details>

</details>

---

## 🌐 Ecosystem Interlinking
All curriculum topics are synchronized across the 14-repository Modern Data Engineering ecosystem:
- [Modern Data Engineer Hub](https://github.com/santoshjammi29/moderndataengineer) — Central edge web platform and 921-topic encyclopedia
- [Databricks Handbook](https://github.com/santoshjammi29/databricks-handbook) — Unity Catalog, Delta Lake 3.x, and Lakeflow
- [PySpark Handbook](https://github.com/santoshjammi29/pyspark-handbook) — Distributed compute & PySpark internals
- [SQL Handbook](https://github.com/santoshjammi29/sql-handbook) — Query engine optimization & relational internals
- [dbt Handbook](https://github.com/santoshjammi29/dbt-handbook) — Analytics engineering, contracts, and modeling
- [Streaming Handbook](https://github.com/santoshjammi29/streaming-handbook) — Event streaming, Kafka, and Flink
- [DataOps & CI/CD Handbook](https://github.com/santoshjammi29/dataops-cicd-handbook) — Airflow, orchestration, and infrastructure
- [System Design Handbook](https://github.com/santoshjammi29/data-system-design-handbook) — Distributed architecture and scalability
- [Interview Handbook](https://github.com/santoshjammi29/data-engineering-interview-handbook) — 20 Knowledge Pillars & architectural defense
- [Azure Cheat Sheet](https://github.com/santoshjammi29/azure-cheat-sheet) — Fabric, OneLake, and ADF enterprise blueprints
- [Security Handbook](https://github.com/santoshjammi29/security-handbook) — Zero-trust, IAM, and lakehouse governance
