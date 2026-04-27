
--Baue models/marts/core/dim_products.sql mit einer Zeile pro Produkt, angereichert um
--Verkaufskennzahlen, wie Gesamtanzahl der verkauften Produkte, Gesamterlös, Erstes und Letztes
--verkauftes Produkt.

select 
stg_products.product_id, 
stg_products.product_name, stg_products.brand, stg_products.category, stg_products.department, 
stg_products.retail_price, stg_products.cost, stg_products.margin ,
count(*) as lifetime_units_sold , -- stg_order_items
sum(sale_price) as lifetime_revenue ,
min(ordered_at) as first_sold_at ,
max(ordered_at) as last_sold_at 
from {{ ref('stg_products') }} 
join {{ ref('stg_order_items') }} on stg_products.product_id=stg_order_items.product_id
group by  stg_products.product_id , stg_products.product_name, stg_products.brand, stg_products.category, stg_products.department, 
stg_products.retail_price, stg_products.cost, stg_products.margin 


