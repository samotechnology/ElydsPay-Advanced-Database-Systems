-- MIT 8103: Portfolio 5
-- Verify the remote accounts accessed through postgres_fdw.
-- Database: elydspay_reporting_db

SELECT
    COUNT(*) AS total_remote_accounts,
    SUM(balance) AS total_remote_balance,
    MIN(balance) AS minimum_balance,
    MAX(balance) AS maximum_balance
FROM public.remote_accounts;