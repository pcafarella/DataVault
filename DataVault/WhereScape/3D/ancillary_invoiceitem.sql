CREATE TABLE "ancillary_invoiceitem"
(
    "invoice_no" nvarchar(50) not null
    , "invoice_no_bkcc" varchar(255) not null
    , "invoice_no_tenant_id" varchar(255) not null
    , "description" nvarchar(100) not null
    , "itemtype" varchar(20)
    , "itemcode" nvarchar(50)
    , "itemclass" nvarchar(50)
    , "quantity" real
    , "price" real
    , "taxrate" real
    , "itemtotal" real
    , PRIMARY KEY ("invoice_no", "invoice_no_bkcc", "invoice_no_tenant_id", "description")
);

CREATE INDEX Description
ON "ancillary_invoiceitem" ("description");

CREATE INDEX Invoice
ON "ancillary_invoiceitem" ("invoice_no");

CREATE UNIQUE INDEX INVOICEITEM_PK
ON "ancillary_invoiceitem" ("invoice_no","description");

