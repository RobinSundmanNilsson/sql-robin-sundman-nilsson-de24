-- Logiska operatorer:

-- Python: 50 000 < x < 100 000
-- Andra språk: (x > 50 000) && (x < 100 000)

-- I SQL: BETWEEN & AND operator

--------------------------------------------------

-- Här filtrerar vi mellan två värden:

SELECT
	*
FROM
	main.data_jobs
WHERE
	salary_in_usd BETWEEN 200000 AND 500000;

--------------------------------------------------

-- Här plockar vi ut datan mer specifikt:

SELECT
	job_title, experience_level, salary_in_usd 
FROM
	main.data_jobs
WHERE
	salary_in_usd BETWEEN 200000 AND 500000;
	
--------------------------------------------------

-- Här bygger vi upp våran query steg för steg och testar eftersom:

SELECT
	job_title, 
	experience_level,
	employment_type,
	ROUND (salary_in_usd * 11 / 12) AS salary_in_sek
FROM
	main.data_jobs
WHERE
	salary_in_usd BETWEEN 10000 AND 500000
	AND job_title = 'Data Engineer'
	AND experience_level = 'Entry Level'
	-- AND employment_type = 'PT'
ORDER BY 
	salary_in_sek
DESC;

--------------------------------------------------