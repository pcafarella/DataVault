CREATE TABLE "seedpak_mm_prodmatlist"
(
    "methodid" NUMBER not null
    , "prod" VARCHAR2(20) not null
    , "matnum" VARCHAR2(4) not null
    , "lastdate" DATE(7) default SYSDATE
    , "lasttool" VARCHAR2(20)
    , "lastuser" VARCHAR2(20)
    , PRIMARY KEY ("methodid", "prod", "matnum")
);

CREATE UNIQUE INDEX MM_PRODMATLIST_PK
ON "seedpak_mm_prodmatlist" ("methodid","prod","matnum");

