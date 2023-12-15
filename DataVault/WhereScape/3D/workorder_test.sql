CREATE TABLE "workorder_test"
(
    "work_order_no" nvarchar(50) not null
    , "work_order_no_bkcc" nvarchar(255) not null
    , "work_order_no_tenant_id" varchar(255) not null
    , "test_no" nvarchar(max) not null
    , "test_no_bkcc" varchar(255) not null
    , "test_no_tenant_id" varchar(255) not null
    , PRIMARY KEY ("work_order_no", "work_order_no_bkcc", "work_order_no_tenant_id", "test_no", "test_no_bkcc", "test_no_tenant_id")
);

CREATE INDEX Analysis
ON "workorder_test" ("test_no");

CREATE INDEX Sample
ON "workorder_test" ("work_order_no");

CREATE UNIQUE INDEX SAMPLEEXTRACTION_PK
ON "workorder_test" ("work_order_no_bkcc","work_order_no","test_no");

