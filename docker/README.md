# Quickstart

## Start components
```shell
docker-compose up
```

## Test things working

1. Go to http://localhost:8978 and add trino connection
2. Go through 2 scripts in turn [hive_iris.sql](../sql/hive_iris.sql) and [iceberg_iris.sql](../sql/iceberg_iris.sql).

If no error occurs, your trino cluster is ready.

## Create a ML Feature table

1. Create the table with DDL [station_feature_table.sql](../sql/station_feature_table.sql)
2. Run query [station_feature.sql](../sql/station_feature.sql) to aggregate data and insert to target feature table.
3. Verify the data is inserted to the table by running `select * from iceberg.samples.station_feat_30d`

## Clean up

```shell
docker-compose down
```
