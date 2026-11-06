-- MIT 8103: Portfolio 5
-- Create a user mapping for the foreign PostgreSQL server.
-- Run in elydspay_reporting_db.

CREATE USER MAPPING FOR CURRENT_USER
SERVER elydspay_source_server
OPTIONS (
    user 'postgres'
);

-- Verify that the user mapping exists.
SELECT
    s.srvname AS foreign_server_name,
    r.rolname AS local_user
FROM pg_user_mapping AS m
JOIN pg_foreign_server AS s
    ON m.umserver = s.oid
JOIN pg_roles AS r
    ON m.umuser = r.oid
WHERE s.srvname = 'elydspay_source_server';