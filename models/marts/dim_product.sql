with products as (
    select * from {{ ref('stg_product') }}
),
subcategories as (
    select * from {{ ref('stg_productsubcategory') }}
),
categories as (
    select * from {{ ref('stg_productcategory') }}
)
select
    p.product_id as product_key,
    p.product_name,
    pc.category_name as product_category,
    psc.subcategory_name as product_subcategory,
    p.color as product_color
from products p
left join subcategories psc on p.subcategory_id = psc.subcategory_id
left join categories pc on psc.category_id = pc.category_id