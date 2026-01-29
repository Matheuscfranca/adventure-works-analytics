CREATE OR REPLACE VIEW analytics.stg_salesorderdetail AS
SELECT
    salesorderid        AS order_id,
    productid           AS product_id,
    orderqty            AS orderqty,
    unitprice           AS unitprice,
    unitpricediscount   AS unitpricediscount
FROM fea_academy.adventure_works.sales_salesorderdetail;
