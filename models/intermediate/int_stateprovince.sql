with
    int_stateprovince as (
        select stateprovinceid as state_id, stateprovincecode as state_code, state_name, territoryid as territory_id, modifieddate as modified_date
        from {{ ref("stg_stateprovince") }}

    )

select *
from int_stateprovince

