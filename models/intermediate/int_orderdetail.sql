with orderdetail as (select orderid, productid, orderdetailid, carriertrackingnumber, orderquantity,  unitprice, orderquantity * unitprice AS total_price, modifieddate
    from {{ ref('stg_orderdetail') }}
    )

select 
    orderid as order_id,
    productid as product_id,
    orderdetailid as order_detail_id,
    coalesce(carriertrackingnumber, 'None') as carrier_tracking_number,
    orderquantity as order_quantity,
    unitprice as unit_price,
    total_price,
    modifieddate as modified_date

from orderdetail






