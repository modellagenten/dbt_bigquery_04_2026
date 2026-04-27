-- models/marts/core/fct_order_items.sql
select
    order_item_id,
    order_id,
    user_id,
    product_id,
    product_name,
    category,
    brand,
    sale_price,
    cost,
    (sale_price - cost) as profit
from {{ ref("int_order_items_enriched") }}
