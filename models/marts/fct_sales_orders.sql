with
    orders as (
        select
            salesorderid,
            orderdate,
            duedate,
            shipdate,
            status,
            onlineorderflag,
            purchaseordernumber,
            accountnumber,
            customerid,
            salespersonid,
            territoryid,
            billtoaddressid,
            shiptoaddressid,
            shipmethodid,
            creditcardid,
            creditcardapprovalcode,
            currencyrateid,
            taxamt,
            freight,
            totaldue,
            rowguid,
            modifieddate
        from {{ source("raw_adventure_works", "salesorderheader") }}
    )

select
    salesorderid as order_id,

    cast(orderdate as date) as order_date,
    shipdate as ship_date,
    status,
    onlineorderflag as online_order_flag,
    coalesce(purchaseordernumber, 'None') as purchase_order_number,
    accountnumber as account_number,
    customerid as customer_id,
    salespersonid as sales_person_id,
    territoryid as territory_id,
    billtoaddressid as billtoaddress_id,
    coalesce (shiptoaddressid, 'None') as shiptoaddress_id,
    shipmethodid as ship_method_id,
    creditcardid as credit_card_id,
    coalesce(currencyrateid, '0') as currencyrate_id,
    taxamt,
    totaldue as total_due,
    modifieddate as modified_date,
    year(cast(orderdate as date)) as order_year,
    month(cast(orderdate as date)) as order_month,
    
from orders 

