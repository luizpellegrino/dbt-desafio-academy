with cards as (select creditcardid, cardtype, cardnumber
    from {{ ref("stg_cards") }}
    )

select
    creditcardid as credit_card_id,
    cardtype as card_type,
    concat('****-****-****-', right(cardnumber, 4)) as masked_cardnumber

from cards
