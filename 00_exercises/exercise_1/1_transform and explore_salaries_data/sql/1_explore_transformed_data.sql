-- a) Count number of Data engineers jobs. For simplicity just go for job_title Data Engineer:

SELECT COUNT(*) FROM main.cleaned_salaries WHERE job_title = 'Data Engineer';

----------------------------------------------------------------

-- b) Count number of unique job titles in total:

SELECT COUNT(DISTINCT job_title) FROM main.cleaned_salaries;

-- How many people in each 'job_title':

SELECT
	job_title,
	COUNT(*) AS count
FROM
	main.cleaned_salaries
GROUP BY
	job_title;

----------------------------------------------------------------

-- c) Find out how many jobs that goes into each salary level:

SELECT
	salary_level,
	COUNT(*) AS job_count
FROM
	main.cleaned_salaries
GROUP BY
	salary_level;

----------------------------------------------------------------

-- d) Find out the median and mean salaries for each seniority levels:

-- Medellön/Mean:

SELECT
	experience_level,
	ROUND(AVG(monthly_salary_in_sek)) AS average_monthly_salary_in_sek
FROM
	main.cleaned_salaries
GROUP BY
	experience_level;

-- Medianlön/Median:

WITH OrderedSalaries AS (
SELECT
	experience_level,
	monthly_salary_in_sek,
	ROW_NUMBER() OVER (PARTITION BY experience_level
ORDER BY
	monthly_salary_in_sek) AS row_num,
	COUNT(*) OVER (PARTITION BY experience_level) AS total_rows
FROM
	main.cleaned_salaries
)
SELECT
	experience_level,
	AVG(CASE 
            WHEN row_num = (total_rows + 1) / 2 THEN monthly_salary_in_sek
            WHEN row_num = total_rows / 2 + 1 AND total_rows % 2 = 0 THEN monthly_salary_in_sek
            ELSE NULL
        END) AS median_salary_in_sek
FROM
	OrderedSalaries
GROUP BY
	experience_level
ORDER BY
	median_salary_in_sek ASC;


----------------------------------------------------------------

-- e) Find out the top earning job titles based on their median salaries and how much they earn:

-- Medellön/Mean:

SELECT
    job_title,
    ROUND(AVG(monthly_salary_in_sek)) AS average_salary_in_sek
FROM
    main.cleaned_salaries
GROUP BY
    job_title
ORDER BY
    average_salary_in_sek DESC
LIMIT 10;

-- Medianlön/Median:

WITH OrderedSalaries AS (
SELECT
	job_title,
	monthly_salary_in_sek,
	ROW_NUMBER() OVER (PARTITION BY job_title
ORDER BY
	monthly_salary_in_sek) AS row_num,
	COUNT(*) OVER (PARTITION BY job_title) AS total_rows
FROM
	main.cleaned_salaries
)
SELECT
	job_title,
	AVG(CASE 
            WHEN row_num = (total_rows + 1) / 2 THEN monthly_salary_in_sek
            WHEN row_num = total_rows / 2 + 1 AND total_rows % 2 = 0 THEN monthly_salary_in_sek
            ELSE NULL
        END) AS median_salary_in_sek
FROM
	OrderedSalaries
GROUP BY
	job_title
ORDER BY
	median_salary_in_sek DESC
LIMIT 10;

----------------------------------------------------------------

-- f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote:

SELECT DISTINCT remote_ratio FROM main.cleaned_salaries;

--

SELECT
    ROUND(COUNT(CASE WHEN remote_ratio = 100 THEN 1 END) * 100.0 / COUNT(*)) AS percentage_fully_remote,
    ROUND(COUNT(CASE WHEN remote_ratio = 50 THEN 1 END) * 100.0 / COUNT(*)) AS percentage_50_percent_remote,
    ROUND(COUNT(CASE WHEN remote_ratio = 0 THEN 1 END) * 100.0 / COUNT(*)) AS percentage_not_remote
FROM
    main.cleaned_salaries;

----------------------------------------------------------------

-- g) Pick out a job title of interest and figure out if company size affects the salary. 
-- Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find:

SELECT
	company_size,
	ROUND(AVG(monthly_salary_in_sek)) AS average_monthly_salary_in_sek,
	ROUND(AVG(yearly_salary_in_sek)) AS average_yearly_salary_in_sek
FROM
	main.cleaned_salaries
WHERE
	job_title = 'Data Engineer'
GROUP BY
	company_size
ORDER BY
	average_monthly_salary_in_sek DESC;
   
----------------------------------------------------------------


-- h) Feel free to explore other things