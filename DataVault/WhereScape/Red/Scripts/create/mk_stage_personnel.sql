CREATE TABLE WSDataVault_dev_incremental.stage.stage_personnel (
  hk_h_personnel nchar(64) NOT NULL 
, personnel_no nvarchar(50) -- load_ext_cj3activerosterforit_vault.file_number 
, personnel_no_bkcc nvarchar(50) 
, tenant_id nvarchar(50) 
 
, first_name nvarchar(16) -- load_ext_cj3activerosterforit_vault.legal_first_name 
, last_name nvarchar(32) -- load_ext_cj3activerosterforit_vault.legal_last_name 
, dss_change_hash_personnel_lroc nchar(64) NOT NULL 
 
, dss_record_source nvarchar(255) -- load_ext_cj3activerosterforit_vault.dss_record_source 
, dss_load_date datetime2 -- load_ext_cj3activerosterforit_vault.dss_load_date 
, dss_create_time datetime2 
 
, business_unit varchar(50) -- load_ext_cj3activerosterforit_vault.business_unit_description 
) 
;


