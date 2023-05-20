CREATE TABLE IF NOT EXISTS iceberg.samples.station_feat_30d (
    start_station_id BIGINT,
    num_trip BIGINT,
    avg_duration_mins DOUBLE,
    std_duration_mins DOUBLE,
    mode_subscriber_type VARCHAR,
    event_timestamp TIMESTAMP(6)
) WITH (
    LOCATION = 's3a://datalake/iceberg/station_feature_30d',
    partitioning=ARRAY['day(event_timestamp)'],
    format = 'PARQUET'
);
