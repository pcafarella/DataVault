CREATE TABLE WSDataVault_dev_incremental.stage.stage_test_invoice_national (
  hk_l_test_invoice nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, hk_h_invoice nchar(64) NOT NULL 
, test_no nvarchar(4000) -- load_ordermast_national.samplenum 
, test_no_bkcc nvarchar(255) -- load_ordermast_national.matnum 
, invoice_no nvarchar(50) -- load_sample_national.invoicenum 
, test_no_tenant_id nvarchar(255) 
, invoice_no_bkcc nvarchar(255) 
, invoice_no_tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) -- load_sample_national.dss_record_source 
, dss_load_date datetime2 -- load_sample_national.dss_load_date 
, dss_create_time datetime2 
) 
;


