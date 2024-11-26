SELECT * FROM staging.glossary;

-------------------------------

SELECT
	'SQL word' AS type,
	sql_word,
	sql_word[:2],
	sql_word[2:5],
	sql_word[-1]
FROM
	staging.glossary;


-- Städa upp datan; sql_word
	
SELECT sql_word FROM staging.glossary;

SELECT
	sql_word,
	UPPER(TRIM(sql_word)) as SQL_word
FROM
	staging.glossary;
	
-- Städa upp datan; description

SELECT

FROM
	staging.glossary;