-- DDL (Data Definition Language)

ALTER TABLE database.duckdb ADD COLUMN learnt BOOLEAN DEFAULT FALSE;

-- RENAME: Ändra namn på en kollumn i en tabell i en duckdb databas;

ALTER TABLE database.duckdb RENAME COLUMN decription TO description;

SELECT * FROM database.duckdb;

