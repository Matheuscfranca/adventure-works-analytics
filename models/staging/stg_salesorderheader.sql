with source as (
    select * from {{ source('adventure_works', 'sales_salesorderheader') }}
)
select
    cast(salesorderid as int) as order_id,
    cast(orderdate as date) as order_date,
    cast(customerid as int) as customer_id,
    cast(territoryid as int) as territory_id,
    cast(status as int) as order_status,
    cast(subtotal as numeric(18,2)) as subtotal_amount,
    cast(taxamt as numeric(18,2)) as tax_amount,
    cast(freight as numeric(18,2)) as freight_amount,
    cast(totaldue as numeric(18,2)) as total_amount
from source