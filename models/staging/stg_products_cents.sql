with products as (select * from {{ source("thelook_ecommerce", "products") }})
select
    id as product_id,
    name as product_name,
    brand,
    category,
    cast(retail_price * 100 as int64) as retail_price_cents,
    cast(cost * 100 as int64) as cost_cents
from products
