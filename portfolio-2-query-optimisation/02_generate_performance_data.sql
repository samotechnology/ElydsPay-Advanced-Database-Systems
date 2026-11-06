-- MIT 8103: Portfolio 2 - Query Optimisation
-- ElydsPay: Generate 50,000 fictional transactions
-- Run ONCE in elydspay_db.
--
-- These are synthetic performance-testing records.
-- This script does not update account balances.

BEGIN;

INSERT INTO transactions (
    transaction_reference,
    transaction_type,
    amount,
    status,
    description,
    created_at
)
SELECT
    'PERF-' || LPAD(g.n::TEXT, 6, '0'),
    CASE
        WHEN g.n % 3 = 0 THEN 'deposit'
        WHEN g.n % 3 = 1 THEN 'withdrawal'
        ELSE 'transfer'
    END,
    ((g.n % 5000) + 100)::NUMERIC(18, 2),
    'completed',
    'Synthetic transaction for Portfolio 2 performance testing',
    TIMESTAMPTZ '2026-01-01 00:00:00+00'
        + (g.n * INTERVAL '5 minutes')
FROM generate_series(1, 50000) AS g(n);

COMMIT;

-- Verify the inserted performance-testing records.
SELECT
    COUNT(*) AS total_performance_transactions,
    MIN(amount) AS minimum_amount,
    MAX(amount) AS maximum_amount,
    MIN(created_at) AS earliest_transaction,
    MAX(created_at) AS latest_transaction
FROM transactions
WHERE transaction_reference LIKE 'PERF-%';