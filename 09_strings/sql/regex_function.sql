-- Städa upp datan i 'description':
-- PLUGGA REGEX! Mycket viktigt att veta lite grann om.

SELECT
	REGEXP_REPLACE(TRIM(description),
	' +',
	' ',
	'g' ) AS cleaned_description
FROM
	staging.glossary;
	

-- Hitta specifika rader där "SELECT" finns; använd %% enligt följande:

SELECT
	*
FROM
	staging.glossary
WHERE
	LOWER(description) LIKE '%select%';
	
