-- MIT 8103: Portfolio 5
-- Demonstrate cross-database access using postgres_fdw
-- Run in elydspay_reporting_db

SELECT
    account_id,
    customer_id,
    account_number,
    account_type,
    balance,
    currency_code
FROM public.remote_accounts
ORDER BY account_number;