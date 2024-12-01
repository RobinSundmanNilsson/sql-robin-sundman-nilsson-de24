-- Delete Table To Start Over:

DROP TABLE course_structure;

-- Creating Table:

CREATE TABLE IF NOT EXISTS course_structure (
	content VARCHAR,
	week INTEGER,
	content_type VARCHAR
);

SELECT * FROM course_structure;

-- Insert To Table:

INSERT
	INTO
	course_structure (content,
	week,
	content_type)
VALUES
	('00_intro', 46, 'lecture'),
	('01_course_structure', 46, 'lecture'),
	('02_setup_duckdb', 46, 'lecture'),
	('03_setup_dbeaver', 46, 'lecture'),
	('04_querying_data', 46, 'lecture'),
	('05_filtering', 47, 'lecture'),
	('06_crud_operations', 47, 'lecture'),
	('07_generating_data', 47, 'lecture'),
	('08_grouping_data', 47, 'lecture'),
	('09_strings', 48, 'lecture'),
	('10_set_operations', 48, 'lecture'),
	('11_joins', 48, 'lecture'),
	('12_cte', 49, 'lecture'),
	('13_macros', 49, 'lecture'),
	('14_python_duckdb', 49, 'lecture'),
	('15_sql_injection', 50, 'lecture'),
	('16_duckdb_tricks', 50, 'lecture'),
	('exercise_00', 46, 'exercise'),
	('exercise_01', 47, 'exercise'),
	('exercise_02', 48, 'exercise'),
	('exercise_03', 49, 'exercise');

SELECT * FROM course_structure;

-- a) Select all the exercises in this course

SELECT * FROM course_structure WHERE 'exercise' IN content_type;

-- b) Select all the lectures in this course

SELECT * FROM course_structure WHERE 'lecture' IN content_type;

-- c) Select all records for week 48

SELECT * FROM course_structure WHERE week = 48;

-- d) Select all records for week 47-49

SELECT * FROM course_structure WHERE week BETWEEN 47 AND 49;

-- e) How many lectures are in the table?

SELECT
	COUNT(*) AS lecture_count
FROM
	course_structure
WHERE
	content_type = 'lecture'; 

-- f) How many other content are there?

SELECT
	COUNT(*) AS other_content_count
FROM
	course_structure
WHERE
	content_type != 'lecture';

-- g) Which are the unique content types in this table?

SELECT
	DISTINCT content_type
FROM
	course_structure;

-- Alternativ lösning:

SELECT
	content_type,
	COUNT(*) AS count
FROM
	course_structure
GROUP BY
	content_type;

-- h) Delete the row with content 02_setup_duckdb and add it again.

-- Ta bort raden
DELETE FROM course_structure
WHERE content = '02_setup_duckdb';

-- Lägg till raden igen
INSERT INTO course_structure (content, week, content_type)
VALUES ('02_setup_duckdb', 46, 'lecture');

-- i) You see that 02_setup_duckdb comes in the end of your table, even though the week is 46. Now make a query where you sort the weeks in ascending order.

CREATE TABLE IF NOT EXISTS sorted_course_structure AS
SELECT
	*
FROM
	course_structure
ORDER BY
	content ASC,
	week ASC,
	content ASC;

-- j) Now you can choose what you want to explore in this table.

SELECT * FROM sorted_course_structure;

DROP TABLE sorted_course_structure;