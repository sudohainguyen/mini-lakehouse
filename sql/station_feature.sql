INSERT INTO
    iceberg.samples.station_feat_30d (
        start_station_id,
        num_trip,
        avg_duration_mins,
        std_duration_mins,
        mode_subscriber_type,
        event_timestamp
    ) WITH data AS (
        SELECT
            *
        FROM
            hive.samples.bikeshare_trips
        WHERE
            start_time BETWEEN cast('2023-03-25 00:00:00' AS timestamp) - INTERVAL '30' DAY
            AND cast('2023-03-25 00:00:00' AS timestamp)
    ),
    mode_sub_agg AS (
        SELECT
            start_station_id,
            subscriber_type AS mode_subscriber_type
        FROM
            (
                SELECT
                    start_station_id,
                    subscriber_type,
                    COUNT(*) AS count,
                    ROW_NUMBER() OVER (
                        PARTITION BY start_station_id
                        ORDER BY
                            COUNT(*) DESC
                    ) AS rn
                FROM
                    data
                GROUP BY
                    start_station_id,
                    subscriber_type
            ) t
        WHERE
            rn = 1
        ORDER BY
            start_station_id
    ),
    stats AS (
        SELECT
            start_station_id,
            count(trip_id) AS num_trip,
            avg(duration_minutes) AS avg_duration_mins,
            stddev(duration_minutes) AS std_duration_mins
        FROM
            data d
        GROUP BY
            start_station_id
    )
SELECT
    stats.start_station_id,
    num_trip,
    avg_duration_mins,
    std_duration_mins,
    mode_subscriber_type,
    cast('2023-03-25 00:00:00' AS timestamp(6)) AS event_timestamp
FROM
    stats
    JOIN mode_sub_agg agg ON stats.start_station_id = agg.start_station_id;
