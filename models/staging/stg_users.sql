with source as (

    select * from {{ source('thelook_ecommerce', 'users') }}

),

renamed as (

    select
        id                   as user_id,
        first_name,
        last_name,
        email,
        age,
        gender,
        country, 
        city,
        postal_code,
        traffic_source,
        created_at           as registered_at

    from source

)

select * from renamed
