with source as (
    select * from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}
)
select
    cast(salesorderid as int) as order_id,
    cast(salesreasonid as int) as sales_reason_key
from source