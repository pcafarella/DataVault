CREATE TABLE WSDataVault_dev_incremental.stage.stage_department_vault (
  hk_h_department nchar(64) NOT NULL 
 
, department_no nvarchar(50) -- load_ext_cj3activerosterforit_vault.home_department_code 
, department_no_bkcc nvarchar(50) 
, tenant_id nvarchar(50) 
 
, department_name nvarchar(100) -- load_ext_cj3activerosterforit_vault.home_department_description 
, dss_change_hash_department_lroc_vault nchar(64) NOT NULL 
 
, dss_record_source nvarchar(255) -- load_ext_cj3activerosterforit_vault.dss_record_source 
, dss_load_date datetime2 -- load_ext_cj3activerosterforit_vault.dss_load_date 
, dss_create_time datetime2 
) 
;


