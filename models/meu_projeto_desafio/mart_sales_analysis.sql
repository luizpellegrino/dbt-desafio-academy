with
    customer as (
        select customerid as customer_id, storeid as store_id, territoryid as territory_id, modifieddate
        from {{ ref('stg_customer') }} 
    )

select *
from customer

