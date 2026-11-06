# Portfolio 2 — Query Optimisation

## MIT 8103 — Advanced Database Systems

**Case Study:** ElydsPay — Simulated Digital Banking Platform  
**Database:** `elydspay_db`  
**DBMS:** PostgreSQL 18  
**Tool:** pgAdmin 4

## 1. Objective

This portfolio demonstrates SQL query optimisation using PostgreSQL execution plans, indexing, and performance comparison.

The objective was to improve the efficiency of a query retrieving completed bank transfers of NGN 4,000 or more, ordered by transaction date.

## 2. Performance Testing Dataset

A synthetic dataset of 50,000 transactions was generated for performance testing.

The dataset was used to compare query execution before and after creating a suitable index.

## 3. Query Before Optimisation

The query was analysed using `EXPLAIN (ANALYZE, BUFFERS)`.

Before indexing, PostgreSQL used a sequential scan on the `transactions` table followed by a sort operation.

**Observed results:**

- Execution strategy: Sequential Scan and Sort
- Rows returned: 3,666
- Rows removed by filter: 46,334
- Execution time: 21.284 ms

The sequential scan examined records that did not satisfy the query conditions.

## 4. Index Creation

A partial index was created to support the query filtering completed transfers with amounts of NGN 4,000 or more.

The index was designed to improve access to the relevant transactions and support ordering by transaction date.

## 5. Query After Optimisation

The same query was executed again using `EXPLAIN (ANALYZE, BUFFERS)`.

After indexing, PostgreSQL used an index scan.

**Observed results:**

- Execution strategy: Index Scan
- Index: `idx_transactions_completed_transfers_4000_date`
- Rows returned: 3,666
- Execution time: 4.213 ms

## 6. Performance Comparison

| Metric | Before Index | After Index |
|---|---|---|
| Execution strategy | Sequential Scan + Sort | Index Scan |
| Rows returned | 3,666 | 3,666 |
| Execution time | 21.284 ms | 4.213 ms |

The measured execution time decreased by approximately **80.2%**, representing approximately **5.05 times faster execution** in this test.

These measurements reflect the observed test runs. Actual performance can vary with caching, workload, and database conditions.

## 7. Key Learning and Reflection

This practical exercise demonstrated how execution plans help identify inefficient queries.

I learned that creating an index aligned with query filtering and ordering requirements can substantially improve performance. I also learned that optimisation should be evaluated using measured execution plans rather than assumptions.

## 8. Evidence

The SQL scripts and screenshots in this portfolio document the dataset generation, baseline execution plan, index creation, and execution plan after optimisation.

All records used for performance testing were synthetic demonstration data.

## 9. AI Assistance Declaration

AI assistance was used to explain SQL optimisation concepts, guide the practical exercises, and structure the documentation. The PostgreSQL queries were executed and their results verified in pgAdmin 4.
