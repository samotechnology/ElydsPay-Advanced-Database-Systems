# Portfolio 1 — Database Design and Modelling

## MIT 8103 — Advanced Database Systems

**Case Study:** ElydsPay — A Simulated Digital Banking Platform  
**Database:** `elydspay_db`  
**Database Management System:** PostgreSQL 18  
**Database Administration Tool:** pgAdmin 4

## 1. Project Overview

ElydsPay is a fictional digital banking platform developed as a practical case study for MIT 8103 — Advanced Database Systems.

The database is designed to manage customer information, bank accounts, financial transactions, transaction entries, and audit activities. The project demonstrates relational database design, entity relationships, normalisation, integrity constraints, and practical PostgreSQL implementation.

All customer names, account numbers, and other records used in this project are fictional demonstration data.

## 2. Database Objectives

The objectives of this portfolio are to:

1. Design a relational database for a simulated financial services platform.
2. Identify entities, attributes, primary keys, and foreign keys.
3. Implement the database schema using PostgreSQL.
4. Apply database normalisation principles.
5. Enforce data integrity through database constraints.
6. Test the database and document the results using practical evidence.

## 3. Database Tables

The ElydsPay database contains five related tables.

| Table | Purpose |
|---|---|
| `customers` | Stores customer profiles and contact information. |
| `accounts` | Stores bank accounts and their associated customers. |
| `transactions` | Stores financial transaction records and their statuses. |
| `transaction_entries` | Stores debit and credit entries associated with transactions and accounts. |
| `audit_logs` | Stores records of important database or transaction-related activities. |

### 3.1 Entity Relationships

- One customer can have multiple accounts.
- Each account belongs to one customer.
- One transaction can be associated with multiple transaction entries.
- Each transaction entry references one transaction and one account.
- Audit log records may reference a customer, a transaction, or both.

These relationships are represented in the entity-relationship diagram.

**ER Diagram:** [View ElydsPay ER Diagram](Screenshots/06_elydspay_er_diagram.png)

**Editable ER Model:** `elydspay_database_model.pgerd`

## 4. Database Normalisation

The schema was designed using First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF) principles.

**First Normal Form (1NF):** Table columns contain individual values, and each row can be uniquely identified.

**Second Normal Form (2NF):** Non-key attributes are organised to depend on the relevant entity key rather than only part of a composite key.

**Third Normal Form (3NF):** Customer, account, transaction, transaction-entry, and audit information are separated to reduce unnecessary duplication and avoid improper transitive dependencies.

A separate normalisation document explains the design decisions in greater detail.

**Supporting document:** `07_database_normalisation.docx`

## 5. Integrity Constraints

The database uses several constraints to protect data quality:

| Constraint | Implementation |
|---|---|
| Primary Key | Uniquely identifies records in each table. |
| Foreign Key | Maintains relationships between related tables. |
| UNIQUE | Prevents duplicate customer emails and account numbers. |
| NOT NULL | Requires values for mandatory attributes. |
| CHECK | Restricts account types, transaction values, statuses, and account balances. |

The current account-type rule permits `savings` and `current`. The balance rule prevents negative account balances.

## 6. Practical Constraint Testing

Four deliberate invalid-data tests were performed in PostgreSQL.

| Test | Expected Behaviour | Observed Result |
|---|---|---|
| Duplicate customer email | Reject duplicate email | Passed — SQLSTATE 23505 |
| Nonexistent customer reference | Reject invalid foreign key | Passed — SQLSTATE 23503 |
| Unsupported account type | Reject invalid account type | Passed — SQLSTATE 23514 |
| Negative account balance | Reject negative balance | Passed — SQLSTATE 23514 |

These tests demonstrate that PostgreSQL enforces the implemented integrity constraints.

Following the tests, a verification query returned the three original accounts with unchanged balances:

| Account Number | Customer | Account Type | Balance (NGN) |
|---|---|---|---:|
| 1000000001 | Ada Okafor | savings | 100,000.00 |
| 1000000002 | Ada Okafor | current | 50,000.00 |
| 1000000003 | Tunde Bello | savings | 40,000.00 |

The failed test inserts did not create additional account records.

## 7. SQL Implementation Files

| File | Description |
|---|---|
| `01_customers_accounts.sql` | Customer and account schema |
| `02_transactions.sql` | Transactions schema |
| `03_verify_tables.sql` | Initial table verification |
| `04_transaction_entries.sql` | Transaction-entry schema |
| `05_audit_logs.sql` | Audit-log schema |
| `06_verify_all_five_tables.sql` | Verification of all five tables |
| `08_test_unique_constraint.sql` | Duplicate email constraint test |
| `09_test_foreign_key_constraint.sql` | Foreign-key constraint test |
| `10_test_account_type_constraint.sql` | Account-type constraint test |
| `11_test_negative_balance_constraint.sql` | Negative-balance constraint test |
| `12_verify_accounts_after_tests.sql` | Post-test account verification |

**Implementation note:** The SQL scripts document the schema-building and testing stages. Some schema-creation scripts may need to be executed only once on a fresh database, in dependency order. Constraint-test scripts intentionally produce errors and are not intended to populate the database.

## 8. Screenshot Evidence

Practical evidence is stored in the [Screenshots folder](Screenshots/).

The evidence includes:

- Table creation and verification.
- Customer-account JOIN results.
- Entity-relationship diagram.
- UNIQUE constraint rejection.
- FOREIGN KEY constraint rejection.
- CHECK constraint rejection for invalid account types.
- CHECK constraint rejection for negative balances.
- Verification that the original account records remained unchanged.

## 9. Design Considerations and Limitations

The schema provides a foundation for the remaining advanced database portfolios.

Account balances are stored in the `accounts` table. Maintaining consistency between account balances and transaction entries requires carefully controlled transaction-processing logic.

Although the schema restricts entry types to `debit` and `credit`, it does not by itself enforce that every transaction has balanced debit and credit totals. This is an additional rule to address through transaction-processing design.

The current implementation is a learning prototype rather than a production-ready banking system.

## 10. Reflection

This portfolio demonstrates how relational modelling, foreign keys, normalisation, and integrity constraints work together to support reliable data management.

The practical tests showed that PostgreSQL can reject invalid records before they enter the database. The exercise also highlighted the importance of preserving existing data, documenting test results, and maintaining a clear version history through GitHub.

## 11. Next Portfolio

**Portfolio 2 — Query Optimisation:** SQL query analysis, indexing, execution plans, and performance comparison using PostgreSQL.
