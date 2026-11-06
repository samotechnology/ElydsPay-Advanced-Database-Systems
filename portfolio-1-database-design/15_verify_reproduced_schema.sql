-- Portfolio 1: Verify reproducibility of the ElydsPay schema
-- Database: elydspay_repro_test

SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;