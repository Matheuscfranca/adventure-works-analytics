CREATE OR REPLACE VIEW analytics.dim_customer AS
SELECT
    c.customerid                                           AS customer_key,
    COALESCE(
        CONCAT(p.firstname, ' ', p.lastname),
        s.name
    )                                                       AS customer_name,
    CASE
        WHEN p.businessentityid IS NOT NULL THEN 'Individual'
        ELSE 'Corporate'
    END                                                     AS customer_type
FROM fea_academy.adventure_works.sales_customer c
LEFT JOIN fea_academy.adventure_works.person_person p
    ON c.personid = p.businessentityid
LEFT JOIN fea_academy.adventure_works.sales_store s
    ON c.storeid = s.businessentityid;
