{% snapshot users_snapshot %}

{{
  config(
    target_schema='snapshots',
    unique_key='id',
    strategy='check',
    check_cols=['email', 'country', 'city', 'traffic_source']
  )
}}

select
    id,
    first_name,
    last_name,
    email,
    country,
    city,
    traffic_source,
    created_at
from {{ source('thelook_ecommerce', 'users') }}

{% endsnapshot %}
