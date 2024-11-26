-- 10 most searched food:

SELECT
	food,
	SUM(number_of_searches) as total_searches -- aggregerings funktion, vi summerar sökningarna.
FROM
	main.cleaned_food_data
GROUP BY
	food -- grupperar så vi blir av med dupliceringar, kan liknas vid DISTINCT.
ORDER BY
	total_searches DESC -- sorterar datan på totala sökningar, decending, från högsta till lägsta.
LIMIT 10; -- limiterar till 10 resultat.


-- Total searches by year:

SELECT
	year,
	SUM(number_of_searches) AS total_searches
FROM
	main.cleaned_food_data
GROUP BY
	year
ORDER BY
	total_searches DESC;


-- Years with 300 000 number of searches:

SELECT
	year,
	SUM(number_of_searches) AS total_searches
FROM
	main.cleaned_food_data
GROUP BY
	year
HAVING total_searches > 300000
ORDER BY
	total_searches DESC;


-- Grouping for two different collumns:

SELECT
	year,
	food,
	SUM(number_of_searches) AS total_searches
FROM
	main.cleaned_food_data
GROUP BY
	food,
	year
ORDER BY total_searches DESC;


-- Most popular food in summer:



-- Most popular food in winter: