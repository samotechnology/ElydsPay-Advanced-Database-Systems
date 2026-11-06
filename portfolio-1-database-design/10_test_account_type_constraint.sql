
-- TEST 3: Invalid account type
-- Expected result: CHECK constraint violation
-- Only 'savings' and 'current' are allowed.

BEGIN;

INSERT INTO accounts (
    customer_id,
    account_number,
    account_type,
    balance,
    currency_code
)
VALUES (
    (SELECT customer_id
     FROM customers
     WHERE email = 'ada@example.com'),
    '8888888888',
    'business',
    5000.00,
    'NGN'
);

ROLLBACK;
