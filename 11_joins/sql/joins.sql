DESC;

SELECT * FROM main.plants p ;

SELECT * FROM main.plant_care pc ;

-- LEFT JOIN
-- Gets all from the left table, with or without match in right table
-- Without match = "null" on right columns

SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight
FROM
	main.plants p
LEFT JOIN main.plant_care pc ON
	p.plant_id = pc.plant_id;
	


-- RIGHT JOIN
-- Samma princip som ovan, bara omvänt

SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight
FROM
	main.plants p
RIGHT JOIN main.plant_care pc ON
	p.plant_id = pc.plant_id;
	

-- INNER JOIN
-- Exakt match, det som är gemensamt mellan tabellerna

SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight
FROM
	main.plants p
INNER JOIN main.plant_care pc ON
	p.plant_id = pc.plant_id;
	

-- FULL JOIN
-- Tar allt från väntra samt högra tabellen,
-- "null" värden där vi inte får någon match
-- (kan liknas vid en union)

SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight
FROM
	main.plants p
FULL JOIN main.plant_care pc ON
	p.plant_id = pc.plant_id;
	
