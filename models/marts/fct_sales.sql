with sales_header as (

    select
        order_id,
        customer_id,
        order_date,
        order_status
    from {{ ref('stg_salesorderheader') }}

),

sales_detail as (

    select
        order_id,
        order_detail_id,
        product_id,
        quantity,
        unit_price,
        unit_price_discount
    from {{ ref('stg_salesorderdetail') }}

),

dim_date as (

    select
        date,
        date_key
    from {{ ref('dim_date') }}

),

base as (

    select
        sh.order_id,
        sd.order_detail_id,
        sh.order_date,
        sh.customer_id,
        sd.product_id,
        sh.order_status as status,
        cast(sd.quantity as numeric(18,2)) as quantity,
        cast(sd.unit_price as numeric(18,4)) as unit_price,
        cast(sd.unit_price_discount as numeric(18,6)) as unit_price_discount
    from sales_header sh
    inner join sales_detail sd
        on sh.order_id = sd.order_id

),

calculated as (

    select
        md5(
            concat(
                cast(order_id as string),
                '-',
                cast(order_detail_id as string)
            )
        ) as sales_key,
        order_id,
        order_detail_id,
        order_date,
        customer_id,
        product_id,
        status,
        quantity,
        unit_price,
        unit_price_discount,
        cast(quantity * unit_price as numeric(18,4)) as gross_amount_raw,
        cast(quantity * unit_price * unit_price_discount as numeric(18,4)) as discount_amount_raw,
        cast(
            (quantity * unit_price) - (quantity * unit_price * unit_price_discount)
            as numeric(18,4)
        ) as net_amount_raw
    from base

),

final as (

    select
        c.sales_key,
        c.order_id,
        c.order_detail_id,
        c.order_date,
        d.date_key,
        c.customer_id,
        c.product_id,
        c.quantity,
        cast(c.unit_price as numeric(18,2)) as unit_price,
        c.unit_price_discount,
        cast(round(c.gross_amount_raw, 2) as numeric(18,2)) as gross_amount,
        cast(round(c.discount_amount_raw, 2) as numeric(18,2)) as discount_amount,
        cast(round(c.net_amount_raw, 2) as numeric(18,2)) as net_amount,
        c.status
    from calculated c
    left join dim_date d
        on c.order_date = d.date

)

select *
from final