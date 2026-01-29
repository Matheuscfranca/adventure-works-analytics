CREATE OR REPLACE VIEW analytics.fct_sales_reason AS
SELECT
    sr_link.salesorderid AS order_id,
    sr.sales_reason_key AS sales_reason_key
FROM fea_academy.adventure_works.sales_salesorderheadersalesreason sr_link
JOIN analytics.dim_sales_reason sr
  ON sr_link.salesreasonid = sr.sales_reason_key;
SHOW TABLES IN analytics;