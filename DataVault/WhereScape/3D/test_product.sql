CREATE TABLE "test_product"
(
    "test_no" varchar(max) not null
    , "test_no_bkcc" varchar(255) not null
    , "test_no_tenant_id" varchar(255) not null
    , "product_code" varchar(100) not null
    , "product_code_bkcc" varchar(255) not null
    , "product_code_tenant_id" varchar(255) not null
    , PRIMARY KEY ("test_no", "test_no_bkcc", "test_no_tenant_id", "product_code", "product_code_bkcc", "product_code_tenant_id")
);

CREATE INDEX Analysis
ON "test_product" ("product_code");

CREATE INDEX Sample
ON "test_product" ("test_no");

CREATE UNIQUE INDEX SAMPLEEXTRACTION_PK
ON "test_product" ("test_no_bkcc","test_no","product_code");

