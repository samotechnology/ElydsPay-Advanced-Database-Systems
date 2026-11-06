-- MIT 8103: Portfolio 5
-- Enable PostgreSQL Foreign Data Wrapper
-- Database: elydspay_reporting_db

CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- Verify that the extension is installed.
SELECT
    extname AS extension_name,
    extversion AS extension_version
FROM pg_extension
WHERE extname = 'postgres_fdw';