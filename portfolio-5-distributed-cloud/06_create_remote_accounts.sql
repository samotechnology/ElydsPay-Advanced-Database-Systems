-- MIT 8103: Portfolio 5
-- Create a foreign table for ElydsPay accounts
-- Run in elydspay_reporting_db

CREATE FOREIGN TABLE IF NOT EXISTS public.remote_accounts (
    account_id BIGINT,
    customer_id BIGINT,
    account_number VARCHAR(10),
    account_type VARCHAR(20),
    balance NUMERIC(18,2),
    currency_code VARCHAR(3),
    created_at TIMESTAMPTZ
)
SERVER elydspay_source_server
OPTIONS (
    schema_name 'public',
    table_name 'accounts'
);

-- Verify that the foreign table exists.

SELECT
    foreign_table_schema,
    foreign_table_name,
    foreign_server_name
FROM information_schema.foreign_tables
WHERE foreign_table_name = 'remote_accounts';