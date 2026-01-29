CREATE OR REPLACE VIEW analytics.dim_sales_reason AS
SELECT
    sr.salesreasonid   AS sales_reason_key,
    sr.name            AS sales_reason_name
FROM fea_academy.adventure_works.sales_salesreason sr;
