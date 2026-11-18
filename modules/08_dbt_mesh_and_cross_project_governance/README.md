# Module 08: dbt Mesh & Multi-Project Governance


![Enterprise Data Mesh: Decentralized Domains & Data Products](../../assets/whiteboards/data_mesh_enterprise_architecture.webp)
> *Architectural Blueprint: [Enterprise Data Mesh: Decentralized Domains & Data Products](../../docs/whiteboard_diagrams/README.md#data-mesh-enterprise-architecture). View full multi-persona breakdown and engine mechanisms in the master index.*



## 1. The dbt Mesh Topology
In large enterprises, a single monolithic dbt repository causes merge conflicts, CI bottlenecks, and unmanageable DAGs. dbt Mesh splits projects into autonomous domain nodes:
- **Finance Domain Project**: Publishes `public_revenue_ledger`.
- **Marketing Domain Project**: Consumes via cross-project `{{ ref('finance_project', 'public_revenue_ledger') }}`.
- **Access Modifiers**: `public` (accessible to cross-project refs), `protected` (internal package), `private` (same directory).
