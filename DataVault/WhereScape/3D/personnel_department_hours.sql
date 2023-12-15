CREATE TABLE "personnel_department_hours"
(
    "personnel_no" varchar(50) not null
    , "personnel_no_bkcc" VARCHAR(50) not null
    , "personnel_no_tenant_id" varchar(50) not null
    , "department_no" varchar(50) not null
    , "department_no_bkcc" varchar(50) not null
    , "department_no_tenant_id" varchar(50) not null
    , "date_worked" datetime not null
    , "payroll_name" VARCHAR(64) not null
    , "pay_code" VARCHAR(32) not null
    , "reports_to_file_number" NUMERIC(7,0) not null
    , "hours" NUMERIC(4,2)
    , "business_unit" varchar(100) not null
    , PRIMARY KEY ("personnel_no", "personnel_no_bkcc", "personnel_no_tenant_id", "department_no", "department_no_bkcc", "department_no_tenant_id", "date_worked", "payroll_name", "pay_code")
);

