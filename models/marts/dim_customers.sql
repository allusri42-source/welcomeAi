with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

customer_metrics as (

    select
        customer_id,
        count(*) as total_orders,
        sum(
            case
                when status != 'cancelled' then amount
                else 0
            end
        ) as total_spend,
        max(order_date) as last_order_date

    from orders
    group by customer_id

)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.first_name || ' ' || c.last_name as full_name,
    c.email,
    c.signup_date,
    coalesce(m.total_orders, 0) as total_orders,
    coalesce(m.total_spend, 0) as total_spend,
    m.last_order_date

from customers c

left join customer_metrics m
    on c.customer_id = m.customer_id
