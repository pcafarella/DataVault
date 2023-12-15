CREATE TABLE "analysis_process"
(
    "analysis_process_code" VARCHAR2(50) not null
    , "analysis_process_code_bkcc" VARCHAR(50) not null
    , "tenant_id" VARCHAR(255) not null
    , PRIMARY KEY ("analysis_process_code", "analysis_process_code_bkcc", "tenant_id")
);

