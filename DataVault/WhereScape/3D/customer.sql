CREATE TABLE "customer"
(
    "account_no" VARCHAR2(50) not null
    , "account_no_bkcc" VARCHAR(255) not null
    , "tenant_id" VARCHAR(255) not null
    , "acctname" VARCHAR2(40)
    , "acctfactor" NUMBER
    , "lastdate" DATE(7)
    , "lasttool" VARCHAR2(20)
    , "lastuser" VARCHAR2(20)
    , "mas90code" VARCHAR2(7) unique
    , "date_establishd" DATE(7)
    , "dso" NUMBER
    , "customertype" VARCHAR2(4)
    , "creationdate" DATE(7)
    , "national_acct_flag" CHAR(1) default 'N'
    , "clientbcmid" nvarchar(255)
    , "userguid" nvarchar(255)
    , "userguiddesc" nvarchar(255)
    , "address" nvarchar(100)
    , "city" nvarchar(50)
    , "state" nvarchar(50)
    , "zip" nvarchar(10)
    , "phone" nvarchar(50)
    , "fax" nvarchar(50)
    , "labmanager" nvarchar(50)
    , "invoice" nvarchar(50)
    , "taxrate" real
    , "abbreviation" nvarchar(10)
    , "description" nvarchar(50)
    , "invoiceduedays" smallint
    , "subpricing" bit not null
    , "issampler" bit not null
    , "issingle" bit not null
    , "isinlab" bit not null
    , "isoutlab" bit not null
    , "isinvoice" bit not null
    , "isprospect" bit not null
    , "iscodonly" bit not null
    , "isreportonly" bit not null
    , "iswebclient" bit not null
    , "iscocclient" bit not null
    , "ismonthlyinvoiceclient" bit not null
    , "isminimuminvoiceclient" bit not null
    , "timeoffset" smallint
    , "clientdbtype" smallint
    , "clientdbjettype" smallint
    , "clientdbservername" nvarchar(255)
    , "clientdbserverpath" nvarchar(255)
    , "clientdbdatabasename" nvarchar(255)
    , "clientdbsrxfilename" nvarchar(255)
    , "clientdbpathbid" nvarchar(255)
    , "clientdbpathedd" nvarchar(255)
    , "clientdbpathinvoice" nvarchar(255)
    , "clientdbpathreport" nvarchar(255)
    , "clientdbpathtransferin" nvarchar(255)
    , "clientdbpathtransferout" nvarchar(255)
    , "clientdbpathupdates" nvarchar(255)
    , "clientdbpathxtable" nvarchar(255)
    , "clientdbpathsopfile" nvarchar(255)
    , "clientdbpathpdffile" nvarchar(255)
    , "clientmemo" varchar(max)
    , "clientinfo1" nvarchar(max)
    , "clientinfo2" nvarchar(max)
    , "clientinfo3" nvarchar(max)
    , "clientinfo4" nvarchar(max)
    , "clientinfo5" nvarchar(max)
    , "clientinfo6" nvarchar(max)
    , "clientinfo7" nvarchar(max)
    , "clientinfo8" nvarchar(max)
    , "clientinfo9" nvarchar(max)
    , "clientinfo10" nvarchar(max)
    , "plabel1" nvarchar(255)
    , "plabel2" nvarchar(255)
    , "plabel3" nvarchar(255)
    , "plabel4" nvarchar(255)
    , "plabel5" nvarchar(255)
    , "plabel6" nvarchar(255)
    , "plabel7" nvarchar(255)
    , "plabel8" nvarchar(255)
    , "plabel9" nvarchar(255)
    , "plabel10" nvarchar(255)
    , "dwrklabel1" nvarchar(255)
    , "dwrklabel2" nvarchar(255)
    , "dwrklabel3" nvarchar(255)
    , "dwrklabel4" nvarchar(255)
    , "dwrklabel5" nvarchar(255)
    , "dwrklabel6" nvarchar(255)
    , "dwrklabel7" nvarchar(255)
    , "dwrklabel8" nvarchar(255)
    , "dwrklabel9" nvarchar(255)
    , "dwrklabel10" nvarchar(255)
    , "dsxlabel1" nvarchar(255)
    , "dsxlabel2" nvarchar(255)
    , "dsxlabel3" nvarchar(255)
    , "dsxlabel4" nvarchar(255)
    , "dsxlabel5" nvarchar(255)
    , "dsxlabel6" nvarchar(255)
    , "dsxlabel7" nvarchar(255)
    , "dsxlabel8" nvarchar(255)
    , "dsxlabel9" nvarchar(255)
    , "dsxlabel10" nvarchar(255)
    , "directoryname" nvarchar(255)
    , "elm7hostkey" nvarchar(36)
    , "cust_group" VARCHAR2(40)
    , "cust_name" VARCHAR2(60)
    , "cust_seq" integer
    , "flags" VARCHAR2(20)
    , "active" VARCHAR2(1) default 'Y'  not null
    , "sample_state" VARCHAR2(2)
    , "buyer_type" VARCHAR2(20)
    , "market_segment" VARCHAR2(20)
    , "industry_sector" VARCHAR2(20)
    , "clientadded" smallint
    , "usrcltcreate" datetime default (getdate()) not null
    , "bcbusinessworksdate" datetime
    , "pace_clientid" nvarchar(15)
    , "pace_excludeinflation" nvarchar(2) default (N'N')
    , PRIMARY KEY ("account_no", "account_no_bkcc", "tenant_id")
);

CREATE UNIQUE INDEX ACCOUNTDEF1
ON "customer" ("account_no");

CREATE UNIQUE INDEX ACCOUNTDEF2
ON "customer" ("mas90code");

