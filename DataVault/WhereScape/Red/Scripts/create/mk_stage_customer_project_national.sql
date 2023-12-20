CREATE TABLE WSDataVault_dev_incremental.stage.stage_customer_project_national (
  hk_l_customer_project nchar(64) NOT NULL 
, hk_h_project nchar(64) NOT NULL 
, hk_h_customer nchar(64) NOT NULL 
, account_no nvarchar(50) -- load_projectdef_national.acctnum 
, account_no_bkcc nvarchar(255) 
, account_no_tenant_id nvarchar(255) 
, project_no nvarchar(50) -- load_projectdef_national.projectnum 
, project_no_bkcc nvarchar(255) 
, project_no_tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) -- load_projectdef_national.dss_record_source 
, dss_load_date datetime2 -- load_projectdef_national.dss_load_date 
, dss_create_time datetime2 
) 
;


