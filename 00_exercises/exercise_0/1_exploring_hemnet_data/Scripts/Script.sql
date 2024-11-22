-- a) Create a database file called hemnet.duckdb and ingest the data from the csv file into your database.

-- DONE!

-- b) Make a wildcard selection to checkout the data

SELECT
	*
FROM
	hemnet_data;

-- c) Find out how many rows there are in the table

SELECT
	COUNT(*)
FROM
	hemnet_data;

-- d) Describe the table that you have ingested to see the columns and data types.

DESCRIBE hemnet_data;

-- e) Find out the 5 most expensive homes sold.

SELECT
	*
FROM
	hemnet_data
ORDER BY
	final_price DESC
LIMIT 5;

-- f) Find out the 5 cheapest homes sold.

SELECT
	*
FROM
	hemnet_data
ORDER BY
	final_price ASC
LIMIT 5;

-- g) Find out statistics on minimum, mean, median and maximum prices of homes sold.

SELECT 
    MIN(final_price) AS min_price,
    MAX(final_price) AS max_price,
    AVG(final_price) AS mean_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY final_price) AS median_price
FROM hemnet_data;

-- h) Find out statistics on minimum, mean, median and maximum prices of price per area.

SELECT 
    ROUND(MIN(price_per_area), 0) AS min_price,
    ROUND(MAX(price_per_area), 0) AS max_price,
    ROUND(AVG(price_per_area), 0) AS mean_price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price_per_area) AS median_price
FROM hemnet_data;

-- i) How many unique communes are represented in the dataset.

SELECT
	COUNT(DISTINCT commune) AS unique_communes
FROM
	hemnet_data;

-- j) How many percentage of homes cost more than 10 million?



-- k) Feel free to explore anything else you find interesting in this dataset.