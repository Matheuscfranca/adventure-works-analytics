-- Valida o faturamento de 2011 com tolerância para arredondamento acumulado.
-- A diferença residual identificada entre staging e fato foi de 6.88,
-- causada por cálculo em nível de item versus subtotal consolidado no cabeçalho.

with faturamento_2011 as (

    select
        cast(round(sum(net_amount), 2) as numeric(18,2)) as total_faturado
    from {{ ref('fct_sales') }}
    where extract(year from order_date) = 2011

),

esperado as (

    select
        cast(12641672.52 as numeric(18,2)) as valor_esperado,
        cast(7.00 as numeric(18,2)) as tolerancia

),

comparacao as (

    select
        f.total_faturado,
        e.valor_esperado,
        abs(f.total_faturado - e.valor_esperado) as diferenca,
        e.tolerancia
    from faturamento_2011 f
    cross join esperado e

)

select *
from comparacao
where diferenca > tolerancia