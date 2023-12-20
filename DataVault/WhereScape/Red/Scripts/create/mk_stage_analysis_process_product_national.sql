CREATE TABLE WSDataVault_dev_incremental.stage.stage_analysis_process_product_national (
  hk_l_analysis_process_product nchar(64) NOT NULL 
, hk_h_product nchar(64) NOT NULL 
, hk_h_analysis_process nchar(64) NOT NULL 
, analysis_process_code nvarchar(50) -- load_listlink_national.listtype 
, analysis_process_code_bkcc nvarchar(50) -- load_listlink_national.listmatclass 
, analysis_process_code_tenant_id nvarchar(255) 
, product_code nvarchar(50) -- load_prodmast_national.prod 
, product_code_bkcc nvarchar(50) -- load_prodmast_national.matnum 
, product_code_tenant_id nvarchar(255) 
, link_id nvarchar(20) -- load_listlink_national.link_id 
, description nvarchar(40) -- load_listlink_national.description 
, list_pointer nvarchar(20) -- load_listlink_national.list_pointer 
, list_func nvarchar(40) -- load_listlink_national.list_func 
, parm_stored nvarchar(40) -- load_listlink_national.parm_stored 
, pchain_name nvarchar(30) -- load_listlink_national.pchain_name 
, dss_change_hash_analysis_process_product_mroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_prodmast_national.dss_record_source 
, dss_load_date datetime2 -- load_prodmast_national.dss_load_date 
, dss_create_time datetime2 
) 
;


