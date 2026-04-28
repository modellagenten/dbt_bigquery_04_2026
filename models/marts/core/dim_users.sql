with
    orders_comp as (
        select
            user_id,
            count(*) as lifetime_orders,
            sum(num_of_item) as lifetime_items,
            min(ordered_at) as min_ordered_at,
            max(ordered_at) as max_ordered_at
        from {{ ref("stg_orders") }}
        where status = 'Complete'
        group by user_id
    )

select
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.country,
    u.city,
    traffic_source,
    registered_at,
    lifetime_orders,
    lifetime_items,
    min_ordered_at,
    max_ordered_at
from {{ ref("stg_users") }} u
left join orders_comp o on u.user_id = o.user_id
