CREATE TABLE "work_order"
(
    "work_order_no" varchar(50) not null
    , "work_order_no_bkcc" varchar(255) not null
    , "tenant_id" varchar(255) not null
    , "acode" VARCHAR2(10)
    , "create_date" DATE(7)
    , "lab_wo_id" VARCHAR2(20) not null
    , "level2x" NUMBER
    , "level3x" NUMBER
    , "open_wip_status" VARCHAR2(2)
    , "project_desc" VARCHAR2(max)
    , "project_id" VARCHAR2(60) not null
    , "project_type" VARCHAR2(2)
    , "purchase_order" VARCHAR2(50)
    , "reqnbr" NUMBER(12,0) not null
    , "wip_status" VARCHAR2(2)
    , "last_update" DATE(7)
    , "receivedate" DATE(7)
    , "projectnum" VARCHAR2(255)
    , "locator" VARCHAR2(20)
    , "description" VARCHAR2(60)
    , "first_login_seq" NUMBER
    , "project" nvarchar(50)
    , "facilitycode" nvarchar(50)
    , "received" datetime
    , "receivedby" nvarchar(50)
    , "logged" datetime
    , "loggedby" nvarchar(50)
    , "clientmanager" nvarchar(50)
    , "labmanager" nvarchar(50)
    , "tempc" real
    , "tat" smallint
    , "due" datetime
    , "pkgdue" datetime
    , "containers" bit not null
    , "samples" bit not null
    , "seals" bit not null
    , "labels" bit not null
    , "onice" bit not null
    , "uselogged" bit not null
    , "cocnum" nvarchar(50)
    , "bolnum" nvarchar(50)
    , "shippedby" nvarchar(50)
    , "submittedby" nvarchar(50)
    , "emailto" nvarchar(255)
    , "comments" varchar(max)
    , "invoicecomments" nvarchar(255)
    , "projbillcode" nvarchar(50)
    , "statusdate" datetime
    , "initials" nvarchar(10)
    , "approved" datetime
    , "approvedby" nvarchar(50)
    , "wrkcasenarrid" nvarchar(max)
    , "relog" bit not null
    , "standard" bit not null
    , "subcontract" bit not null
    , "isontime" bit not null
    , "wrkmemo" varchar(max)
    , "csnmemo" varchar(max)
    , "wrkinfo1" nvarchar(50)
    , "wrkinfo2" nvarchar(50)
    , "wrkinfo3" nvarchar(50)
    , "wrkinfo4" nvarchar(50)
    , "wrkinfo5" nvarchar(50)
    , "wrkinfo6" nvarchar(50)
    , "wrkinfo7" nvarchar(50)
    , "wrkinfo8" nvarchar(50)
    , "wrkinfo9" nvarchar(50)
    , "wrkinfo10" nvarchar(50)
    , "userinfo1" nvarchar(50)
    , "userinfo2" nvarchar(50)
    , "userinfo3" nvarchar(50)
    , "userinfo4" nvarchar(50)
    , "userinfo5" nvarchar(50)
    , "userinfo6" nvarchar(50)
    , "userinfo7" nvarchar(50)
    , "userinfo8" nvarchar(50)
    , "userinfo9" nvarchar(50)
    , "userinfo10" nvarchar(50)
    , "precompiled" datetime
    , "retainuntil" datetime
    , "created" datetime
    , "createdby" nvarchar(50)
    , "sdgid" varchar(50)
    , "status" VARCHAR2(50)
    , "report_complete" CHAR(1)
    , "tsr" VARCHAR2(4)
    , PRIMARY KEY ("work_order_no", "work_order_no_bkcc", "tenant_id")
);

