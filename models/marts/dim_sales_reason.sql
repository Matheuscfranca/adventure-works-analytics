with reasons as (
    select * from {{ ref('stg_salesreason') }}
)
select
    sales_reason_key,
    sales_reason_name,
    reason_type
from reasons