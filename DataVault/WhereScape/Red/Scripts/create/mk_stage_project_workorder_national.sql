CREATE TABLE WSDataVault_dev_incremental.stage.stage_project_workorder_national (
  hk_l_project_workorder nchar(64) NOT NULL 
, hk_h_project nchar(64) NOT NULL 
, hk_h_work_order nchar(64) NOT NULL 
, project_no nvarchar(50) -- load_projectdef_national.projectnum 
, project_no_bkcc nvarchar(255) -- load_projectdef_national.acctnum 
, project_no_tenant_id nvarchar(255) 
, work_order_no nvarchar(50) -- load_vw_sdg_details_national.loginnum 
, work_order_no_bkcc nvarchar(255) 
, work_order_no_tenant_id nvarchar(255) 
 
, dss_record_source nvarchar(255) -- load_vw_sdg_details_national.dss_record_source 
, dss_load_date datetime2 -- load_vw_sdg_details_national.dss_load_date 
, dss_create_time datetime2 
) 
;


