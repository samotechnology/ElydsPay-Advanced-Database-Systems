-- MIT 8103: Portfolio 5
-- Verify account balances through postgres_fdw.
-- Run in elydspay_reporting_db.

SELECT
    account_number,
    account_type,
    balance,
    currency_code
FROM public.remote_accounts
ORDER BY account_number;