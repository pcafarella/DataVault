CREATE TABLE "seedpak_prep_data"
(
    "samplenum" VARCHAR2(20)
    , "worknum" VARCHAR2(20)
    , "datapoint_id" NUMBER not null
    , "datavalue" VARCHAR2(40)
    , "lastdate" DATE(7) not null
    , "lasttool" VARCHAR2(20) not null
    , "lastuser" VARCHAR2(20) not null
    , "sampletype_id" NUMBER
    , "subcontainer" VARCHAR2(20)
    , "repl_id" NUMBER
    , PRIMARY KEY ("samplenum", "worknum", "datapoint_id")
);

CREATE INDEX DATAVALUE
ON "seedpak_prep_data" ("datavalue");

CREATE INDEX PREP_DATA_UDX1
ON "seedpak_prep_data" ("samplenum","worknum","datapoint_id");

CREATE INDEX PREP_DATA_WORKNUM
ON "seedpak_prep_data" ("worknum");

