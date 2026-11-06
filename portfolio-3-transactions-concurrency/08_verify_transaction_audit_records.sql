-- MIT 8103: Portfolio 3
-- Verify the recorded transactions and audit trail

SELECT
    t.transaction_id,
    t.transaction_reference,
    t.transaction_type,
    t.amount,
    t.status,
    COUNT(DISTINCT te.entry_id) AS ledger_entries,
    COUNT(DISTINCT al.audit_id) AS audit_records
FROM transactions AS t
LEFT JOIN transaction_entries AS te
    ON t.transaction_id = te.transaction_id
LEFT JOIN audit_logs AS al
    ON t.transaction_id = al.transaction_id
WHERE t.transaction_reference NOT LIKE 'PERF-%'
GROUP BY
    t.transaction_id,
    t.transaction_reference,
    t.transaction_type,
    t.amount,
    t.status
ORDER BY t.transaction_id;