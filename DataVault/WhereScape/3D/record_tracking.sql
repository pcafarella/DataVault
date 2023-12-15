CREATE TABLE "record_tracking"
(
    "key_value" VARCHAR2(100) not null
    , "audit_table" VARCHAR2(30) not null
    , "audit_field" VARCHAR2(30) not null
    , "audit_action" VARCHAR2(10) not null
    , "old_value" VARCHAR2(100)
    , "new_value" VARCHAR2(100)
    , "audit_user" VARCHAR2(30) not null
    , "audit_date" DATE(7) not null
    , "audit_tool" VARCHAR2(30) not null
    , PRIMARY KEY ("key_value", "audit_table", "audit_field", "audit_action")
);

CREATE INDEX LIMS_AUDIT_IDX1
ON "record_tracking" ("key_value","audit_table","audit_field","audit_action");

CREATE INDEX LIMS_AUDIT_IDX2
ON "record_tracking" ("key_value","audit_table","audit_action");

CREATE INDEX LIMS_AUDIT_IDX3
ON "record_tracking" ();

