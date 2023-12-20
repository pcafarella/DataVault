CREATE TABLE WSDataVault_dev_incremental.stage.stage_customer_workorder_national (
  hk_l_customer_workorder nchar(64) NOT NULL 
, hk_h_work_order nchar(64) NOT NULL 
, hk_h_customer nchar(64) NOT NULL 
, account_no nvarchar(50) -- load_vw_sdg_details_national.acctnum 
, account_no_bkcc nvarchar(255) 
, account_no_tenant_id nvarchar(255) 
, work_order_no nvarchar(50) -- load_vw_sdg_details_national.loginnum 
, work_order_no_bkcc nvarchar(255) 
, work_order_no_tenant_id nvarchar(255) 
 
, dss_record_source nvarchar(255) -- load_vw_sdg_details_national.dss_record_source 
, dss_load_date datetime2 -- load_vw_sdg_details_national.dss_load_date 
, dss_create_time datetime2 
) 
;


