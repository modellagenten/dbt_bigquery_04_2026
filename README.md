# dbt-Projekt-Template: `dbt_bigquery_ecommerce`

Starter-Projekt für die Schulung „dbt Cloud mit BigQuery".

## Datenbasis

- **Quelle:** `bigquery-public-data.thelook_ecommerce`
- **Tabellen:** `users`, `products`, `orders`, `order_items`, `events`, `inventory_items`, `distribution_centers`
- **Eigenes Dataset:** `dbt_<username>_dev` (Development) bzw. `analytics` (Production)

## Zielstruktur (nach Ablauf der Schulung)

```
models/
├── staging/              # Views auf Public Data, 1:1-Aufbereitung
│   ├── _sources.yml
│   ├── stg_users.sql
│   ├── stg_products.sql
│   ├── stg_orders.sql
│   └── stg_order_items.sql
├── intermediate/         # Ephemeral – Zwischenschritte
│   └── int_order_items_enriched.sql
└── marts/                # Tables – Business-Layer
    ├── core/
    │   ├── dim_users.sql
    │   ├── dim_products.sql
    │   └── fct_orders.sql
    └── marketing/
        └── fct_daily_revenue.sql
```

## Branches im Repo

- `main` – leeres Starter-Template (Teilnehmende arbeiten hier drauf)
- `solutions` – Musterlösungen zu allen Übungen (nur Trainer:in sichtbar)

## Quickstart

Nach Abschluss von Übung 1 (dbt Cloud + BigQuery Connection):

```bash
# Packages installieren
dbt deps

# Alles bauen
dbt build

# Docs generieren und anzeigen
dbt docs generate
dbt docs serve
```

In der **Studio IDE** sind `dbt deps` und `dbt build` über die Command-Leiste verfügbar.
