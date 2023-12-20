CREATE TABLE WSDataVault_dev_incremental.stage.stage_workorder_test_national (
  hk_l_workorder_test nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, hk_h_work_order nchar(64) NOT NULL 
, work_order_no nvarchar(50) -- load_sample_national.loginnum 
, work_order_no_bkcc nvarchar(255) 
, work_order_no_tenant_id nvarchar(255) 
, test_no nvarchar(max) -- load_ordermast_national.samplenum 
, test_no_bkcc nvarchar(255) -- load_ordermast_national.matnum 
, test_no_tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) -- load_sample_national.dss_record_source 
, dss_load_date datetime2 -- load_sample_national.dss_load_date 
, dss_create_time datetime2 
) 
;


