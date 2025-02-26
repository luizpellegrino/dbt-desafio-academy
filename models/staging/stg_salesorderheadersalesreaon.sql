with
    stg_salesorderheadersalesreason as (
        select salesreasonid, salesorderid, modifieddate
        from {{ source("raw_adventure_works", "salesorderheadersalesreason") }}

    )

select *
from stg_salesreason

