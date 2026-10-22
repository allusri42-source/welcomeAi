select
    o.order_id,
    o.customer_id,
    c.first_name || ' ' || c.last_name as customer_name,
    o.order_date,
    o.status,
    o.amount,

    case
        when o.status = 'completed' then o.amount
        else 0
    end as completed_revenue

from {{ ref('stg_orders') }} o

left join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id
