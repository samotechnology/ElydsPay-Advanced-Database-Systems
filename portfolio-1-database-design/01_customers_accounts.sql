
SELECT
    c.full_name,
    a.account_number,
    a.account_type,
    a.balance,
    a.currency_code
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
ORDER BY c.full_name, a.account_number;
