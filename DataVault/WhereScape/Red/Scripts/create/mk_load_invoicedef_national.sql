CREATE TABLE WSDataVault_dev_incremental.load.load_invoicedef_national (
  invoicenum nvarchar(50) -- INVOICEDEF.INVOICENUM 
, invoicedate datetime2 -- INVOICEDEF.INVOICEDATE 
, acctnum nvarchar(50) -- INVOICEDEF.ACCTNUM 
, invoiceref nvarchar(10) -- INVOICEDEF.INVOICEREF 
, invoicecomm nvarchar(240) -- INVOICEDEF.INVOICECOMM 
, projectnum nvarchar(255) -- INVOICEDEF.PROJECTNUM 
, description nvarchar(40) -- INVOICEDEF.DESCRIPTION 
, status nvarchar(10) -- INVOICEDEF.STATUS 
, lastdate datetime2 -- INVOICEDEF.LASTDATE 
, lasttool nvarchar(20) -- INVOICEDEF.LASTTOOL 
, lastuser nvarchar(20) -- INVOICEDEF.LASTUSER 
, loginnum nvarchar(10) -- INVOICEDEF.LOGINNUM 
, ponumber nvarchar(50) -- INVOICEDEF.PONUMBER 
, redostatus nvarchar(10) -- INVOICEDEF.REDOSTATUS 
, mas90date datetime2 -- INVOICEDEF.MAS90DATE 
, original_invoice_date datetime2 -- INVOICEDEF.ORIGINAL_INVOICE_DATE 
, summary_invoice nvarchar(30) -- INVOICEDEF.SUMMARY_INVOICE 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


