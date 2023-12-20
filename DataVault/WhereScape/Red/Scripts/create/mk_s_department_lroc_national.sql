CREATE TABLE WSDataVault_dev_incremental.raw.s_department_lroc_national (
 
  hk_h_department nchar(64) NOT NULL -- stage_department_national.hk_h_department 
, department_name nvarchar(100) -- stage_department_national.department_name 
 
, department_short_name nvarchar(50) -- stage_department_national.department_short_name 
, deptacctref nvarchar(20) -- stage_department_national.deptacctref 
, qcskip_flag nvarchar(1) -- stage_department_national.qcskip_flag 
 
, dss_change_hash nchar(64) NOT NULL -- stage_department_national.dss_change_hash_department_lroc_national 
, dss_record_source nvarchar(255) -- stage_department_national.dss_record_source 
, dss_load_date datetime2 -- stage_department_national.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_department__1e434296_idx_PK ON WSDataVault_dev_incremental.raw.s_department_lroc_national (hk_h_department,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_department__1e434296_idx_CK ON WSDataVault_dev_incremental.raw.s_department_lroc_national (hk_h_department,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

