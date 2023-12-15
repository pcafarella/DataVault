CREATE TABLE "personnel"
(
    "personnel_no" Varchar(50) not null
    , "personnel_no_bkcc" VARCHAR(50)
    , "tenant_id" varchar(50) not null
    , "first_name" VARCHAR(16)
    , "last_name" VARCHAR(32)
    , "business_unit" varchar(100) not null
    , PRIMARY KEY ("personnel_no", "personnel_no_bkcc", "tenant_id")
);

