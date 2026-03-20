with pedidos as (
    select * from {{ ref('stg_salesorderheader') }}
),
detalhes as (
    select * from {{ ref('stg_salesorderdetail') }}
)
select
    cast(p.order_id as string) || '-' || cast(d.order_detail_id as string) as sales_key,
    p.order_id,
    p.order_date as date_key,
    p.customer_id as customer_key,
    d.product_id as product_key,
    p.territory_id as location_key,
    d.quantity,
    d.unit_price,
    d.unit_price_discount,
    cast(d.quantity * d.unit_price as numeric(18,2)) as gross_amount,
    cast((d.quantity * d.unit_price) * (1 - d.unit_price_discount) as numeric(18,2)) as net_amount
from pedidos p
join detalhes d on p.order_id = d.order_id