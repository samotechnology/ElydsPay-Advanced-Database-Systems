
-- ElydsPay: Sample data for Portfolio 1
-- Run only after 13_create_complete_schema.sql
-- Use a fresh database, not the existing populated database.
-- All names and account numbers are fictional.

BEGIN;

-- Insert fictional customers.
INSERT INTO customers (full_name, email)
VALUES
    ('Ada Okafor', 'ada@example.com'),
    ('Tunde Bello', 'tunde@example.com');

-- Insert fictional bank accounts.
-- Customer IDs are retrieved by email rather than assumed.

INSERT INTO accounts (
    customer_id,
    account_number,
    account_type,
    balance,
    currency_code
)
VALUES
(
    (SELECT customer_id
     FROM customers
     WHERE email = 'ada@example.com'),
    '1000000001',
    'savings',
    100000.00,
    'NGN'
),
(
    (SELECT customer_id
     FROM customers
     WHERE email = 'ada@example.com'),
    '1000000002',
    'current',
    50000.00,
    'NGN'
),
(
    (SELECT customer_id
     FROM customers
     WHERE email = 'tunde@example.com'),
    '1000000003',
    'savings',
    40000.00,
    'NGN'
);

COMMIT;

-- Verify the inserted customer and account records.
SELECT
    a.account_number,
    c.full_name,
    a.account_type,
    a.balance,
    a.currency_code
FROM accounts AS a
JOIN customers AS c
    ON a.customer_id = c.customer_id
ORDER BY a.account_number;
