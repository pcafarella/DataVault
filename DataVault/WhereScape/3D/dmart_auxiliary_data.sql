CREATE TABLE "dmart_auxiliary_data"
(
    "system_id" VARCHAR2(15) not null
    , "aux_data_format" VARCHAR2(4) not null
    , "field_number" NUMBER(2,0) not null
    , "choice_list" VARCHAR2(6)
    , "field_length" NUMBER(4,0)
    , "flags" VARCHAR2(8)
    , "prompt" VARCHAR2(30)
    , "rec_code" VARCHAR2(3)
    , PRIMARY KEY ("system_id", "aux_data_format", "field_number")
);

