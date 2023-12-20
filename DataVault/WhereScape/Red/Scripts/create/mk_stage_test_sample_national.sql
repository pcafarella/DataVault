CREATE TABLE WSDataVault_dev_incremental.stage.stage_test_sample_national (
  hk_l_test_sample nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, hk_h_sample nchar(64) NOT NULL 
, test_no nvarchar(max) -- load_ordermast_national.matnum 
, test_no_bkcc nvarchar(255) -- load_ordermast_national.matnum 
, test_no_tenant_id nvarchar(255) 
, sample_no nvarchar(50) -- load_ordermast_national.samplenum 
, sample_no_bkcc nvarchar(255) 
, sample_no_tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) -- load_ordermast_national.dss_record_source 
, dss_load_date datetime2 -- load_ordermast_national.dss_load_date 
, dss_create_time datetime2 
) 
;


