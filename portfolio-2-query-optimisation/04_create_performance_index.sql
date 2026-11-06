-- MIT 8103: Portfolio 2 - Query Optimisation
-- Create a partial index for completed transfers
-- with amounts of at least NGN 4,000.

CREATE INDEX idx_transactions_completed_transfers_4000_date
ON transactions (created_at DESC)
WHERE transaction_type = 'transfer'
  AND status = 'completed'
  AND amount >= 4000.00;

-- Refresh PostgreSQL statistics after index creation.
ANALYZE transactions;