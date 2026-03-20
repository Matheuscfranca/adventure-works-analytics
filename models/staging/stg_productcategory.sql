with source as (
    select * from {{ source('adventure_works', 'production_productcategory') }}
)
select
    productcategoryid as category_id,
    name as category_name
from source