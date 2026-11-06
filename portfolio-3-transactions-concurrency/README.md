# Portfolio 3 — Transactions and Concurrency Control

**Course:** MIT 8103 — Advanced Database Systems  
**Case Study:** ElydsPay — Simulated Digital Banking Platform  
**Database:** `elydspay_db`  
**DBMS:** PostgreSQL 18  
**Administration Tool:** pgAdmin 4

## 1. Objective

This portfolio demonstrates transaction processing, ACID properties, rollback, and concurrency control using PostgreSQL in the ElydsPay simulated banking database.

## 2. Atomic Bank Transfer

A transfer of NGN 5,000 was performed from Ada Okafor's savings account (`1000000001`) to Tunde Bello's savings account (`1000000003`).

The transfer was performed within a database transaction to keep the related operations together.

### Verified Account Balances

| Account | Before Transfer | After Transfer |
|---|---:|---:|
| Ada Okafor — Savings | NGN 100,000 | NGN 95,000 |
| Ada Okafor — Current | NGN 50,000 | NGN 50,000 |
| Tunde Bello — Savings | NGN 40,000 | NGN 45,000 |

The total balance across the three accounts remained NGN 190,000.

## 3. ACID Properties

- **Atomicity:** Related transfer operations are handled within a transaction so that they can be committed or rolled back together.
- **Consistency:** The transfer preserved the total amount of money held across the affected accounts.
- **Isolation:** PostgreSQL transaction locking was tested using two separate database sessions.
- **Durability:** Committed changes were verified by querying the stored account balances and transaction records.

## 4. Rollback Demonstration

A temporary balance deduction was executed inside a transaction and then cancelled using `ROLLBACK`.

After the rollback, Ada Okafor's savings balance remained NGN 95,000, demonstrating that the uncommitted deduction was not retained.

## 5. Concurrency Control Test

Two separate pgAdmin query sessions were used:

- **Session A** began a transaction and acquired a row-level lock using `SELECT ... FOR UPDATE`.
- **Session B** attempted to update the same account while Session A held the lock.
- PostgreSQL returned a lock timeout error (`SQLSTATE 55P03`) after the configured five-second wait.
- Both sessions were subsequently rolled back to release the transaction state and locks.

This test demonstrates how PostgreSQL controls conflicting concurrent updates.

## 6. Transaction and Audit Verification

The completed bank transfer was verified using the transaction, transaction-entry, and audit-log tables.

The verification query returned:

| Transaction Reference | Status | Ledger Entries | Audit Records |
|---|---|---:|---:|
| `P3-TRANSFER-001` | completed | 2 | 1 |

The two ledger entries represent the debit and credit sides of the transfer.

## 7. Evidence and SQL Scripts

The portfolio contains SQL scripts and screenshots documenting:

1. Initial account balances.
2. Atomic bank transfer.
3. Account balances after the transfer.
4. Rollback demonstration.
5. Session A row-lock acquisition.
6. Session B lock conflict and timeout.
7. Balance verification after concurrency testing.
8. Transaction, ledger-entry, and audit-record verification.

## 8. Reflection

This practical exercise demonstrated why database transactions are essential in financial systems. A bank transfer involves multiple related changes that must remain consistent. Rollback provides a way to cancel uncommitted operations, while row-level locking helps prevent conflicting updates when multiple users access the same account.

The concurrency experiment also showed that lock conflicts must be handled appropriately by the application, including timeout handling and transaction cleanup.

## 9. AI Assistance Declaration

AI assistance was used to support learning, explain PostgreSQL concepts, structure SQL exercises, and organise the portfolio documentation. Practical SQL execution, result verification, and screenshots were carried out in PostgreSQL using pgAdmin 4.
