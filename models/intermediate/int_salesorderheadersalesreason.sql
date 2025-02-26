WITH int_salesorderheadersalesreason AS (
    SELECT 
        salesreasonid, 
        salesorderid, 
        modifieddate
    FROM raw_adventure_works.salesorderheadersalesreason
)

SELECT 
    salesreasonid AS sales_reason_id,
    salesorderid AS sales_order_id,
    modifieddate AS modified_date
    
FROM int_salesorderheadersalesreason



