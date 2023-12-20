CREATE TABLE WSDataVault_dev_incremental.stage.stage_work_order_national (
  hk_h_work_order nchar(64) NOT NULL 
, work_order_no nvarchar(50) -- load_vw_sdg_details_national.loginnum 
, work_order_no_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, receivedate datetime2 -- load_vw_sdg_details_national.receivedate 
, projectnum nvarchar(255) -- load_vw_sdg_details_national.projectnum 
, site varchar(255) -- load_vw_sdg_details_national.site 
, locator nvarchar(255) -- load_vw_sdg_details_national.locator 
, description nvarchar(60) -- load_vw_sdg_details_national.description 
, first_login_seq decimal(12,2) -- load_vw_sdg_details_national.first_login_seq 
, sdgid nvarchar(50) -- load_vw_sdg_details_national.sdgid 
, status nvarchar(255) -- load_vw_sdg_details_national.status 
, report_complete nvarchar(50) -- load_vw_sdg_details_national.report_complete 
, tsr nvarchar(4) -- load_vw_sdg_details_national.tsr 
, dss_change_hash_work_order_mroc_national nchar(64) NOT NULL 
 
, dss_record_source nvarchar(255) -- load_vw_sdg_details_national.dss_record_source 
, dss_load_date datetime2 -- load_vw_sdg_details_national.dss_load_date 
, dss_create_time datetime2 
) 
;


