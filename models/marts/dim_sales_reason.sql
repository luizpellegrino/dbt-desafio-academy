with dim_sales_reason as (
select
    sr.sales_reason_id as sales_reason_id,
    sr.sales_reason as sales_reason,
    sr.sales_reason_type as sales_reason_type,
    so.sales_order_id
    
from {{ ref('int_salesreason') }} sr
left join {{ ref('int_salesorderheadersalesreason') }} so on sr.sales_reason_id = so.sales_reason_id
)

select * from dim_sales_reason