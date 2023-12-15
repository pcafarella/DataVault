CREATE TABLE "department_instrument_run"
(
    "department_no" varchar(50) not null
    , "department_no_bkcc" varchar(50) not null
    , "department_no_tenant_id" varchar(50) not null
    , "sample_no" VARCHAR(50) not null
    , "sample_no_bkcc" VARCHAR(255) not null
    , "sample_no_tenant_id" VARCHAR(255) not null
    , "instrument_no" VARCHAR(50) not null
    , "instrument_no_bkcc" VARCHAR(50) not null
    , "instrument_no_tenant_id" VARCHAR(50) not null
    , "analysis_process_code" VARCHAR2(20) not null
    , "analysis_process_code_bkcc" VARCHAR(50) not null
    , "analysis_process_code_tenant_id" VARCHAR(50) not null
    , "process_occurence_no" VARCHAR2(50) not null
    , "instrument_run_no" VARCHAR2(20) not null
    , "audit_seq" NUMBER not null
    , "samp_tag" VARCHAR2(10)
    , "login_seq" NUMBER
    , "list_joinid" VARCHAR2(20) not null
    , "snapshot_flag" VARCHAR2(1) not null
    , "dkey_flag" VARCHAR2(1) not null
    , "parm_validate_flag" VARCHAR2(1) not null
    , "dkey_cnt" NUMBER
    , "pchain_id" VARCHAR2(20)
    , "calcid" VARCHAR2(20)
    , "process_step" NUMBER
    , "process_id" VARCHAR2(30)
    , "nextprocess_id" VARCHAR2(30)
    , "process_status" VARCHAR2(1) not null
    , "process_message" VARCHAR2(100)
    , "reqavail_flag" VARCHAR2(1) not null
    , "calcavail_flag" VARCHAR2(1) not null
    , "approval_status" VARCHAR2(4) not null
    , "galp_id" NUMBER
    , "input_seq" NUMBER
    , "inputdate" DATE(7)
    , "samp_type" VARCHAR2(20) not null
    , "link_id" VARCHAR2(20)
    , "enterdate" DATE(7) not null
    , "prep_date1" DATE(7)
    , "prep_date2" DATE(7)
    , "measuredate" DATE(7)
    , "rptremarks" VARCHAR2(100)
    , "comments" VARCHAR2(90)
    , "lastdate" DATE(7)
    , "lastuser" VARCHAR2(20)
    , "lasttool" VARCHAR2(20)
    , "analysis_type" VARCHAR2(10)
    , "analysis_count" NUMBER
    , "rpt_mdl" CHAR(1)
    , "virtual_set" NUMBER(19,0)
    , "worknum" VARCHAR2(20)
    , "tic" NUMBER
    , "run_date" DATE(7)
    , "run_type" VARCHAR2(10)
    , "analyst" VARCHAR2(30)
    , "description" VARCHAR2(60)
    , PRIMARY KEY ("department_no", "department_no_bkcc", "department_no_tenant_id", "sample_no", "sample_no_bkcc", "sample_no_tenant_id", "instrument_no", "instrument_no_bkcc", "instrument_no_tenant_id", "analysis_process_code", "analysis_process_code_bkcc", "analysis_process_code_tenant_id", "process_occurence_no")
);

CREATE UNIQUE INDEX SAMPHEADER1
ON "department_instrument_run" ("process_occurence_no");

CREATE UNIQUE INDEX SAMPHEADER2
ON "department_instrument_run" ("samp_tag","list_joinid");

CREATE INDEX SAMPHEADER3
ON "department_instrument_run" ("samp_tag","list_joinid");

CREATE INDEX SAMPHEADER4
ON "department_instrument_run" ("samp_tag","list_joinid");

CREATE INDEX SAMPHEADER5
ON "department_instrument_run" ("galp_id");

CREATE INDEX SAMPHEADER6
ON "department_instrument_run" ("virtual_set");

CREATE INDEX SAMPHEADER7
ON "department_instrument_run" ("approval_status");

