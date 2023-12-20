CREATE TABLE WSDataVault_dev_incremental.stage.stage_test_product_national (
  hk_l_test_product nchar(64) NOT NULL 
, hk_h_product nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, test_no nvarchar(max) -- load_ordermast_national.samplenum 
, test_no_bkcc nvarchar(255) 
, test_no_tenant_id nvarchar(255) 
, product_code nvarchar(100) -- load_ordermast_national.prod 
, product_code_bkcc nvarchar(255) -- load_ordermast_national.matnum 
, product_code_tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) -- load_ordermast_national.dss_record_source 
, dss_load_date datetime2 -- load_ordermast_national.dss_load_date 
, dss_create_time datetime2 
) 
;


