CREATE TABLE "personnel_supervisor"
(
    "personnel_no" varchar(50) not null
    , "personnel_no_bkcc" VARCHAR(50) not null
    , "personnel_tenant_id" varchar(50) not null
    , "personnel_supervisor_no" varchar(50) not null
    , "personnel_supervisor_no_bkcc" VARCHAR(50) not null
    , "personnel_supervisor_tenant_id" varchar(50) not null
    , "reports to legal first name" VARCHAR(16)
    , "reports to legal last name" VARCHAR(32)
    , PRIMARY KEY ("personnel_no", "personnel_no_bkcc", "personnel_tenant_id", "personnel_supervisor_no", "personnel_supervisor_no_bkcc", "personnel_supervisor_tenant_id")
);

