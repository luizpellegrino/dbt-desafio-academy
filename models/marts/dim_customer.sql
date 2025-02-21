with dim_customer as (
select
    customer_id as customer_id,
    store_id as store_id,
    territory_id as territory_id,
    modified_date as modified_date,
    case 
        when coalesce(modified_date, current_date) > dateadd(day, -30, current_date) then 'active'
        else 'inactive'
    end as customer_status
from {{ ref('int_customer') }}
)

select * from dim_customer