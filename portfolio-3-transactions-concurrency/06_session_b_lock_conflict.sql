-- Portfolio 3: Concurrency Control
-- Session B: Attempt to update a locked account

BEGIN;

SET LOCAL lock_timeout = '5s';

UPDATE accounts
SET balance = balance + 1000.00
WHERE account_number = '1000000001';

ROLLBACK;