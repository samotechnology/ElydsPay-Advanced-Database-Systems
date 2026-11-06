-- Portfolio 5: Diagnose the foreign server user mapping
-- Run in elydspay_reporting_db.

SELECT
    s.srvname AS foreign_server_name,
    m.umuser::regrole AS local_user,
    m.umoptions AS mapping_options
FROM pg_user_mapping AS m
JOIN pg_foreign_server AS s
    ON m.umserver = s.oid
WHERE s.srvname = 'elydspay_source_server';