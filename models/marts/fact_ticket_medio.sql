with fact_ticket_medio as (
select
    p.product_id as product_id,
    date_trunc('month', cast(o.modified_date as date)) AS month,
    date_trunc('year', cast(o.modified_date as date)) AS year,
    l.region_code as country,
    l.territory_id as state,
    count(distinct o.order_id) as num_orders,
    sum(o.total_price) as gross_revenue,
    sum(o.total_price) / count(distinct o.order_id) as avg_ticket
    from {{ ref('int_orderdetail') }} o
    left join {{ ref('int_product') }} p on o.order_id = p.product_id
    left join {{ ref('int_salesterritory') }} l on o.order_id = l.territory_id
    group by p.product_id, month, year, country, state
)

select * from fact_ticket_medio