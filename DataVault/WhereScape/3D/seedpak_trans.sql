CREATE TABLE "seedpak_trans"
(
    "column_name" VARCHAR2(40)
    , "from_value" VARCHAR2(40)
    , "to_value" VARCHAR2(200)
    , "application" VARCHAR2(10)
    , "specific" VARCHAR2(40)
    , "lastdate" DATE(7) default sysdate  not null
    , "lastuser" VARCHAR2(30) default SUBSTR(sys_context('USERENV','OS_USER'),1,30)  not null
    , "lasttool" VARCHAR2(30) default SUBSTR(sys_context('USERENV','HOST'),1,30)  not null
);

CREATE INDEX TRANS1
ON "seedpak_trans" ("column_name","from_value");

CREATE INDEX TRANS2
ON "seedpak_trans" ("application","specific","column_name");

