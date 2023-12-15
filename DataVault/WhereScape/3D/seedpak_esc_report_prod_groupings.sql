CREATE TABLE "seedpak_esc_report_prod_groupings"
(
    "prod" VARCHAR2(20) not null
    , "matrix" VARCHAR2(12)
    , "grouping_name" VARCHAR2(40) not null
    , "group_name" VARCHAR2(256) not null
    , "description" VARCHAR2(256)
    , "client_description" VARCHAR2(256)
    , PRIMARY KEY ("prod", "matrix")
);

