with dim_customer as (
select
    customer_id as customer_id,
    territory_id as territory_id,
    modified_date as modified_date,
    
from {{ ref('int_customer') }}
)

select * from dim_customer