CREATE TABLE WSDataVault_dev_incremental.stage.stage_analysis_process_national (
  hk_h_analysis_process nchar(64) NOT NULL 
, analysis_process_code nvarchar(50) -- load_listlink_national.listtype 
, analysis_process_code_bkcc nvarchar(50) -- load_listlink_national.listmatclass 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) -- load_listlink_national.dss_record_source 
, dss_load_date datetime2 -- load_listlink_national.dss_load_date 
, dss_create_time datetime2 
) 
;


