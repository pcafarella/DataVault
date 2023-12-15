CREATE TABLE "project_workorder"
(
    "project_no" varchar(50) not null
    , "project_no_bkcc" varchar(255) not null
    , "project_no_tenant_id" varchar(255) not null
    , "work_order_no" varchar(50) not null
    , "work_order_no_bkcc" varchar(255) not null
    , "work_order_no_tenant_id" varchar(255) not null
    , PRIMARY KEY ("project_no", "project_no_bkcc", "project_no_tenant_id", "work_order_no", "work_order_no_bkcc", "work_order_no_tenant_id")
);

