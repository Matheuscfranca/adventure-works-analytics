with faturamento_2011 as (
    select sum(net_amount) as total
    from {{ ref('fct_sales') }}
    where year(date_key) = 2011
)
select *
from faturamento_2011
where total != 12646112.16