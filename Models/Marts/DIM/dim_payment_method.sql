CREATE OR REPLACE VIEW analytics.dim_payment_method AS
SELECT DISTINCT
    COALESCE(cc.creditcardid, -1)        AS payment_method_key,
    CASE
        WHEN cc.creditcardid IS NOT NULL THEN 'Credit Card'
        ELSE 'Other'
    END                                  AS payment_method_name,
    cc.cardtype                          AS card_type
FROM fea_academy.adventure_works.sales_salesorderheader soh
LEFT JOIN fea_academy.adventure_works.sales_creditcard cc
    ON soh.creditcardid = cc.creditcardid;
    SELECT
    -1 AS payment_method_key,
    'Cash / Other' AS payment_method_name,
    NULL AS card_type

