CREATE TABLE "seedpak_mm_header"
(
    "methodid" NUMBER not null
    , "active" CHAR(1) not null
    , "esc_method_name" VARCHAR2(40) not null
    , "method_name" VARCHAR2(40) not null
    , "method_type" CHAR(1) not null
    , "description" VARCHAR2(100)
    , "lastdate" DATE(7) default SYSDATE  not null
    , "lasttool" VARCHAR2(20) not null
    , "lastuser" VARCHAR2(20) not null
    , "deptnum" NUMBER
    , PRIMARY KEY ("methodid")
);

CREATE UNIQUE INDEX MM_HEADER_PK
ON "seedpak_mm_header" ("methodid");

