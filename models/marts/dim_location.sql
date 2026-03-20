with addresses as (
    select * from {{ ref('stg_location') }}
)
select
    address_id as location_key,
    city_name as city,
    postal_code
from addresses