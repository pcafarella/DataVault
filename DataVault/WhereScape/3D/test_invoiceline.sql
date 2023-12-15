CREATE TABLE "test_invoiceline"
(
    "test_no" varchar(50) not null
    , "test_no_bkcc" varchar(255) not null
    , "test_no_tenant_id" varchar(255) not null
    , "invoiceline_no" varchar(50) not null
    , "invoiceline_no_bkcc" nvarchar(255) not null
    , "invoiceline_no_tenant_id" VARCHAR(255) not null
    , PRIMARY KEY ("test_no", "test_no_bkcc", "test_no_tenant_id", "invoiceline_no", "invoiceline_no_bkcc", "invoiceline_no_tenant_id")
);

CREATE INDEX ORDERMAST_PROD
ON "test_invoiceline" ();

CREATE UNIQUE INDEX ORDERMAST1
ON "test_invoiceline" ();

