CREATE TABLE IF NOT EXISTS hive.samples.bikeshare_trips (
    trip_id BIGINT,
    subscriber_type VARCHAR,
    bikeid VARCHAR,
    start_time TIMESTAMP,
    start_station_id BIGINT,
    start_station_name VARCHAR,
    end_station_id VARCHAR,
    end_station_name VARCHAR,
    duration_minutes BIGINT
) WITH (
    external_location = 's3a://datalake/bikeshare_trips/',
    format = 'PARQUET'
);
