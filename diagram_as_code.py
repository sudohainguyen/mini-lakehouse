from diagrams import Cluster, Diagram
from diagrams.custom import Custom
from diagrams.gcp.analytics import Bigquery
from diagrams.gcp.storage import GCS
from diagrams.onprem.analytics import Hive, Superset
from diagrams.onprem.database import PostgreSQL


with Diagram(
    "Lakehouse-at-home Architecture",
    show=False,
    filename="imgs/diagram",
    direction="LR",
):
    with Cluster("Data Source"):
        gcs = GCS("Google Cloud Storage")
        iceberg = Custom("Iceberg", "../assets/iceberg.png")
        bq = Bigquery("BigQuery tables")
        gcs - iceberg

    with Cluster("K8s"):
        with Cluster("Metadata zone"):
            hive = Hive("Hive Metastore")
            psql = PostgreSQL()

        with Cluster("Computing"):
            trino = Custom("", "../assets/trino.png")

        psql >> hive
        [iceberg, hive, bq, gcs] >> trino

    with Cluster("Serving"):
        dashboard = Superset("Superset")
        feast = Custom("Feature Store", "../assets/feast.png")
        trino >> [dashboard, feast]
