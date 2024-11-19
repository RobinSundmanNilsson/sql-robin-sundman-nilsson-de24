-- DELETE

-- DML (Data Manipulation Language)

SELECT * FROM database.duckdb;

--

SELECT
	*
FROM
	database.duckdb
WHERE
	id IN (5, 8);

-

SELECT
	*
FROM
	database.duckdb
WHERE
	word IN ('TIMESTAMPTZ', 'DROP SCHEMA');

-- Här raderar vi 'TIMESTAMPTZ' och 'DROP SCHEMA' med följande kod;

DELETE
FROM
	database.duckdb
WHERE
	word IN ('TIMESTAMPTZ', 'DROP SCHEMA');

