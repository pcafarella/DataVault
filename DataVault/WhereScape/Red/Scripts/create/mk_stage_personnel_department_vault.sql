CREATE TABLE WSDataVault_dev_incremental.stage.stage_personnel_department_vault (
  hk_l_personnel_department nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, hk_h_personnel nchar(64) NOT NULL 
, personnel_no nvarchar(50) -- load_ext_cj3activerosterforit_vault.file_number 
, personnel_no_bkcc nvarchar(50) 
, personnel_no_tenant_id nvarchar(50) 
 
, department_no nvarchar(50) -- load_ext_cj3activerosterforit_vault.home_department_code 
, department_no_bkcc nvarchar(50) 
, department_no_tenant_id nvarchar(50) 
 
, home_department_description nvarchar(32) -- load_ext_cj3activerosterforit_vault.home_department_description 
 
, payroll_company_code nvarchar(64) -- load_ext_cj3activerosterforit_vault.payroll_company_code 
, dss_change_hash_personnel_department_lroc_vault nchar(64) NOT NULL 
 
, dss_record_source nvarchar(255) -- load_ext_cj3activerosterforit_vault.dss_record_source 
, dss_load_date datetime2 -- load_ext_cj3activerosterforit_vault.dss_load_date 
, dss_create_time datetime2 
) 
;


