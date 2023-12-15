CREATE TABLE "invoice_workorder"
(
    "invoice_no" varchar(50) not null
    , "invoice_no_bkcc" VARCHAR(255) not null
    , "invoice_no_tenant_id" VARCHAR(15) not null
    , "work_order_no" varchar(50) not null
    , "work_order_no_bkcc" varchar(255) not null
    , "work_order_no_tenant_id" varchar(255) not null
    , PRIMARY KEY ("invoice_no", "invoice_no_bkcc", "invoice_no_tenant_id", "work_order_no", "work_order_no_bkcc", "work_order_no_tenant_id")
);

