with source as (

    select * from {{ source('ecommerce', 'raw_customers') }}

),

cleaned as (

    select
        cast(customer_id as integer) as customer_id,
        trim(first_name) as first_name,
        trim(last_name) as last_name,
        lower(trim(email)) as email,
        cast(signup_date as date) as signup_date

    from source

)

select * from cleaned
