CREATE TABLE
    IF NOT EXISTS food AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/food_searches_google.csv')
    );

