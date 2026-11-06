-- MIT 8103: Portfolio 5
-- Aggregate reporting across a PostgreSQL foreign table.
-- Run in elydspay_reporting_db.

SELECT
    account_type,
    currency_code,
    COUNT(*) AS number_of_accounts,
    SUM(balance) AS total_balance,
    ROUND(AVG(balance), 2) AS average_balance
FROM public.remote_accounts
GROUP BY
    account_type,
    currency_code
ORDER BY account_type;