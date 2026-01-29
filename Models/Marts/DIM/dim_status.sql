CREATE OR REPLACE VIEW analytics.dim_status AS
SELECT DISTINCT
    status            AS status_key,
    CASE status
        WHEN 1 THEN 'In Process'
        WHEN 2 THEN 'Approved'
        WHEN 3 THEN 'Backordered'
        WHEN 4 THEN 'Rejected'
        WHEN 5 THEN 'Shipped'
        ELSE 'Unknown'
    END                AS status_name
FROM fea_academy.adventure_works.sales_salesorderheader;
