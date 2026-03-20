with source as (
    select * from {{ source('adventure_works', 'sales_creditcard') }}
)
select
    creditcardid as payment_method_key,
    cardtype as payment_method_name
from source