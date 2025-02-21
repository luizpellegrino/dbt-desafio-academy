with
    stg_productcosthistory as (
        select productid, startdate, enddate, standardcost, modifieddate
        from {{ source("raw_adventure_works", "productcosthistory") }}

    )

select *
from  stg_productcosthistory

