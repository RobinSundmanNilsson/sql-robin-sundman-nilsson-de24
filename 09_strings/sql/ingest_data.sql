CREATE TABLE
    IF NOT EXISTS glossary AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/sql_terms.csv')
    );

