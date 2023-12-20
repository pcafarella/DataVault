CREATE TABLE WSDataVault_dev_incremental.raw.s_department_lroc_vault (
  hk_h_department nchar(64) NOT NULL -- stage_department_vault.hk_h_department 
, department_name nvarchar(100) -- stage_department_vault.department_name 
 
, dss_change_hash nchar(64) NOT NULL -- stage_department_vault.dss_change_hash_department_lroc_vault 
, dss_record_source nvarchar(255) -- stage_department_vault.dss_record_source 
, dss_load_date datetime2 -- stage_department_vault.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_department__fc90dfce_idx_CK ON WSDataVault_dev_incremental.raw.s_department_lroc_vault (hk_h_department,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX s_department__fc90dfce_idx_PK ON WSDataVault_dev_incremental.raw.s_department_lroc_vault (hk_h_department,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

