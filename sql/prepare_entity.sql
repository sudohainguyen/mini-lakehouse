CREATE SCHEMA IF NOT EXISTS iceberg.feast WITH (LOCATION = 's3a://datalake/iceberg');

CREATE TABLE IF NOT EXISTS iceberg.feast.entity (
    start_station_id bigint,
    event_timestamp timestamp(6)
) WITH (format = 'parquet');

INSERT INTO
    iceberg.feast.entity (start_station_id, event_timestamp)
VALUES
    (2503, TIMESTAMP '2023-03-25 10:00:00.000000'),
    (4061, TIMESTAMP '2023-03-25 11:30:00.000000'),
    (2501, TIMESTAMP '2023-03-25 13:15:00.000000'),
    (2542, TIMESTAMP '2023-03-25 14:45:00.000000'),
    (7125, TIMESTAMP '2023-03-25 16:20:00.000000');
