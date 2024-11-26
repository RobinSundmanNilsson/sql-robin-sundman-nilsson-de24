-- Transform data:

-- id > food
-- remove googleTopic
-- add year column
-- week_id > week
-- value > number of searches

SELECT * FROM main.food;


-- SELECT
SELECT
	id AS food,
	SUBSTRING(week_id, 1, 4) AS year, -- week_id[:4] (slicing)
	week_id[6:] AS week,
	value AS number_of_searches
FROM
	main.food;
	
-- CREATE
CREATE TABLE IF NOT EXISTS cleaned_food_data AS (
SELECT
	id AS food,
	SUBSTRING(week_id, 1, 4) AS year,
	-- week_id[:4] (slicing)
	week_id[6:] AS week,
	value AS number_of_searches
FROM
	main.food);

--

SELECT * FROM main.cleaned_food_data;

--

DESC;

