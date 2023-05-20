# Feature Store on Trino

Feast Feature store powered by Trino and Iceberg.

### Prerequisites

- Install python dependencies

```bash
pip install -r requirements.txt
```

### Register feature to feature store

```bash
export TRINO_USER=admin && feast apply
```

### Run feature retrieval job
- Go through script `prepare_entity.sql` to create entity table on Trino.
- Explore notebook [here](demo.ipynb)
