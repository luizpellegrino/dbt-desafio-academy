with orderdetail as (select orderid, orderdetailid, carriertrackingnumber, orderquantity,  unitprice, orderquantity * unitprice AS total_price, modifieddate
    from {{ ref('stg_orderdetail') }}
    )

select 
    orderid as order_id,
    orderdetailid as order_detail_id,
    carriertrackingnumber as carrier_tracking_number,
    orderquantity as order_quantity,
    unitprice as unit_price,
    total_price,
    modifieddate as modified_date

from orderdetail







