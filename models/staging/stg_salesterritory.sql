with
    stg_salesterritory as (
        select territoryid, countryregioncode, salesytd, saleslastyear, modifieddate
        from {{ source("raw_adventure_works", "salesterritory") }}

    )

select *
from stg_salesterritory

