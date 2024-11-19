-- DDL (Data Definition Language)

-- In a SQL database, a schema is a list of logical structures of data.
-- A Schema in SQL is a collection of database objects associated with a database.

-- A database schema refers to the logical and visual configuration of the entire relational database. 
-- The database objects are often grouped and displayed as tables, functions, and relations.
-- A schema describes the organization and storage of data in a database and defines the relationship between various tables.

CREATE SCHEMA IF NOT EXISTS database;

SELECT * FROM information_schema.schemata;

CREATE SEQUENCE IF NOT EXISTS id_duckdb_sequence START 1;

SELECT * FROM pg_catalog.pg_sequences;

-- VARCHAR, TEXT och STRING är samma sak, MEN! I VARCHAR kan man specificera hur många tecken man vill ha.
-- "nextval" ökar värdet vid nästa sekvens (id't tickar på här från 1 til 2, 3 etc etc)


CREATE TABLE IF NOT EXISTS database.duckdb (
	id INTEGER DEFAULT nextval('id_duckdb_sequence'),
	word STRING,
	description STRING
	);
	
--

-- Skapar SCHEMA och TABELL för "Demo Delete"

CREATE SCHEMA IF NOT EXISTS test_delete;
	
CREATE TABLE IF NOT EXISTS test_delete.drop (
	word STRING,
	description STRING);
	
SELECT * FROM test_delete.drop;