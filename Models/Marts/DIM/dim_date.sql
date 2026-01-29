CREATE OR REPLACE VIEW analytics.dim_date AS
SELECT DISTINCT
    CAST(date_format(order_date, 'yyyyMMdd') AS INT) AS date_key,
    CAST(order_date AS DATE)                       AS date,
    year(order_date)                               AS year,
    month(order_date)                              AS month,
    quarter(order_date)                            AS quarter,
    CASE 
        WHEN dayofweek(order_date) IN (1, 7) THEN true 
        ELSE false 
    END                                            AS is_weekend
FROM analytics.stg_salesorderheader;

