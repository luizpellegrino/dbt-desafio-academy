with fact_sales as (
    select
        o.order_id as order_id,
        o.order_detail_id as order_detail_id,
        o.modified_date as sale_date,
        o.order_quantity as quantity,
        o.unit_price as unit_price,
        o.total_price,
        cu.customer_id as customer_id,
        cu.territory_id as territory_id,
        p.product_id as product_id,
        cc.card_type as card_type,
        sr.sales_reason as sales_reason
    from {{ ref('int_orderdetail') }} o
    left join {{ ref('int_orderdetail') }} so on o.order_id = so.order_id
    left join {{ ref('int_customer') }} cu on so.customer_id = cu.customer_id
    left join {{ ref('int_product') }} p on o.product_id = p.product_id
    left join {{ ref('int_cards') }} cc on so.credit_card_id = cc.credit_card_id
    left join {{ ref('int_salesreason') }} sr on so.sales_reason_id = sr.sales_reason_id
)
select * from fact_sales;
