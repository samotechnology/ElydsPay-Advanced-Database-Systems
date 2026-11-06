-- MIT 8103: Portfolio 5
-- Register the main ElydsPay database as a foreign server.
-- Run in elydspay_reporting_db.

CREATE SERVER elydspay_source_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host '127.0.0.1',
    port '5432',
    dbname 'elydspay_db'
);

-- Verify that the foreign server was registered.
SELECT
    srvname AS foreign_server_name,
    srvoptions AS connection_options
FROM pg_foreign_server
WHERE srvname = 'elydspay_source_server';