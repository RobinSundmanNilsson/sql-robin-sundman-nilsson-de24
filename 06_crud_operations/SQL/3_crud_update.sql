-- UPDATE

SELECT * FROM database.duckdb WHERE id IN (9, 1, 11);

-- Man gör SELECT innan UPDATE så man vet exakt vilka man får med.

SELECT
	word, learnt
FROM
	database.duckdb
WHERE
	id IN (9, 1, 11);
	
-- Här uppdaterar vi id 1, 9 och 11 "learnt" från FALSE till TRUE:

UPDATE
	database.duckdb
SET
	learnt = TRUE
WHERE
	id IN (9, 1, 11);

-- Här gör vi samma sak fast tvärtom:

UPDATE
	database.duckdb
SET
	learnt = FALSE
WHERE
	id IN (9, 1, 11);