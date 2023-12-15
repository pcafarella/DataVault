CREATE TABLE "test_invoice"
(
    "test_no" varchar(4000) not null
    , "test_no_bkcc" varchar(255) not null
    , "test_no_tenant_id" varchar(255) not null
    , "invoice_no" varchar(50) not null
    , "invoice_no_bkcc" nvarchar(255) not null
    , "invoice_no_tenant_id" VARCHAR(255) not null
    , PRIMARY KEY ("test_no", "test_no_bkcc", "test_no_tenant_id", "invoice_no", "invoice_no_bkcc", "invoice_no_tenant_id")
);

CREATE INDEX ORDERMAST_PROD
ON "test_invoice" ();

CREATE UNIQUE INDEX ORDERMAST1
ON "test_invoice" ();

