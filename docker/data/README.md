# Bikeshare Trips dataset
The sample is extracted from `bigquery-public-data.austin_bikeshare.bikeshare_trips` table.

To download the dataset as parquet, run the following command to export the data to GCS:
``` bash
EXPORT DATA
  OPTIONS (
    uri = 'gs://<YOUR_BUCKET>/<PREFIX>/*.parquet',
    format = 'parquet')
AS (
  select * from `bigquery-public-data.austin_bikeshare.bikeshare_trips`
);

```

Then run the following command to download the data to your local machine:
``` bash
gsutil -m cp -r gs://<YOUR_BUCKET>/<PREFIX>/*.parquet ./bikeshare_trips
```
