with orderdetail as (select orderid, orderdetailid, carriertrackingnumber, orderquantity, productid, unitprice, unitpricediscount, orderquantity * unitprice AS total_price, modifieddate
    from {{ ref('stg_orderdetail') }}
    )

select 
    o.orderid as order_id,
    o.productid as product_id,
    o.orderdetailid as order_detail_id,
    o.carriertrackingnumber as carrier_tracking_number,
    o.orderquantity as order_quantity,
    o.unitprice as unit_price,
    o.unitpricediscount as unit_price_discount,
    o.total_price,
    o.modifieddate as modified_date,
    p.product_name
    

from orderdetail o
left join {{ ref('int_product') }} p on o.productid = p.product_id

