CREATE TABLE WSDataVault_dev_incremental.raw.s_personnel_department_lroc_vault (
 
  hk_l_personnel_department nchar(64) NOT NULL -- stage_personnel_department_vault.hk_l_personnel_department 
 
, home_department_description nvarchar(32) -- stage_personnel_department_vault.home_department_description 
 
, payroll_company_code nvarchar(64) -- stage_personnel_department_vault.payroll_company_code 
 
, dss_change_hash nchar(64) NOT NULL -- stage_personnel_department_vault.dss_change_hash_personnel_department_lroc_vault 
 
, dss_record_source nvarchar(255) -- stage_personnel_department_vault.dss_record_source 
, dss_load_date datetime2 -- stage_personnel_department_vault.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_personnel_d_e35ea9ef_idx_CK ON WSDataVault_dev_incremental.raw.s_personnel_department_lroc_vault (hk_l_personnel_department,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_personnel_d_e35ea9ef_idx_PK ON WSDataVault_dev_incremental.raw.s_personnel_department_lroc_vault (hk_l_personnel_department,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

