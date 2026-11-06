-- MIT 8103: Portfolio 2
-- ElydsPay initial dataset assessment

SELECT 'customers' AS table_name, COUNT(*) AS total_rows
FROM customers

UNION ALL

SELECT 'accounts', COUNT(*)
FROM accounts

UNION ALL

SELECT 'transactions', COUNT(*)
FROM transactions

UNION ALL

SELECT 'transaction_entries', COUNT(*)
FROM transaction_entries

UNION ALL

SELECT 'audit_logs', COUNT(*)
FROM audit_logs;