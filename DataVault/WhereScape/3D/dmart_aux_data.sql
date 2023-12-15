CREATE TABLE "dmart_aux_data"
(
    "system_id" VARCHAR2(15) not null
    , "aux_data_seq" NUMBER(12,0) not null
    , "aux_data" VARCHAR2(500)
    , "aux_data_format" VARCHAR2(4)
    , "aux_data_id" NUMBER(10,0)
    , "aux_data_type" VARCHAR2(1)
    , "aux_field" NUMBER(2,0)
    , "archive_vol" NUMBER(4,0)
    , PRIMARY KEY ("system_id", "aux_data_seq")
);

