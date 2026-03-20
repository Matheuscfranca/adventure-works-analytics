with source as (
    select * from {{ source('adventure_works', 'sales_salesorderdetail') }}
)
select
    cast(salesorderid as int) as order_id,
    cast(salesorderdetailid as int) as order_detail_id,
    cast(productid as int) as product_id,
    cast(orderqty as int) as quantity,
    cast(unitprice as numeric(18,2)) as unit_price,
    cast(unitpricediscount as numeric(18,2)) as unit_price_discount
from source