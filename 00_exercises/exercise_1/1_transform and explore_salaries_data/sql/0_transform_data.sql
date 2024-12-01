SELECT * FROM main.data_jobs;

-----------------------------

-- Create new table, cleaned_salaries

CREATE TABLE IF NOT EXISTS main.cleaned_salaries AS (
SELECT
	*
FROM
	main.data_jobs)

SELECT * FROM main.cleaned_salaries;

-- a) Transform employment type column based on this table:

SELECT DISTINCT employment_type FROM main.cleaned_salaries;

-- CT = Contract, FL = Freelance, PT = Part Time, FT = Full Time

UPDATE main.cleaned_salaries
SET
	employment_type = 	CASE
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part Time'
		WHEN employment_type = 'FT' THEN 'Full Time'
		ELSE employment_type -- Makes statement idempoent
	END;

----------------------------------------------------------------

-- b) Do similar for company size, but you have to figure out what the abbreviations could stand for:

SELECT DISTINCT company_size FROM main.cleaned_salaries;

-- S = Small, M = Medium, L = Large

UPDATE main.cleaned_salaries
SET
	company_size = 	CASE
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		ELSE company_size -- Makes statement idempoent
	END;

----------------------------------------------------------------

-- c) Make a salary column with Swedish currency for yearly salary:

-- Adding column:

ALTER TABLE main.cleaned_salaries ADD COLUMN yearly_salary_in_sek DOUBLE;

-- Adding data to column:

UPDATE
	main.cleaned_salaries
SET
	yearly_salary_in_sek = ROUND(salary_in_usd * 10.9);
	
-- Check table:

SELECT * FROM main.cleaned_salaries;

----------------------------------------------------------------

-- d) Make a salary column with Swedish currency for monthly salary

-- Adding column:

ALTER TABLE main.cleaned_salaries ADD COLUMN monthly_salary_in_sek DOUBLE;

-- Adding data to column:

UPDATE
	main.cleaned_salaries
SET
	monthly_salary_in_sek = ROUND(yearly_salary_in_sek / 12);
	
-- Check table:

SELECT * FROM main.cleaned_salaries;

----------------------------------------------------------------

-- e) Make a salary_level column with the following categories: low, medium, high, insanely_high. 
-- Decide your thresholds for each category. Make it base on the monthly salary in SEK.

-- Adding column: 

ALTER TABLE main.cleaned_salaries ADD COLUMN salary_level VARCHAR;

-- Adding data to column:

UPDATE main.cleaned_salaries
SET salary_level = CASE 
	WHEN monthly_salary_in_sek < 25000 THEN 'Low'
	WHEN monthly_salary_in_sek >= 25000 AND monthly_salary_in_sek < 50000 THEN 'Medium'
	WHEN monthly_salary_in_sek >= 50000 AND monthly_salary_in_sek < 75000 THEN 'High'
	WHEN monthly_salary_in_sek >= 75000 THEN 'Insanely High'
	ELSE 'unknown' -- För säkerhets skull om det finns tomma eller ogiltiga värden
END;

-- Check table:

SELECT * FROM main.cleaned_salaries;

----------------------------------------------------------------

-- f) Choose the following columns to include in your table: experience_level, employment_type, 
-- job_title, salary_annual_sek, salary_monthly_sek, remote_ratio, company_size, salary_level

-- Deleting columns:

ALTER TABLE main.cleaned_salaries DROP COLUMN salary;
ALTER TABLE main.cleaned_salaries DROP COLUMN salary_currency;
ALTER TABLE main.cleaned_salaries DROP COLUMN salary_in_usd;
ALTER TABLE main.cleaned_salaries DROP COLUMN work_year;

-- Check table:

SELECT * FROM main.cleaned_salaries;

----------------------------------------------------------------

-- g) Think of other transformation that you want to do:

SELECT DISTINCT experience_level FROM main.cleaned_salaries;

-- EN = Entry Level, MI = Mid Level, SE = Senior, EX = Expert

UPDATE
	main.cleaned_salaries
SET experience_level = CASE
		WHEN experience_level = 'EN' THEN 'Entry Level'
		WHEN experience_level = 'MI' THEN 'Mid Level'
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'EX' THEN 'Expert'
		ELSE experience_level -- För säkerhets skull om det finns tomma eller ogiltiga värden
END;

-- Check table:

SELECT * FROM main.cleaned_salaries;

SELECT DISTINCT experience_level FROM main.cleaned_salaries;

----------------------------------------------------------------
