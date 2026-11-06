
-- TEST 4: Negative account balance
-- Expected result: CHECK constraint violation
-- Account balances cannot be negative.

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
    '7777777777',
    'savings',
    -5000.00,
    'NGN'
);

ROLLBACK;
