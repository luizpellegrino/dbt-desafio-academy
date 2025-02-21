with
    stg_customer as (
        select customerid, storeid, territoryid, modifieddate
        from {{ source("raw_adventure_works", "customer") }}

    )

select *
from stg_customer

