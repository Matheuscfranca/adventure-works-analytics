CREATE OR REPLACE VIEW analytics.dim_product AS
SELECT
    p.productid                    AS product_key,
    p.name                         AS product_name,
    pc.name                        AS product_category,
    psc.name                       AS product_subcategory,
    p.color                        AS product_color
FROM fea_academy.adventure_works.production_product p
LEFT JOIN fea_academy.adventure_works.production_productsubcategory psc
    ON p.productsubcategoryid = psc.productsubcategoryid
LEFT JOIN fea_academy.adventure_works.production_productcategory pc
    ON psc.productcategoryid = pc.productcategoryid;
