CREATE SCHEMA IF NOT EXISTS iceberg.samples WITH (LOCATION = 's3a://datalake/iceberg');

CREATE TABLE IF NOT EXISTS iceberg.samples.iris_iceberg (
    sepal_length DOUBLE,
    sepal_width DOUBLE,
    petal_length DOUBLE,
    petal_width DOUBLE,
    class VARCHAR
) WITH (
    LOCATION = 's3a://datalake/iceberg/iris',
    format = 'PARQUET'
);

INSERT INTO
    iceberg.samples.iris (
        SELECT
            *
        FROM
            hive.samples.iris_parquet
    );
