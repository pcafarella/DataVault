CREATE TABLE "invoiceline"
(
    "invoiceline_no" nvarchar(50,0) not null
    , "invoiceline_no_bkcc" nvarchar(255) not null
    , "tenant_id" VARCHAR(255) not null
    , "acct_type" VARCHAR2(1)
    , "acc_detail_seq" NUMBER(12,0)
    , "charge" NUMBER(12,2)
    , "charge_date" DATE(7)
    , "charge_id" NUMBER
    , "charge_type" VARCHAR2(1)
    , "cmp" VARCHAR2(15)
    , "cmp_list" VARCHAR2(15)
    , "comm_addr_seq" NUMBER(12,0)
    , "comm_trigger" NUMBER(1,0)
    , "invoice_pos" NUMBER(4,0)
    , "invoice_seq" NUMBER(12,0)
    , "line_item" NUMBER(3,0)
    , "location" VARCHAR2(150)
    , "paid_date" DATE(7)
    , "part" VARCHAR2(10)
    , "part_desc" VARCHAR2(80)
    , "part_type" VARCHAR2(1)
    , "[percent]" NUMBER(5,2)
    , "po_item" NUMBER(4,0)
    , "price_code" VARCHAR2(4)
    , "project_seq" NUMBER(12,0)
    , "purchase_order" VARCHAR2(20)
    , "qa_multiplier" NUMBER
    , "qty" NUMBER(7,2)
    , "reqnbr" NUMBER
    , "ship_to_seq" NUMBER(12,0)
    , "submitter_seq" NUMBER(12,0)
    , "turn_days" NUMBER(3,0)
    , "user_nbr" VARCHAR2(4)
    , "archive_vol" NUMBER(4,0)
    , "order_date" DATE(7)
    , PRIMARY KEY ("invoiceline_no", "invoiceline_no_bkcc", "tenant_id")
);

CREATE INDEX ORDERMAST_PROD
ON "invoiceline" ();

CREATE UNIQUE INDEX ORDERMAST1
ON "invoiceline" ();

