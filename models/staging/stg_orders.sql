with source as (

    select * from {{ source('ecommerce', 'raw_orders') }}

),

cleaned as (

    select
        cast(order_id as integer) as order_id,
        cast(customer_id as integer) as customer_id,
        cast(order_date as date) as order_date,
        lower(trim(status)) as status,
        cast(amount as numeric(12, 2)) as amount

    from source

)

select * from cleaned
