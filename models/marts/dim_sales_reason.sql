with dim_sales_reason as (
select
    sales_reason_id as sales_reason_id,
    sales_reason as sales_reason,
    sales_reason_type as sales_reason_type,
    
from {{ ref('int_salesreason') }}
)

select * from dim_sales_reason