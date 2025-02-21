with
    productcosthistory as (select productid, startdate, enddate, standardcost, modifieddate
    from {{ source("raw_adventure_works", "productcosthistory") }}
    )

 select 
    productid as product_id,
    startdate as start_date,
    enddate as end_date,
    standardcost as standard_cost,
    modifieddate as modified_date,
    case 
        when enddate >= CURRENT_DATE then 'Active'
        else 'Inactive'
    end as cost_status
      
from productcosthistory

