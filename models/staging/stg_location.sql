with source as (
    select * from {{ source('adventure_works', 'person_address') }}
)

select
    cast(addressid as int) as address_id,
    cast(city as string) as city_name,
    cast(stateprovinceid as int) as state_province_id,
    cast(postalcode as string) as postal_code
from source