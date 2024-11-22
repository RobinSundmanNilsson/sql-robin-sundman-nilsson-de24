CREATE TABLE
    IF NOT EXISTS hemnet_data AS (
        SELECT
            *
        FROM
            read_csv_auto ('hemnet_data_clean.csv')
    );
