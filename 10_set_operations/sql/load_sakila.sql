INSTALL sqlite;

LOAD sqlite;

-- Absolute path to sqlite-saklia.db
CALL sqlite_attach(
    '/Users/kidquatro/Documents/STI-DE24/SQL/sql-robin-sundman-nilsson-de24/10_set_operations/data/sqlite-sakila.db'
)