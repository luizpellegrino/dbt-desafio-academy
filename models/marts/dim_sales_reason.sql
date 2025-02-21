with dim_sales_reason as (
select
    sales_reason_id as sales_reason_id,
    sales_reason as sales_reason,
    sales_reason_type as sales_reason_type,
    case 
        when coalesce(modified_date, current_date) > dateadd(day, -30, current_date) then 'recent'
        else 'old'
    end as reason_status
from {{ ref('int_salesreason') }}
)

select * from dim_sales_reason