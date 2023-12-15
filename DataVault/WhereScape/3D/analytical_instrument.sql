CREATE TABLE "analytical_instrument"
(
    "instrument_no" VARCHAR2(50) not null
    , "instrument_no_bkcc" varchar(50) not null
    , "tenant_id" varchar(255) not null
    , "certification_req" VARCHAR2(1) not null
    , "service_status" VARCHAR2(1) not null
    , "instrument_type" VARCHAR2(20) not null
    , "instrument_model" VARCHAR2(80)
    , "serial_number" VARCHAR2(80)
    , "description" VARCHAR2(240)
    , "location" VARCHAR2(80)
    , "calib_days" NUMBER
    , "calib_desc" VARCHAR2(240)
    , "last_calib" DATE(7)
    , "next_calib" DATE(7)
    , "service_days" NUMBER
    , "service_desc" VARCHAR2(240)
    , "last_service" DATE(7)
    , "next_service" DATE(7)
    , "capacity" NUMBER
    , "capacity_samp_test" VARCHAR2(1)
    , "instrument_cost" NUMBER(20,0)
    , "lasttool" VARCHAR2(20)
    , "lastuser" VARCHAR2(20)
    , "lastdate" DATE(7)
    , "computername" VARCHAR2(20)
    , "datapath" VARCHAR2(240)
    , "raw_data_mode" VARCHAR2(1)
    , "analysis_location_code" VARCHAR2(20)
    , "tzcode" VARCHAR2(10)
    , PRIMARY KEY ("instrument_no", "instrument_no_bkcc", "tenant_id")
);

CREATE UNIQUE INDEX INSTRUMENT1
ON "analytical_instrument" ("instrument_no");

