from diagrams import Cluster, Diagram
from diagrams.custom import Custom
from diagrams.gcp.analytics import Bigquery
from diagrams.onprem.analytics import Hive, Superset
from diagrams.onprem.database import PostgreSQL


with Diagram(
    "Lakehouse-at-home Architecture",
    show=False,
    filename="imgs/diagram",
    direction="LR",
):
    with Cluster("Data Source"):
        minio = Custom("Minio", "../assets/minio.png")
        bq = Bigquery("BigQuery tables")
        iceberg = Custom("Iceberg tables", "../assets/iceberg.png")
        hive = Hive("Hive tables")
        hive - minio - iceberg

    with Cluster("K8s"):
        with Cluster("Metadata zone"):
            hive_metastore = Hive("Hive Metastore")
            psql = PostgreSQL("DB")

        with Cluster("Computing"):
            trino = Custom("", "../assets/trino.png")

        psql >> hive_metastore
        minio >> trino
        [hive_metastore, bq] >> trino

    with Cluster("Serving"):
        dashboard = Superset("Dashboard")
        feature_store = Custom("Feature Store", "../assets/feast.png")
        trino >> [dashboard, feature_store]
