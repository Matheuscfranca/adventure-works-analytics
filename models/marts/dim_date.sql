with date_series as (
    select explode(sequence(to_date('2011-01-01'), to_date('2014-12-31'), interval 1 day)) as date
)
select
    date as date_key,
    date,
    day(date) as day,
    month(date) as month,
    quarter(date) as quarter,
    year(date) as year,
    case when dayofweek(date) in (1, 7) then true else false end as is_weekend
from date_series