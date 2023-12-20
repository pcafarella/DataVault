CREATE TABLE WSDataVault_dev_incremental.stage.stage_invoice_national (
  hk_h_invoice nchar(64) NOT NULL 
, invoice_no nvarchar(50) -- load_invoicedef_national.invoicenum 
, invoice_no_bkcc nvarchar(255) 
, tenant_id nvarchar(15) 
, ponumber nvarchar(50) -- load_invoicedef_national.ponumber 
, invoicedate datetime2 -- load_invoicedef_national.invoicedate 
, invoiceref nvarchar(10) -- load_invoicedef_national.invoiceref 
, invoicecomm nvarchar(240) -- load_invoicedef_national.invoicecomm 
, projectnum nvarchar(255) -- load_invoicedef_national.projectnum 
, description nvarchar(40) -- load_invoicedef_national.description 
, status nvarchar(10) -- load_invoicedef_national.status 
, lastdate datetime2 -- load_invoicedef_national.lastdate 
, lasttool nvarchar(20) -- load_invoicedef_national.lasttool 
, lastuser nvarchar(20) -- load_invoicedef_national.lastuser 
, redostatus nvarchar(10) -- load_invoicedef_national.redostatus 
, mas90date datetime2 -- load_invoicedef_national.mas90date 
 
, original_invoice_date datetime2 -- load_invoicedef_national.original_invoice_date 
, summary_invoice nvarchar(30) -- load_invoicedef_national.summary_invoice 
, dss_change_hash_invoice_mroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_invoicedef_national.dss_record_source 
, dss_load_date datetime2 -- load_invoicedef_national.dss_load_date 
, dss_create_time datetime2 
) 
;


