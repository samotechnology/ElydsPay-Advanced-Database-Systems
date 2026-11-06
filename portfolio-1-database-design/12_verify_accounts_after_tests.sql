
-- Verify ElydsPay account balances after constraint testing

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
