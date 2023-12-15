CREATE TABLE "customer_workorder"
(
    "account_no" VARCHAR2(50) not null
    , "account_no_bkcc" VARCHAR2(255) not null
    , "account_no_tenant_id" VARCHAR2(255) not null
    , "work_order_no" VARCHAR2(50) not null
    , "work_order_no_bkcc" VARCHAR2(255) not null
    , "work_order_no_tenant_id" VARCHAR2(255) not null
    , PRIMARY KEY ("account_no", "account_no_bkcc", "account_no_tenant_id", "work_order_no", "work_order_no_bkcc", "work_order_no_tenant_id")
);

