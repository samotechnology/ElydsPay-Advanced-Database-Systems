-- MIT 8103: Portfolio 3
-- Demonstrate transaction rollback

BEGIN;

-- Temporarily deduct NGN 2,000.
UPDATE accounts
SET balance = balance - 2000.00
WHERE account_number = '1000000001';

-- Observe the temporary balance inside the transaction.
SELECT
    account_number,
    balance AS temporary_balance
FROM accounts
WHERE account_number = '1000000001';

-- Cancel the deduction.
ROLLBACK;

-- Verify that the original balance was restored.
SELECT
    account_number,
    balance AS balance_after_rollback
FROM accounts
WHERE account_number = '1000000001';