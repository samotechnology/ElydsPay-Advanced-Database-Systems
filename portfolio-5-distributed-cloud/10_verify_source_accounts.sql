-- MIT 8103: Portfolio 5
-- Verify account balances in the source database.
-- Run in elydspay_db.

SELECT
    account_number,
    account_type,
    balance,
    currency_code
FROM public.accounts
ORDER BY account_number;