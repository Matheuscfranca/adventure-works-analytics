with source as (
    select * from {{ source('adventure_works', 'production_product') }}
)
select
    cast(productid as int) as product_id,
    cast(name as string) as product_name,
    cast(productnumber as string) as product_number,
    cast(color as string) as color,
    cast(safetystocklevel as int) as safety_stock_level,
    cast(standardcost as numeric(18,2)) as standard_cost,
    cast(listprice as numeric(18,2)) as list_price,
    cast(productsubcategoryid as int) as subcategory_id
from source