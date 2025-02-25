with
    stg_orderdetail as (
        select salesorderid as orderid, salesorderdetailid as orderdetailid, carriertrackingnumber, orderqty as orderquantity, unitprice, modifieddate, productid, specialofferid
        from {{ source("raw_adventure_works", "salesorderdetail") }}

    )

select *
from stg_orderdetail

