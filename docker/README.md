# Quickstart

```shell
docker-compose up
```

## Run Trino
```shell
./trino-cli-xxx-executable.jar --server http://localhost:8080
```

## Hive

```sql
USE hive;

CREATE SCHEMA IF NOT EXISTS samples
    WITH (location = 's3a://datalake/');

CREATE TABLE IF NOT EXISTS hive.iris.iris_parque
(
    sepal_length DOUBLE,
    sepal_width  DOUBLE,
    petal_length DOUBLE,
    petal_width  DOUBLE,
    class        VARCHAR
)
WITH (external_location = 's3a://datalake/iris/',
    format = 'PARQUET');
```

## Iceberg

```sql
USE iceberg;

CREATE SCHEMA IF NOT EXISTS samples
    WITH (location = 's3a://datalake/');

CREATE TABLE IF NOT EXISTS iceberg.iris.iris_parquet
(
    sepal_length DOUBLE,
    sepal_width  DOUBLE,
    petal_length DOUBLE,
    petal_width  DOUBLE,
    class        VARCHAR
)
WITH (location = 's3a://datalake/iris-iceberg', format = 'PARQUET');
```

## Load from Hive table.

```sql
insert into iceberg.samples.iris (select * from hive.samples.iris_parquet);
```
