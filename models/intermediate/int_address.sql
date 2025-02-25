with
    int_address as (
        select city, addressid as address_id, stateprovinceid as state_id, spatiallocation as spatial_location
        from {{ source("raw_adventure_works", "address") }}

    )

select *
from int_address



