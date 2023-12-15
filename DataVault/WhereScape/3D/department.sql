CREATE TABLE "department"
(
    "department_no" varchar(50) not null
    , "department_no_bkcc" varchar(50) not null
    , "tenant_id" varchar(50) not null
    , "department_name" VARCHAR2(100)
    , "department_short_name" VARCHAR2(50)
    , "department_type" varchar(14)
    , "department_level" tinyint
    , "deptacctref" VARCHAR2(20)
    , "qcskip_flag" VARCHAR2(1)
    , PRIMARY KEY ("department_no", "department_no_bkcc", "tenant_id")
);

CREATE UNIQUE INDEX DEPTDEF1
ON "department" ("department_no");

