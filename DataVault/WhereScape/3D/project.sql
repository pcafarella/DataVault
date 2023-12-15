CREATE TABLE "project"
(
    "project_no" VARCHAR(50) not null
    , "project_no_bkcc" varchar(255) not null
    , "tenant_id" varchar(255) not null
    , "project_name" VARCHAR2(255)
    , "project_desc" VARCHAR2(max)
    , "purchase_order_no" nvarchar(50)
    , "site" VARCHAR2(255)
    , "projref" VARCHAR2(40)
    , "manager" VARCHAR2(30)
    , "sales1code" VARCHAR2(4)
    , "sales1plan" VARCHAR2(4)
    , "sales2code" VARCHAR2(4)
    , "sales2plan" VARCHAR2(4)
    , "termcode" VARCHAR2(10)
    , "lastdate" DATE(7)
    , "lasttool" VARCHAR2(20)
    , "lastuser" VARCHAR2(20)
    , "permitnum" VARCHAR2(100)
    , "locator" VARCHAR2(50)
    , "create_date" DATE(7)
    , "cs_contact" VARCHAR2(4)
    , "flags" VARCHAR2(30)
    , "level2x" NUMBER
    , "level3x" NUMBER
    , "location_seq" NUMBER(12,0)
    , "[percent]" NUMBER
    , "po_amt" NUMBER(9,2)
    , "price_code" VARCHAR2(4)
    , "primary_profile" VARCHAR2(1)
    , "project_acode" VARCHAR2(10)
    , "project_type" VARCHAR2(50)
    , "reqnbr" NUMBER(6,0) not null
    , "special_notes" VARCHAR2(2000)
    , "archive_vol" NUMBER(4,0)
    , "master_reqnbr" NUMBER(6,0)
    , "is_master" VARCHAR2(1)
    , "isactive" bit not null
    , "editby" nvarchar(50)
    , "editdate" datetime
    , "editlock" bit not null
    , "projcertstring" nvarchar(255)
    , "projregsstring" nvarchar(255)
    , "hasmasterproject" bit not null
    , "masterproject" nvarchar(50)
    , "clientmanager" nvarchar(50)
    , "clientmanager2" nvarchar(50)
    , "invoice" nvarchar(50)
    , "invoiceproject" nvarchar(50)
    , "invoicemanager" nvarchar(50)
    , "labmanager" nvarchar(50)
    , "qapid" nvarchar(50)
    , "reportformat" nvarchar(50)
    , "invoiceformat" nvarchar(50)
    , "packageformat" nvarchar(50)
    , "eddformat" nvarchar(50)
    , "preprocessedd" bit not null
    , "clienttype" nvarchar(30)
    , "projecttype" nvarchar(30)
    , "location" nvarchar(50)
    , "comments" nvarchar(max)
    , "eventoption" nvarchar(50)
    , "notifyoption" smallint
    , "tatoption" int
    , "defaulttat" smallint
    , "disposaldays" smallint
    , "schedulenextrenew" datetime
    , "schedulerenewcount" smallint
    , "scheduleparms" nvarchar(50)
    , "opsdatadept" nvarchar(50)
    , "projbillcode" nvarchar(50)
    , "projlabortime" real
    , "projectfacility" nvarchar(50)
    , "labortype" integer
    , "isperiodreport" bit not null
    , "billtrips" bit not null
    , "projectmemo" varchar(max)
    , "autoflagalias" nvarchar(50)
    , "projectinfo1" nvarchar(50)
    , "projectinfo2" nvarchar(50)
    , "projectinfo3" nvarchar(50)
    , "projectinfo4" nvarchar(50)
    , "projectinfo5" nvarchar(50)
    , "projectinfo6" nvarchar(50)
    , "projectinfo7" nvarchar(50)
    , "projectinfo8" nvarchar(50)
    , "projectinfo9" nvarchar(50)
    , "projectinfo10" nvarchar(50)
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
    , "wrklabel1" nvarchar(255)
    , "wrklabel2" nvarchar(255)
    , "wrklabel3" nvarchar(255)
    , "wrklabel4" nvarchar(255)
    , "wrklabel5" nvarchar(255)
    , "wrklabel6" nvarchar(255)
    , "wrklabel7" nvarchar(255)
    , "wrklabel8" nvarchar(255)
    , "wrklabel9" nvarchar(255)
    , "wrklabel10" nvarchar(255)
    , "sxlabel1" nvarchar(255)
    , "sxlabel2" nvarchar(255)
    , "sxlabel3" nvarchar(255)
    , "sxlabel4" nvarchar(255)
    , "sxlabel5" nvarchar(255)
    , "sxlabel6" nvarchar(255)
    , "sxlabel7" nvarchar(255)
    , "sxlabel8" nvarchar(255)
    , "sxlabel9" nvarchar(255)
    , "sxlabel10" nvarchar(255)
    , "contlabel1" nvarchar(255)
    , "contlabel2" nvarchar(255)
    , "contlabel3" nvarchar(255)
    , "contlabel4" nvarchar(255)
    , "contlabel5" nvarchar(255)
    , "contlabel6" nvarchar(255)
    , "contlabel7" nvarchar(255)
    , "contlabel8" nvarchar(255)
    , "contlabel9" nvarchar(255)
    , "contlabel10" nvarchar(255)
    , "directoryname" nvarchar(255)
    , "qualifieralias" nvarchar(50)
    , "rptoption" integer
    , "iswebproject" bit not null
    , "iscocproject" bit not null
    , "buyer_type" VARCHAR2(20)
    , "market_segment" VARCHAR2(20)
    , "industry_sector" VARCHAR2(20)
    , "active" VARCHAR2(1)
    , "sample_interval" NUMBER
    , "tat" NUMBER
    , "tsr" VARCHAR2(4)
    , "basin" NUMBER(2,0)
    , "sample_state" VARCHAR2(2)
    , "client_type" VARCHAR2(1)
    , "acct_alert" VARCHAR2(1)
    , "po_required" VARCHAR2(1)
    , "rpt_quals" VARCHAR2(1)
    , "rpt_mcl" VARCHAR2(1)
    , "ponumber" VARCHAR2(40)
    , "designid" VARCHAR2(10)
    , "source" VARCHAR2(4)
    , "terr" VARCHAR2(2)
    , "county" VARCHAR2(50)
    , "inv_with_rpt" VARCHAR2(1)
    , "webflag" VARCHAR2(1)
    , "rpt_qc" VARCHAR2(1)
    , "webinvflag" VARCHAR2(1)
    , "archive_flag" VARCHAR2(1)
    , "archive_date" DATE(7)
    , "service" VARCHAR2(4)
    , "rpt_mdl" VARCHAR2(1)
    , "min_invoice_amt" NUMBER
    , "report_packet_id" NUMBER(19,0) default 1  not null
    , "historical_data_check" CHAR(1) default 'N'
    , "rpt_multi_runs" CHAR(1) default 'N'
    , "container_label_type" VARCHAR2(20) default 'DEFAULT'
    , "hdc_level_2" CHAR(1) default 'N'
    , "uploaded_data_flag" VARCHAR2(20)
    , "certification_program" VARCHAR2(30)
    , "use_repdb_config" VARCHAR2(1) default 'N'
    , "combine_inv_coc" VARCHAR2(1) default 'Y'
    , "auto_approve_lvl2_report" CHAR(1) default 'N'
    , PRIMARY KEY ("project_no", "project_no_bkcc", "tenant_id")
);

CREATE UNIQUE INDEX PROJECTDEF1
ON "project" ("project_no");

CREATE INDEX PROJECTDEF2
ON "project" ("lastuser");

CREATE UNIQUE INDEX SYS_C00169601
ON "project" ("project_no");

