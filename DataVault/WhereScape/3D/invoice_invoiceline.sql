CREATE TABLE "invoice_invoiceline"
(
    "invoice_no" varchar(50) not null
    , "invoice_no_bkcc" varchar(255) not null
    , "invoice_no_tenant_id" varchar(255) not null
    , "invoiceline_no" NUMBER(12,0) not null
    , "invoiceline_no_bkcc" nvarchar(255) not null
    , "invoiceline_no_tenant_id" VARCHAR(255) not null
    , PRIMARY KEY ("invoice_no", "invoice_no_bkcc", "invoice_no_tenant_id", "invoiceline_no", "invoiceline_no_bkcc", "invoiceline_no_tenant_id")
);

CREATE INDEX ORDERMAST_PROD
ON "invoice_invoiceline" ();

CREATE UNIQUE INDEX ORDERMAST1
ON "invoice_invoiceline" ();

