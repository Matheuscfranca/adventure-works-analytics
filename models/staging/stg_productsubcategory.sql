with source as (
    select * from {{ source('adventure_works', 'production_productsubcategory') }}
)
select
    productsubcategoryid as subcategory_id,
    productcategoryid as category_id,
    name as subcategory_name
from source