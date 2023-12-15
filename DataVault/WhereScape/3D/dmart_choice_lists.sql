CREATE TABLE "dmart_choice_lists"
(
    "ctab_id" VARCHAR2(15) not null
    , "code_type" VARCHAR2(6) not null
    , "legal_value" VARCHAR2(12)
    , "flags" VARCHAR2(10)
    , "choice_seq" NUMBER
    , "choice_desc" VARCHAR2(30)
    , "sort_item" NUMBER(4,0)
    , PRIMARY KEY ("ctab_id", "code_type", "legal_value", "flags")
);

