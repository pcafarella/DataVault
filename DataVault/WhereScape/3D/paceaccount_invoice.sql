CREATE TABLE "paceaccount_invoice"
(
    "invoice_no" varchar(50) not null
    , "invoice_no_bkcc" varchar(255) not null
    , "invoice_no_tenant_id" VARCHAR2(255) not null
    , "pace_account_no" VARCHAR2(50) not null
    , "pace_account_no_bkcc" varchar(255) not null
    , "pace_account_no_tenant_id" varchar(255) not null
    , PRIMARY KEY ("invoice_no", "invoice_no_bkcc", "invoice_no_tenant_id", "pace_account_no", "pace_account_no_bkcc", "pace_account_no_tenant_id")
);

