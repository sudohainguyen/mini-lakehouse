CREATE SCHEMA IF NOT EXISTS hive.samples WITH (LOCATION = 's3a://datalake/');

CREATE TABLE IF NOT EXISTS hive.samples.iris_parque (
    sepal_length DOUBLE,
    sepal_width DOUBLE,
    petal_length DOUBLE,
    petal_width DOUBLE,
    class VARCHAR
) WITH (
    external_location = 's3a://datalake/iris/',
    format = 'PARQUET'
);
