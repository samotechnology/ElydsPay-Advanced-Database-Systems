-- MIT 8103: Portfolio 2 - Query Optimisation
-- Baseline performance BEFORE creating an index

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    transaction_id,
    transaction_reference,
    transaction_type,
    amount,
    status,
    created_at
FROM transactions
WHERE transaction_type = 'transfer'
  AND status = 'completed'
  AND amount >= 4000.00
ORDER BY created_at DESC;