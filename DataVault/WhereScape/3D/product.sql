CREATE TABLE "product"
(
    "product_code" varchar(100) not null
    , "product_code_bkcc" VARCHAR(255) not null
    , "tenant_id" VARCHAR(255) not null
    , "method" VARCHAR2(100)
    , "matrix" VARCHAR2(50) not null
    , "description" nvarchar(255)
    , "proc_code" VARCHAR2(50)
    , "comments" nvarchar(255)
    , "code" nvarchar(50)
    , "userguid" nvarchar(255)
    , "tat" smallint
    , "rush" smallint
    , "price" numeric(28,2)
    , "anaclass" nvarchar(50)
    , "sopfile" nvarchar(255)
    , "standard" bit not null
    , "isvariablegroup" bit not null
    , "isstandardgroup" bit not null
    , "isvariablesub" bit not null
    , "isactive" bit not null
    , "istracking" bit not null
    , "isdissolved" bit not null
    , "isleachmethod" bit not null
    , "ispostmethod" bit not null
    , "isfieldanalysis" bit not null
    , "analysisinfo1" nvarchar(50)
    , "analysisinfo2" nvarchar(50)
    , "analysisinfo3" nvarchar(50)
    , "analysisinfo4" nvarchar(50)
    , "analysisinfo5" nvarchar(50)
    , "analysisinfo6" nvarchar(50)
    , "analysisinfo7" nvarchar(50)
    , "analysisinfo8" nvarchar(50)
    , "analysisinfo9" nvarchar(50)
    , "analysisinfo10" nvarchar(50)
    , "userguiddesc" nvarchar(255)
    , "elm7hostkey" nvarchar(36)
    , "class" VARCHAR2(1) not null
    , "holddays" NUMBER
    , "holdflg" VARCHAR2(1)
    , "duedays" NUMBER
    , "factorflg" VARCHAR2(1)
    , "containertype" VARCHAR2(20)
    , "bottles" NUMBER
    , "lastdate" DATE(7)
    , "lasttool" VARCHAR2(20)
    , "lastuser" VARCHAR2(20)
    , "costcenter" VARCHAR2(4)
    , "phasecode" NUMBER(4,0)
    , "auto_anrev_flag" VARCHAR2(1) default 'N' not null
    , "queue" VARCHAR2(4)
    , "sort_item" NUMBER(2,0)
    , "proc_desc" VARCHAR2(40)
    , "proc_flags" VARCHAR2(20)
    , "detail_flags" VARCHAR2(16)
    , "acode_flags" VARCHAR2(10)
    , "analysismemo" varchar(max)
    , "isfixedprice" smallint default ((0)) not null
    , PRIMARY KEY ("product_code", "product_code_bkcc", "tenant_id")
);

