SELECT * FROM staging.glossary;

--

SELECT
	UPPER(TRIM(sql_word)) as SQL_word
FROM
	staging.glossary;

--
	
SELECT
	REGEXP_REPLACE(TRIM(description),
	' +',
	' ',
	'g' ) AS cleaned_description
FROM
	staging.glossary;
	
--

CREATE SCHEMA IF NOT EXISTS refined;


CREATE TABLE IF NOT EXISTS refined.glossary AS (
SELECT
	UPPER(TRIM(sql_word)) AS sql_word,
	REGEXP_REPLACE(TRIM(description),
	' +',
	' ',
	'g' ) AS description
FROM
	staging.glossary);

--
	
SELECT * FROM refined.glossary;