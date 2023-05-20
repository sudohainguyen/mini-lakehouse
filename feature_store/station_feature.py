from feast import Entity, FeatureView, ValueType
from feast.infra.offline_stores.contrib.trino_offline_store.trino_source import (
    TrinoSource,
)

station_entity = Entity(
    name="station",
    join_keys=["start_station_id"],
    value_type=ValueType.INT64,
)

station_feat_source = TrinoSource(
    table="iceberg.samples.station_feat_30d",
    timestamp_field="event_timestamp",
)

station_feat_stats = FeatureView(
    name="station_feat_30d",
    entities=[station_entity],
    source=station_feat_source,
)
