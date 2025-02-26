with
    salesterritory as (select territoryid, countryregioncode, salesytd, saleslastyear, modifieddate
    from {{ source("raw_adventure_works", "salesterritory") }}
    )

select 
    territoryid as territory_id,
    countryregioncode as region_code,
    COALESCE(salesytd, 0) AS sales_ytd, 
    COALESCE(saleslastyear, 0) AS sales_last_year, 
    modifieddate as modified_date,
    case 
        when COALESCE(saleslastyear, 0) = 0 then NULL
        else (salesytd - saleslastyear) / saleslastyear * 100
    end as sales_growth_percentage

from salesterritory