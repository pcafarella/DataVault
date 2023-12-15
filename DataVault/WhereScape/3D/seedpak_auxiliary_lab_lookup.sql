CREATE TABLE "seedpak_auxiliary_lab_lookup"
(
    "acctnum" VARCHAR2(20)
    , "tzcode" VARCHAR2(10)
    , "product_prefix" VARCHAR2(5)
    , "date_added" DATE(7) default sysdate
    , "last_date" DATE(7) default sysdate
    , "last_user" VARCHAR2(20)
    , "last_tool" VARCHAR2(20)
    , "account_prefix" VARCHAR2(5)
    , PRIMARY KEY ("acctnum")
);

