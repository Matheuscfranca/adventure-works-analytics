CREATE OR REPLACE VIEW analytics.stg_salesorderheader AS
SELECT
    salesorderid    AS order_id,
    orderdate       AS order_date,
    customerid      AS customer_id,
    creditcardid    AS credit_card_id,
    status          AS order_status,
    territoryid     AS territory_id,
    billtoaddressid AS bill_to_address_id,
    shiptoaddressid AS ship_to_address_id
FROM fea_academy.adventure_works.sales_salesorderheader;