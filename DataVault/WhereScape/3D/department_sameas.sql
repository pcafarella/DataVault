CREATE TABLE "department_sameas"
(
    "department_no" varchar(50) not null
    , "department_no_bkcc" varchar(50) not null
    , "department_no_tenant_id" varchar(50) not null
    , "sameas_department_no" varchar(50) not null
    , "sameas_department_no_bkcc" varchar(50) not null
    , "sameas_department_tenant_id" varchar(50) not null
    , PRIMARY KEY ("department_no", "department_no_bkcc", "department_no_tenant_id", "sameas_department_no", "sameas_department_no_bkcc", "sameas_department_tenant_id")
);

