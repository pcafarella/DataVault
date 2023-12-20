CREATE TABLE WSDataVault_dev_incremental.stage.stage_personnel_supervisor (
  hk_l_personnel_supervisor nchar(64) NOT NULL 
, hk_h_personnel_personnel_no nchar(64) NOT NULL 
, hk_h_personnel_personnel_supervisor_no nchar(64) NOT NULL 
, personnel_no nvarchar(50) -- load_ext_cj3activerosterforit_vault.file_number 
, personnel_no_bkcc nvarchar(50) 
, personnel_tenant_id nvarchar(50) 
, personnel_supervisor_no_bkcc nvarchar(50) 
, personnel_supervisor_tenant_id nvarchar(50) 
 
, reports_to_legal_first_name nvarchar(16) -- load_ext_cj3activerosterforit_vault.reports_to_legal_first_name 
 
, reports_to_legal_last_name nvarchar(32) -- load_ext_cj3activerosterforit_vault.reports_to_legal_last_name 
, dss_change_hash_personnel_supervisor_mroc nchar(64) NOT NULL 
 
, dss_record_source nvarchar(255) -- load_ext_cj3activerosterforit_vault.dss_record_source 
, dss_load_date datetime2 -- load_ext_cj3activerosterforit_vault.dss_load_date 
, dss_create_time datetime2 
) 
;


