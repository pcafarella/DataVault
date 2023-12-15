CREATE TABLE "product_parent"
(
    "product_code" varchar(50) not null
    , "product_code_bkcc" VARCHAR(255) not null
    , "product_code_tenant_id" VARCHAR(255) not null
    , "parent_product_code" varchar(50) not null
    , "parent_product_code_bkcc" varchar(255) not null
    , "parent_product_code_tenant_id" varchar(255) not null
    , "priceratio" real
);

COMMENT ON TABLE "product_parent"
IS 'This is the actual parent - child relationship that is present in National and Element.   It is not the ''Parent Acode'' idea from the dashboards - that is Parent Produict';

