with dim_location_sales as (
    select
        st.territory_id,
        st.country,
        sp.state_name,
        a.address_id,
        a.city,
        s.total_due,
        count(distinct s.order_id) AS total_orders 

    from {{ ref('int_salesterritory') }} st
    left join {{ ref('int_stateprovince') }} sp on sp.territory_id = st.territory_id
    left join {{ ref('int_address') }} a on a.state_id = sp.state_id
    left join {{ ref('int_sales') }} s on s.billtoaddress_id = a.address_id
    group by
        st.territory_id,
        st.country,
        sp.state_name,
        a.address_id,
        a.city,
        s.total_due,
        st.sales_ytd,
        st.sales_last_year
)

select * , 
CASE 
        WHEN total_orders = 0 THEN 0
        ELSE total_due / total_orders 
    END AS ticket_medio  

 from dim_location_sales