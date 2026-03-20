with credit_cards as (
    select * from {{ ref('stg_creditcard') }}
)
select
    payment_method_key,
    payment_method_name
from credit_cards