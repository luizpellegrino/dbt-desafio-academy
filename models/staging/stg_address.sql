with
    stg_address as (
        select city, addressid, stateprovinceid, spatiallocation
        from {{ source("raw_adventure_works", "address") }}

    )

select *
from stg_address

