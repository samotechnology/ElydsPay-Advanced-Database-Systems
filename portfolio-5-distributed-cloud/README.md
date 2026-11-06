# Portfolio 5 — Distributed and Cloud Database Concepts

## MIT 8103 — Advanced Database Systems

**Case Study:** ElydsPay — Simulated Digital Banking Platform  
**Source Database:** `elydspay_db`  
**Reporting Database:** `elydspay_reporting_db`  
**DBMS:** PostgreSQL 18  
**Administration Tool:** pgAdmin 4

## 1. Objective

This portfolio demonstrates cross-database data access using PostgreSQL's Foreign Data Wrapper (`postgres_fdw`).

The objective is to allow a separate reporting database to retrieve account information from the ElydsPay source database without manually copying the account records.

## 2. Database Architecture

The implementation uses two databases hosted on the same local PostgreSQL installation:

- **`elydspay_db`:** The source database containing the original customer and account records.
- **`elydspay_reporting_db`:** The reporting database that accesses source account records through a foreign table.

The reporting database connects to the source database using a foreign server named `elydspay_source_server`, a PostgreSQL user mapping, and a foreign table named `public.remote_accounts`.

## 3. Implementation

The practical implementation involved:

1. Creating the reporting database.
2. Enabling the `postgres_fdw` extension.
3. Creating the foreign server connection.
4. Configuring and verifying the PostgreSQL user mapping.
5. Creating the `remote_accounts` foreign table.
6. Executing queries against the foreign table.
7. Resolving an authentication error encountered during remote access.
8. Verifying the account balances in both databases.
9. Executing an aggregation query against the foreign account records.

## 4. Verified Results

The source and reporting database queries returned the following matching balances:

| Account number | Account type | Source balance (NGN) | Reporting balance (NGN) |
|---|---|---:|---:|
| 1000000001 | savings | 95,000.00 | 95,000.00 |
| 1000000002 | current | 50,000.00 | 50,000.00 |
| 1000000003 | savings | 45,000.00 | 45,000.00 |

**Verification result: PASS — all three account balances matched.**

The results demonstrate successful retrieval of source account records through the reporting database.

## 5. Authentication and Troubleshooting

An initial foreign-table query returned an authentication error indicating that no password had been supplied.

The foreign server user mapping was updated with the required connection credentials, after which the remote query completed successfully.

For security, passwords and other secrets must not be included in public documentation, screenshots, or uploaded SQL scripts.

## 6. Distributed Database Concepts

The implementation demonstrates:

- Cross-database access through `postgres_fdw`.
- Foreign server configuration and user mapping.
- Remote SQL queries.
- Data consistency verification between source and reporting query results.
- Troubleshooting remote database authentication.

**Scope limitation:** This is a local database federation demonstration. It does not implement automatic replication, physical distribution across multiple servers, or a cloud-hosted database deployment.

## 7. Evidence

The portfolio includes SQL scripts, practical screenshots, and a Word comparison document.

Key evidence files include:

- `06_create_remote_accounts.sql`
- `07_query_remote_accounts.sql`
- `09_remote_account_aggregation.sql`
- `10_verify_source_accounts.sql`
- `11_verify_reporting_accounts.sql`
- `12_source_reporting_comparison.docx`
- `Screenshots/08_remote_accounts_query_success.png`
- `Screenshots/12_reporting_account_balances.png`

Additional setup, verification, and troubleshooting scripts and screenshots are also included.

## 8. Reflection

This practical exercise improved my understanding of how PostgreSQL databases can communicate through foreign data wrappers.

I learned how to configure foreign servers, create user mappings, query remote tables, troubleshoot authentication problems, and verify that remotely retrieved account data matches the original source records.

The exercise also helped me distinguish database federation from replication and cloud deployment.

## 9. Data and Security

All customer names, account numbers, and financial records used in ElydsPay are fictional demonstration data.

Database credentials are excluded from the repository.
