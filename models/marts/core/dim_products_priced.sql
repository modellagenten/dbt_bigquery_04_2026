{{ config(materialized='table') }}
with src as (
 select * from {{ ref('stg_products_cents') }}
)
select
 product_id,
 product_name,
 brand,
 category,
 {{ cents_to_euros('retail_price_cents') }} as
retail_price_eur,
 {{ cents_to_euros('cost_cents') }} as
cost_eur,
 {{ cents_to_euros('retail_price_cents - cost_cents', precision=4) }}
as margin_eur,
retail_price_cents,
cost_cents
from src