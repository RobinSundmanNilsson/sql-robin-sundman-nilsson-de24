-- EDA - Exploratory Data Analysis

SELECT * FROM main.food;

-- 201 Food Categories
SELECT DISTINCT id AS food FROM main.food;

-- 135025 Rows Total
SELECT COUNT(*) FROM main.food;

-- Collumns: id, googleTopic, week_id, value
DESC main.food;


-- Testing filtering weeks
SELECT
	*
FROM
	main.food
WHERE
	week_id BETWEEN '2004-04' AND '2004-10';
	
