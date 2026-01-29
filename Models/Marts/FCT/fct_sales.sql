CREATE OR REPLACE VIEW analytics.fct_sales AS
SELECT
    d.date_key                            AS date_key,
    p.product_key                         AS product_key,
    c.customer_key                        AS customer_key,
    l.location_key                        AS location_key,
    s.status_key                          AS status_key,
    COALESCE(pm.payment_method_key, -1)   AS payment_method_key,

    sd.orderqty                           AS quantity,

    sd.orderqty
      * sd.unitprice
      * (1 - sd.unitpricediscount)        AS gross_amount

FROM analytics.stg_salesorderdetail sd

INNER JOIN analytics.stg_salesorderheader sh
    ON sd.order_id = sh.order_id

LEFT JOIN analytics.dim_date d
    ON sh.order_date = d.date

LEFT JOIN analytics.dim_product p
    ON sd.product_id = p.product_key

LEFT JOIN analytics.dim_customer c
    ON sh.customer_id = c.customer_key

LEFT JOIN analytics.dim_location l
    ON sh.ship_to_address_id = l.location_key

LEFT JOIN analytics.dim_order_status s
    ON sh.order_status = s.status_key

LEFT JOIN analytics.dim_payment_method pm
    ON sh.credit_card_id = pm.payment_method_key;

    SELECT
    s.status_name,
    COUNT(*)                AS rows_qty,
    SUM(f.quantity)         AS items_qty,
    SUM(f.gross_amount)     AS gross_amount
FROM analytics.fct_sales f
JOIN analytics.dim_order_status s
    ON f.status_key = s.status_key
GROUP BY s.status_name
ORDER BY s.status_name;