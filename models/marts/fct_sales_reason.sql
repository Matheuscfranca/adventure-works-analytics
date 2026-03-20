with header_reason as (
    select * from {{ ref('stg_salesorderheadersalesreason') }}
),
reasons as (
    select * from {{ ref('stg_salesreason') }}
)
select
    cast(hr.order_id as string) || '-' || cast(hr.sales_reason_key as string) as sales_reason_key,
    hr.order_id,
    hr.sales_reason_key as sales_reason_id,
    r.sales_reason_name
from header_reason hr
join reasons r on hr.sales_reason_key = r.sales_reason_key