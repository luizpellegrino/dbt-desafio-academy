with
    stg_product as (
        select productid, name as productname, productnumber, color as productcolor, modifieddate
        from {{ source("raw_adventure_works", "product") }}

    )

select *
from stg_product

