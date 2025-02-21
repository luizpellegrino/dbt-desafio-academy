with customer as (select customerid, storeid, territoryid, modifieddate
    from {{ ref("stg_customer") }}
    )

select
    customerid as customer_id,
    storeid as store_id,
    territoryid as territory_id,
    modifieddate as modified_date,
    case 
        when COALESCE(modifieddate, CURRENT_DATE) > DATEADD(DAY, -30, CURRENT_DATE) then 'Active'
        else 'Inactive'
    end as customer_status

from customer

