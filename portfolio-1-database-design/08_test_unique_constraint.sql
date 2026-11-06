
-- TEST 1: Duplicate customer email
-- Expected result: UNIQUE constraint violation

BEGIN;

INSERT INTO customers (full_name, email, phone_number)
VALUES (
    'Test Customer',
    'ada@example.com',
    '08099999999'
);

ROLLBACK;
