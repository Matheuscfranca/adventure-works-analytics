with source as (
    select * from {{ source('adventure_works', 'sales_salesreason') }}
)
select
    salesreasonid as sales_reason_key,
    name as sales_reason_name,
    reasontype as reason_type
from source