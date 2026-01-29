CREATE OR REPLACE VIEW analytics.dim_location AS
SELECT
    a.addressid            AS location_key,
    a.city                 AS city,
    sp.name                AS state,
    cr.name                AS country
FROM fea_academy.adventure_works.person_address a
LEFT JOIN fea_academy.adventure_works.person_stateprovince sp
    ON a.stateprovinceid = sp.stateprovinceid
LEFT JOIN fea_academy.adventure_works.person_countryregion cr
    ON sp.countryregioncode = cr.countryregioncode;
