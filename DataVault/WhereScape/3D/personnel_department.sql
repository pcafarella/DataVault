CREATE TABLE "personnel_department"
(
    "personnel_no" varchar(50) not null
    , "personnel_no_bkcc" VARCHAR(50) not null
    , "personnel_no_tenant_id" varchar(50) not null
    , "department_no" varchar(50) not null
    , "department_no_bkcc" varchar(50) not null
    , "department_no_tenant_id" varchar(50) not null
    , "home department description" VARCHAR(32)
    , "payroll_company_code" varchar(64)
    , PRIMARY KEY ("personnel_no", "personnel_no_bkcc", "personnel_no_tenant_id", "department_no", "department_no_bkcc", "department_no_tenant_id")
);

