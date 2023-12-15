CREATE TABLE "analysis_process_product"
(
    "analysis_process_code" VARCHAR2(50) not null
    , "analysis_process_code_bkcc" VARCHAR2(50) not null
    , "analysis_process_code_tenant_id" VARCHAR2(255) not null
    , "product_code" VARCHAR2(50) not null
    , "product_code_bkcc" VARCHAR2(50) not null
    , "product_code_tenant_id" VARCHAR2(255) not null
    , "link_id" VARCHAR2(20) not null
    , "description" VARCHAR2(40)
    , "list_pointer" VARCHAR2(20)
    , "list_func" VARCHAR2(40) not null
    , "parm_stored" VARCHAR2(40)
    , "pchain_name" VARCHAR2(30)
    , PRIMARY KEY ("analysis_process_code", "analysis_process_code_bkcc", "analysis_process_code_tenant_id", "product_code", "product_code_bkcc", "product_code_tenant_id")
);

CREATE UNIQUE INDEX INDEX2
ON "analysis_process_product" ("product_code","product_code_bkcc","analysis_process_code","list_func");

CREATE UNIQUE INDEX LISTLINK1
ON "analysis_process_product" ("link_id");

CREATE UNIQUE INDEX LISTLINK2
ON "analysis_process_product" ("product_code","product_code_bkcc","list_pointer");

