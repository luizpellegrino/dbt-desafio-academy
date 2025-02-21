with
    salesreason as (select salesreasonid, name as salesreason, reasontype as salesreasontype, modifieddate
    from {{ source("raw_adventure_works", "salesreason") }}
    )

 select 
    salesreasonid as sales_reason_id,
    salesreason as sales_reason,
    salesreasontype as sales_reason_type,
    modifieddate as modified_date,
    case 
        when COALESCE(modifieddate, CURRENT_DATE) > DATEADD(DAY, -30, CURRENT_DATE) then 'Recent'
        else 'Old'
    end as reason_status
 
from salesreason

