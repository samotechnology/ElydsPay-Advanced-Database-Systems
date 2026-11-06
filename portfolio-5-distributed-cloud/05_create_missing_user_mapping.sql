-- MIT 8103: Portfolio 5
-- Create the missing user mapping
-- Database: elydspay_reporting_db

CREATE USER MAPPING IF NOT EXISTS
FOR postgres
SERVER elydspay_source_server
OPTIONS (
    user 'postgres'
);

-- Verify the user mapping was created.

SELECT
    s.srvname AS foreign_server_name,
    m.umuser::regrole AS local_user,
    m.umoptions AS mapping_options
FROM pg_user_mapping AS m
JOIN pg_foreign_server AS s
    ON m.umserver = s.oid
WHERE s.srvname = 'elydspay_source_server';