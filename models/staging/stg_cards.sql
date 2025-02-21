with
    cards as (
        select creditcardid, cardtype, cardnumber
        from {{ source("raw_adventure_works", "creditcard") }}

    )

select *
from cards

