SELECT * FROM main.data_jobs;

-- Följande ändringar vill vi göra i datan:

-- EN > 'Entry Level'
-- MI > 'Mid Level'
-- SE > 'Senior'
-- EX > 'Expert'

-- Följande kod kan liknas vid en 'if-sats' i python. Här blir (CASE = if) och vi slutar med END >>>

SELECT
	CASE
		WHEN experience_level = 'EN' THEN 'Entry Level'
		WHEN experience_level = 'MI' THEN 'Mid Level'
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'EX' THEN 'Expert'
	END AS experience_level,
	* EXCLUDE (experience_level)
FROM
	main.data_jobs;

-- Kontrollera om jag har transformerat min data?:

SELECT * FROM main.data_jobs;

-- NEJ! Vi behöver uppdatera datan och se till att ändringarna håller sig...
-- Detta gör vi på följande sätt:

UPDATE
	main.data_jobs
SET
	experience_level = CASE
		WHEN experience_level = 'EN' THEN 'Entry Level'
		WHEN experience_level = 'MI' THEN 'Mid Level'
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'EX' THEN 'Expert'
	END;
	
-- Kontrollera om jag har transformerat min data?:

SELECT * FROM main.data_jobs;

-- JA! Datan har uppdaterats.

SELECT DISTINCT experience_level FROM main.data_jobs;

--------------------------------------------------
