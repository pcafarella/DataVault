CREATE TABLE "department_test_status"
(
    "department_no" VARCHAR2(50) not null
    , "department_no_bkcc" VARCHAR(50) not null
    , "department_no_tenant_id" VARCHAR(255) not null
    , "test_no" VARCHAR2(20) not null
    , "test_no_bkcc" VARCHAR(50) not null
    , "test_no_tenant_id" VARCHAR(50) not null
    , "process_status_code" VARCHAR2(4) not null
    , "process_status_date" DATE(7) not null
    , "process_status_batch_no" VARCHAR2(20)
    , "dstatusdate" DATE(7)
    , "lasttool" VARCHAR2(20)
    , "lastuser" VARCHAR2(20)
    , "schedule_seq" NUMBER(8,0) not null
    , "val_date" DATE(7)
    , "val_by" VARCHAR2(4)
    , "offhold" DATE(7)
    , "offhold_by" VARCHAR2(4)
    , "uv_flag" VARCHAR2(1)
    , "cancel_date" DATE(7)
    , "cancel_by" VARCHAR2(4)
    , "afoot_date" DATE(7)
    , "afoot_by" VARCHAR2(4)
    , "batch_date" DATE(7)
    , "batch_by" VARCHAR2(4)
    , PRIMARY KEY ("department_no", "department_no_bkcc", "department_no_tenant_id", "test_no", "test_no_bkcc", "test_no_tenant_id", "process_status_code", "process_status_date")
);

