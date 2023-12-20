CREATE TABLE WSDataVault_dev_incremental.raw.s_personnel_department_hours_tran (
 
  hk_l_personnel_department_hours nchar(64) NOT NULL -- stage_personnel_department_hours.hk_l_personnel_department_hours 
 
, reports_to_file_number int -- stage_personnel_department_hours.reports_to_file_number 
, hours decimal(12,2) -- stage_personnel_department_hours.hours 
, business_unit nvarchar(100) -- stage_personnel_department_hours.business_unit 
 
, dss_change_hash nchar(64) NOT NULL -- stage_personnel_department_hours.dss_change_hash_personnel_department_hours_tran 
 
, dss_record_source nvarchar(255) -- stage_personnel_department_hours.dss_record_source 
, dss_load_date datetime2 -- stage_personnel_department_hours.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_personnel_d_ff1584bd_idx_CK ON WSDataVault_dev_incremental.raw.s_personnel_department_hours_tran (hk_l_personnel_department_hours,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_personnel_d_ff1584bd_idx_PK ON WSDataVault_dev_incremental.raw.s_personnel_department_hours_tran (hk_l_personnel_department_hours,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

