with dim_location as (
select
    territory_id,
    region_code as region_code,
    coalesce(sales_ytd, 0) as sales_ytd,
    coalesce(sales_last_year, 0) as sales_last_year,
    case 
        when coalesce(sales_last_year, 0) = 0 then null
        else (sales_ytd - sales_last_year) / sales_last_year * 100
    end as sales_growth_percentage
from {{ ref('int_salesterritory') }}
)

select * from dim_location