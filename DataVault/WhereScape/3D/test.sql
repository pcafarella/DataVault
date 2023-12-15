CREATE TABLE "test"
(
    "test_no" nvarchar(4000) not null
    , "test_no_bkcc" nvarchar(255) not null
    , "tenant_id" VARCHAR(255) not null
    , "matrix" NVARCHAR(50) not null
    , "proc_code" VARCHAR2(50)
    , "versionid" nvarchar(50)
    , "laboratory" nvarchar(50)
    , "qccode" nvarchar(255)
    , "due" datetime
    , "expdue" datetime
    , "hold" real
    , "holda" real
    , "price" numeric(28,2)
    , "surcharge" NUMBER(8,2)
    , "logcomments" nvarchar(255)
    , "rtat" smallint
    , "atat" smallint
    , "isreextract" bit not null
    , "isbatchqc" bit not null
    , "issequenceqc" bit not null
    , "istracking" bit not null
    , "retype" smallint
    , "batch" nvarchar(7)
    , "designator" nvarchar(20)
    , "anadesignator" nvarchar(20)
    , "defaultdesignator" nvarchar(20)
    , "initial" real
    , "final" real
    , "tinitial" real
    , "tfinal" real
    , "isdecanted" bit not null
    , "extractionph" real
    , "extractionsolids" real
    , "exinfo1" nvarchar(50)
    , "exinfo2" nvarchar(50)
    , "exinfo3" nvarchar(50)
    , "exinfo4" nvarchar(50)
    , "exinfo5" nvarchar(50)
    , "leached" datetime
    , "leachedby" nvarchar(10)
    , "extracted" datetime
    , "extractedby" nvarchar(10)
    , "reviewed" datetime
    , "surrogateamount" real
    , "surrogateaamount" real
    , "extractioncomments" nvarchar(255)
    , "status" nvarchar(20)
    , "statusdate" datetime
    , "initials" nvarchar(10)
    , "substatus" nvarchar(20)
    , "substatusdate" datetime
    , "substatusinfo" nvarchar(50)
    , "subreceiveddate" datetime
    , "assignedanalyst" nvarchar(50)
    , "anabatch" nvarchar(10)
    , "anaorder" smallint
    , "istdid" nvarchar(10)
    , "isontime" bit not null
    , "isqcreq" bit not null
    , "rptdate" datetime
    , "assignedfacility" nvarchar(50)
    , "created" datetime
    , "createdby" nvarchar(50)
    , "batched" datetime
    , "batchedby" nvarchar(50)
    , "anabatched" datetime
    , "anabatchedby" nvarchar(50)
    , "pkey" VARCHAR2(20) not null
    , "plevel" NUMBER
    , "pprodref" VARCHAR2(20)
    , "pmatnumref" VARCHAR2(4)
    , "class" VARCHAR2(1)
    , "cost" NUMBER(12,2) default 0 not null
    , "holddate" DATE(7)
    , "holddays" NUMBER
    , "holdflg" VARCHAR2(1)
    , "duedate" DATE(7)
    , "duedays" NUMBER
    , "location" VARCHAR2(20)
    , "bottles" NUMBER
    , "lastdate" DATE(7)
    , "lasttool" VARCHAR2(20)
    , "lastuser" VARCHAR2(20)
    , "designid" VARCHAR2(10)
    , "comp" VARCHAR2(10)
    , "part_type" VARCHAR2(1)
    , "work_lab" VARCHAR2(4)
    , "order_date" DATE(7)
    , "epic_rpt_method" VARCHAR2(2)
    , "isgenericchild" bit
    , "percentfactor" NUMBER
    , PRIMARY KEY ("test_no", "test_no_bkcc", "tenant_id")
);

CREATE INDEX ORDERMAST_PROD
ON "test" ();

CREATE UNIQUE INDEX ORDERMAST1
ON "test" ();

