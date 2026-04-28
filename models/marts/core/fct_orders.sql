with
    stg_orders as (
        select
            order_id, user_id, status, ordered_at, shipped_at, delivered_at, returned_at
        from {{ ref("stg_orders") }}
    ),
    stg_order_items as (
        select order_id, product_id, sale_price from {{ ref("stg_order_items") }}
    ),
    stg_products as (select product_id, cost from {{ ref("stg_products") }})
select
    so.order_id,
    so.user_id,
    so.status,
    so.ordered_at,
    so.shipped_at,
    so.delivered_at,
    so.returned_at,
    count(so.order_id) as n_items,
    sum(soi.sale_price) as revenue,
    sum(soi.sale_price - sp.cost) as profit,
    timestamp_diff(so.delivered_at, so.ordered_at, day) as days_to_delivery
from stg_orders so
left outer join stg_order_items soi on so.order_id = soi.order_id
left outer join stg_products sp on soi.product_id = sp.product_id
group by all
