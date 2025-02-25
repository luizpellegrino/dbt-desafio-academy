with
    stg_customer as (
        select customerid, territoryid, modifieddate
        from {{ source("raw_adventure_works", "customer") }}

    )

select *
from stg_customer

