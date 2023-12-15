CREATE TABLE "invoice"
(
    "invoice_no" varchar(50) not null
    , "invoice_no_bkcc" VARCHAR(255) not null
    , "tenant_id" VARCHAR2(15) not null
    , "acct_type" VARCHAR2(1)
    , "actual_date" DATE(7)
    , "addr_seq" NUMBER(12,0)
    , "cutoff_date" DATE(7)
    , "invoice_phase" NUMBER(1,0)
    , "location" VARCHAR2(20)
    , "total_amt" NUMBER(9,2)
    , "archive_vol" NUMBER(4,0)
    , "bid" nvarchar(50)
    , "invoicemanager" nvarchar(50)
    , "ponumber" nvarchar(50)
    , "facilitycode" nvarchar(50)
    , "invoicedate" datetime
    , "invoicedue" datetime
    , "paymentreceived" datetime
    , "comments" nvarchar(max)
    , "lastedit" datetime
    , "initials" nvarchar(10)
    , "isposted" bit not null
    , "isexported" bit not null
    , "iscredit" bit not null
    , "invoicetotal" real
    , "credittotal" real
    , "itemtotal" real
    , "lastexport" datetime
    , "reference" nvarchar(50)
    , "invoiceinfo1" nvarchar(50)
    , "invoiceinfo2" nvarchar(50)
    , "invoiceinfo3" nvarchar(50)
    , "invoiceinfo4" nvarchar(50)
    , "invoiceinfo5" nvarchar(50)
    , "invoiceinfo6" nvarchar(50)
    , "invoiceinfo7" nvarchar(50)
    , "invoiceinfo8" nvarchar(50)
    , "invoiceinfo9" nvarchar(50)
    , "invoiceinfo10" nvarchar(50)
    , "billcode" nvarchar(100)
    , "invoiceref" VARCHAR2(10)
    , "invoicecomm" VARCHAR2(240)
    , "projectnum" VARCHAR2(255)
    , "description" VARCHAR2(40)
    , "status" VARCHAR2(10)
    , "lastdate" DATE(7)
    , "lasttool" VARCHAR2(20)
    , "lastuser" VARCHAR2(20)
    , "redostatus" VARCHAR2(50)
    , "mas90date" DATE(7)
    , "original_invoice_date" DATE(7)
    , "summary_invoice" VARCHAR2(30)
    , PRIMARY KEY ("invoice_no", "invoice_no_bkcc", "tenant_id")
);

