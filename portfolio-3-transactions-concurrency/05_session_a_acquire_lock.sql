-- Portfolio 3: Concurrency Control
-- Session A: Acquire a row lock

BEGIN;

SELECT
    account_number,
    balance
FROM accounts
WHERE account_number = '1000000001'
FOR UPDATE;

ROLLBACK;