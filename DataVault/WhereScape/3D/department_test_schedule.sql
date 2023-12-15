CREATE TABLE "department_test_schedule"
(
    "test_no" VARCHAR(4000) not null
    , "test_no_bkcc" varchar(max) not null
    , "test_no_tenant_id" varchar(255) not null
    , "department_no" VARCHAR(50) not null
    , "department_no_bkcc" varchar(50) not null
    , "department_no_tenant_id" varchar(50) not null
    , "process_status_code" VARCHAR2(4) not null
    , "process_status_date" DATE(7) not null
    , "process_status_batch_no" VARCHAR2(20)
    , "workdate" DATE(7)
    , "workstatus" VARCHAR2(4)
    , "dprevdeptnum" NUMBER
    , "dnextdeptnum" NUMBER
    , "lasttool" VARCHAR2(20)
    , "lastuser" VARCHAR2(20)
    , "login_seq" varchar(50) not null
    , "priorityflag" VARCHAR2(3)
    , "class" VARCHAR2(1)
    , "dalloc" NUMBER
    , "dprice" NUMBER
    , "dcost" NUMBER
    , "dholddays" NUMBER
    , "dholddate" DATE(7)
    , "dduedays" NUMBER
    , "dduedate" DATE(7)
    , "schedule_id" NUMBER(12,0) not null
    , "schedule_seq" NUMBER(12,0) not null
    , "schedule_type" VARCHAR2(1)
    , "active_flag" VARCHAR2(1)
    , "cmp_list" VARCHAR2(15)
    , "comp_date" DATE(7)
    , "cond_code" VARCHAR2(2)
    , "container_seq" NUMBER(12,0)
    , "create_date" DATE(7) not null
    , "display_rank" NUMBER(2,0)
    , "due_date" DATE(7)
    , "flags" VARCHAR2(10)
    , "hold_date" DATE(7)
    , "note" VARCHAR2(250)
    , "open_queue" VARCHAR2(4)
    , "original_schedule" NUMBER(9,0)
    , "paired_schedule" NUMBER(9,0)
    , "proc_code" VARCHAR2(10)
    , "qty" NUMBER(7,2)
    , "queue" VARCHAR2(4) not null
    , "thread" NUMBER(9,0)
    , "user_nbr" VARCHAR2(4)
    , "virtual_batch_trigger" NUMBER(1,0)
    , "virtual_queue" VARCHAR2(4)
    , "epic_flags" VARCHAR2(20)
    , "last_update" DATE(7) default SYSDATE not null
    , PRIMARY KEY ("test_no", "test_no_bkcc", "test_no_tenant_id", "department_no", "department_no_bkcc", "department_no_tenant_id")
);

