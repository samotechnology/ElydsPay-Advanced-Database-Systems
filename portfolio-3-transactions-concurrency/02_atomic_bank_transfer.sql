-- MIT 8103: Portfolio 3
-- Atomic NGN 5,000 transfer from Ada to Tunde
-- Run only once in elydspay_db.

BEGIN;

DO $$
DECLARE
    v_sender_id BIGINT;
    v_receiver_id BIGINT;
    v_sender_balance NUMERIC(18,2);
    v_transaction_id BIGINT;
BEGIN
    -- Lock both account rows in a consistent order.
    PERFORM 1
    FROM accounts
    WHERE account_number IN ('1000000001', '1000000003')
    ORDER BY account_id
    FOR UPDATE;

    SELECT account_id, balance
    INTO v_sender_id, v_sender_balance
    FROM accounts
    WHERE account_number = '1000000001';

    SELECT account_id
    INTO v_receiver_id
    FROM accounts
    WHERE account_number = '1000000003';

    IF v_sender_id IS NULL OR v_receiver_id IS NULL THEN
        RAISE EXCEPTION 'Sender or receiver account not found';
    END IF;

    IF v_sender_balance < 5000.00 THEN
        RAISE EXCEPTION 'Insufficient funds';
    END IF;

    -- Debit Ada's savings account.
    UPDATE accounts
    SET balance = balance - 5000.00
    WHERE account_id = v_sender_id;

    -- Credit Tunde's savings account.
    UPDATE accounts
    SET balance = balance + 5000.00
    WHERE account_id = v_receiver_id;

    -- Record the transfer.
    INSERT INTO transactions (
        transaction_reference,
        transaction_type,
        amount,
        status,
        description
    )
    VALUES (
        'P3-TRANSFER-001',
        'transfer',
        5000.00,
        'completed',
        'Portfolio 3 atomic transfer from Ada to Tunde'
    )
    RETURNING transaction_id INTO v_transaction_id;

    -- Record the debit and credit entries.
    INSERT INTO transaction_entries (
        transaction_id,
        account_id,
        entry_type,
        amount
    )
    VALUES
        (v_transaction_id, v_sender_id, 'debit', 5000.00),
        (v_transaction_id, v_receiver_id, 'credit', 5000.00);

    -- Record an audit event.
    INSERT INTO audit_logs (
        transaction_id,
        customer_id,
        action,
        description
    )
    SELECT
        v_transaction_id,
        customer_id,
        'TRANSFER_COMPLETED',
        'NGN 5,000 transferred from account 1000000001 to 1000000003'
    FROM accounts
    WHERE account_id = v_sender_id;
END $$;

COMMIT;