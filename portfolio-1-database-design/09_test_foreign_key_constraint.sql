
-- TEST 2: Foreign key constraint
-- Expected result: FOREIGN KEY violation
-- Customer ID 999999999 should not exist.

BEGIN;

INSERT INTO accounts (
    customer_id,
    account_number,
    account_type,
    balance,
    currency_code
)
VALUES (
    999999999,
    '9999999999',
    'savings',
    1000.00,
    'NGN'
);

ROLLBACK;
