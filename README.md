# ElydsPay — Advanced Database Systems Portfolio

**Course:** MIT 8103 — Advanced Database Systems  
**Institution:** Miva University  
**Case Study:** ElydsPay (fictional financial technology platform)

## Project Overview

ElydsPay is a fictional financial technology platform used to demonstrate advanced database design, query optimisation, transaction processing, NoSQL operations, and distributed database concepts.

This repository contains five practical portfolios supported by implementation scripts, screenshots, technical reports, and verification evidence.

## Portfolio Structure

### Portfolio 1 — Database Design and Modelling
`portfolio-1-database-design/`

- PostgreSQL relational schema covering customers, accounts, transactions, transaction entries, and audit logs.
- Entity-relationship diagram and database normalisation documentation.
- Primary key, foreign key, unique, and check constraints.
- Sample data, integrity tests, and reproducibility scripts.

### Portfolio 2 — Query Optimisation
`portfolio-2-query-optimisation/`

- SQL query performance investigations.
- Query execution plans and indexing experiments.
- Performance evidence and analysis.

### Portfolio 3 — Transactions and Concurrency
`portfolio-3-transactions-concurrency/`

- PostgreSQL transaction demonstrations.
- Transaction integrity and concurrency exercises.
- Supporting SQL scripts and screenshots.

### Portfolio 4 — NoSQL Database Implementation
`portfolio-4-nosql/`

- MongoDB database: `elydspay_nosql_db`.
- Collection: `customer_activity`.
- Document queries, filtering, and aggregation pipelines.
- Indexing and query explain-plan evidence.
- MongoDB implementation report.

### Portfolio 5 — Distributed and Cloud Database Concepts
`portfolio-5-distributed-cloud/`

- PostgreSQL foreign data wrapper (`postgres_fdw`) implementation.
- Foreign server and user mapping configuration.
- Remote account queries and aggregation.
- Source and reporting database comparisons.
- Implementation screenshots and report.

## Technologies Used

- PostgreSQL 18
- pgAdmin 4
- MongoDB Community Server
- MongoDB Compass
- GitHub
- Microsoft Word

## Reproducing the Relational Database

1. Create a fresh PostgreSQL database.
2. Run `portfolio-1-database-design/13_create_complete_schema.sql`.
3. Run `portfolio-1-database-design/14_insert_sample_data.sql`.
4. Run `portfolio-1-database-design/15_verify_reproduced_schema.sql`.
5. Review the resulting tables and sample records.

**Important:** These scripts are intended for a fresh database. Do not rerun the sample-data script against an already populated database without checking for duplicate records.

## Evidence and Documentation

Each portfolio contains its practical implementation files and relevant documentation. Screenshot evidence is stored in the corresponding `Screenshots` folder.

The overall technical summary and AI-use declaration are included with the final submission package.

## Academic Integrity

ElydsPay is a fictional case study. Sample customer identities and account information are fictional. The portfolio documents practical exercises and includes an AI-use declaration describing the assistance received.

## Repository Access

This repository is maintained privately for academic assessment.
