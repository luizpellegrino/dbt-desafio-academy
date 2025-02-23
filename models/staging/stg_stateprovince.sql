with
    stg_stateprovince as (
        select stateprovinceid, stateprovincecode, name as state_name, territoryid, modifieddate
        from {{ source("raw_adventure_works", "stateprovince") }}

    )

select *
from stg_stateprovince

