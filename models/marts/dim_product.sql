with dim_product as (
select
    product_id as product_id,
    product_name as product_name,
    product_number as product_number,
    coalesce(product_color, 'none') as product_color,
        case 
        when modified_date > dateadd(day, -30, current_date()) then 'active' 
        else 'inactive' 
        end as product_status
from {{ ref('int_product') }}
)

select * from dim_product