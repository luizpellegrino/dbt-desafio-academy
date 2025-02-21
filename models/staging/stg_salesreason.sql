with
    stg_salesreason as (
        select salesreasonid, name as salesreason, reasontype as salesreasontype, modifieddate
        from {{ source("raw_adventure_works", "salesreason") }}

    )

select *
from stg_salesreason

