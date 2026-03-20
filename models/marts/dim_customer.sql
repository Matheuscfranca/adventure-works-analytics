with customers as (
    select * from {{ ref('stg_customer') }}
)
select
    customer_id as customer_key,
    person_id,
    store_id,
    territory_id
from customers