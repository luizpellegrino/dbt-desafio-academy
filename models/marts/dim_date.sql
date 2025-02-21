with dim_date as (
select distinct
    cast(modified_date as date) as date,
        extract(year from cast(modified_date as date)) as year,
        extract(month from cast(modified_date as date)) as month,
        extract(day from cast(modified_date as date)) as day
from {{ ref('int_orderdetail') }}
)

select * from dim_date