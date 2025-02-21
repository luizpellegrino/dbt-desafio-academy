with dim_credit_card as (
select
    credit_card_id as card_id,
    card_type as card_type,
    masked_cardnumber
from {{ ref('int_cards') }}
)

select * from dim_credit_card