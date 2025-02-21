with
    product as (select productid, productname, productnumber, productcolor, modifieddate
    from  {{ ref('stg_product') }}
    )

select 
    productid as product_id,
    productname as product_name,
    productnumber as product_number,
      COALESCE(productcolor, 'none') AS product_color,
    case 
        when modifieddate > DATEADD(day, -30, current_date()) then 'Active' 
        else 'Inactive' 
    end as product_status,
    modifieddate as modified_date

from product