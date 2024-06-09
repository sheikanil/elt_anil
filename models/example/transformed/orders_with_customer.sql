{{ config(materialized='table') }}

select
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.total_amount
from {{source('uwinnipeg', 'ORDERS')}} o
join {{source('uwinnipeg', 'CUSTOMER')}} c ON o.customer_id = c.customer_id
