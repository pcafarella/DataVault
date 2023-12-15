CREATE TABLE "test_invoice_credit"
(
    "invoice_no" nvarchar(50) not null
    , "invoice_no_bkcc" nvarchar(255) not null
    , "invoice_no_tenant_id" nvarchar(255) not null
    , "test_no" nvarchar(255) not null
    , "test_no_bkcc" nvarchar(255) not null
    , "test_no_tenant_id" nvarchar(255) not null
    , "reference" nvarchar(10) not null
    , "iscredit" bit not null
    , "rtat" smallint
    , "atat" smallint
    , "analysis" nvarchar(50) not null
    , "price" real
    , "surcharge" real
    , PRIMARY KEY ("invoice_no", "invoice_no_bkcc", "invoice_no_tenant_id", "test_no", "test_no_bkcc", "test_no_tenant_id", "reference")
);

CREATE INDEX Invoice
ON "test_invoice_credit" ("invoice_no");

CREATE UNIQUE INDEX INVOICECREDIT_PK
ON "test_invoice_credit" ("invoice_no","test_no","reference");

CREATE INDEX Reference
ON "test_invoice_credit" ("reference");

CREATE INDEX Wrk
ON "test_invoice_credit" ("test_no");

