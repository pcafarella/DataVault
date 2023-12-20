CREATE TABLE WSDataVault_dev_incremental.raw.s_department_lroc_masterdata (
 
  hk_h_department nchar(64) NOT NULL -- stage_department_masterdata.hk_h_department 
, department_name nvarchar(100) -- stage_department_masterdata.department_name 
 
, department_short_name nvarchar(50) -- stage_department_masterdata.department_short_name 
, department_type nvarchar(14) -- stage_department_masterdata.department_type 
, department_level tinyint -- stage_department_masterdata.department_level 
 
, dss_change_hash nchar(64) NOT NULL -- stage_department_masterdata.dss_change_hash_department_lroc_masterdata 
 
, dss_record_source nvarchar(255) -- stage_department_masterdata.dss_record_source 
, dss_load_date datetime2 -- stage_department_masterdata.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_department__73600cf0_idx_CK ON WSDataVault_dev_incremental.raw.s_department_lroc_masterdata (hk_h_department,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_department__73600cf0_idx_PK ON WSDataVault_dev_incremental.raw.s_department_lroc_masterdata (hk_h_department,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

