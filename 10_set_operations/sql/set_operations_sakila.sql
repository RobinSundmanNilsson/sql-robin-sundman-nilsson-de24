-- Want to combine customers and actors into one table:

-- För att vi ska kunna kombinera olika tabeller så måste det vara samma antal
-- kolumner samt samma datatyp

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.first_name LIKE 'A%'; -- Med A% får vi ut alla first_name som börjar på A

--------------------------------------------

-- UNION ALL: lägger ihop datan från tabellerna till en tabell.
	
-- c = alias för main.customer, a = alias för main.actor:
	
SELECT
	'Customer' AS type,
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.first_name LIKE 'A%'
UNION ALL	
SELECT
	'Actor' AS type,
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE
	a.first_name LIKE 'A%';
	
--------------------------------------------

-- INTERSECT: finns det något gemnsamt mellan tabellerna?

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
INTERSECT	
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a;
	
--------------------------------------------

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';

--

SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

-- UNION: Slår ihop tabellerna, men tar bort dupliceringarna:

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

-- UNION ALL: Slår ihop tabellerna, oberoende av dupliceringar:

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION ALL
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';

-- INTERSECT: Hittar det som är gemensamt i tabellerna:

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
INTERSECT 
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';
