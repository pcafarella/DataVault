CREATE TABLE WSDataVault_dev_incremental.raw.s_department_lroc_paceport (
 
  hk_h_department nchar(64) NOT NULL -- stage_department_paceport.hk_h_department 
, department_name nvarchar(100) -- stage_department_paceport.department_name 
 
, department_short_name nvarchar(50) -- stage_department_paceport.department_short_name 
, department_type nvarchar(14) -- stage_department_paceport.department_type 
, department_level tinyint -- stage_department_paceport.department_level 
 
, dss_change_hash nchar(64) NOT NULL -- stage_department_paceport.dss_change_hash_department_lroc_paceport 
, dss_record_source nvarchar(255) -- stage_department_paceport.dss_record_source 
, dss_load_date datetime2 -- stage_department_paceport.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_department__d0cb55f8_idx_CK ON WSDataVault_dev_incremental.raw.s_department_lroc_paceport (hk_h_department,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_department__d0cb55f8_idx_PK ON WSDataVault_dev_incremental.raw.s_department_lroc_paceport (hk_h_department,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

