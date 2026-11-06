-- MIT 8103: Portfolio 3
-- Verify balances after the NGN 5,000 transfer.

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