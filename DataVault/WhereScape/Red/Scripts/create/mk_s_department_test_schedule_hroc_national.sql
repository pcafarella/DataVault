CREATE TABLE WSDataVault_dev_incremental.raw.s_department_test_schedule_hroc_national (
 
  hk_l_department_test_schedule nchar(64) NOT NULL -- stage_department_test_schedule_national.hk_l_department_test_schedule 
 
, process_status_code nvarchar(4) -- stage_department_test_schedule_national.process_status_code 
 
, process_status_date datetime2 -- stage_department_test_schedule_national.process_status_date 
 
, process_status_batch_no nvarchar(20) -- stage_department_test_schedule_national.process_status_batch_no 
, workdate datetime2 -- stage_department_test_schedule_national.workdate 
, workstatus nvarchar(4) -- stage_department_test_schedule_national.workstatus 
 
, dprevdeptnum decimal(12,2) -- stage_department_test_schedule_national.dprevdeptnum 
 
, dnextdeptnum decimal(12,2) -- stage_department_test_schedule_national.dnextdeptnum 
, lasttool nvarchar(20) -- stage_department_test_schedule_national.lasttool 
, lastuser nvarchar(20) -- stage_department_test_schedule_national.lastuser 
 
, dss_change_hash nchar(64) NOT NULL -- stage_department_test_schedule_national.dss_change_hash_department_test_schedule_hroc_national 
 
, dss_record_source nvarchar(255) -- stage_department_test_schedule_national.dss_record_source 
 
, dss_load_date datetime2 -- stage_department_test_schedule_national.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_department__750c2cf7_idx_CK ON WSDataVault_dev_incremental.raw.s_department_test_schedule_hroc_national (hk_l_department_test_schedule,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON);
CREATE UNIQUE NONCLUSTERED INDEX s_department__750c2cf7_idx_PK ON WSDataVault_dev_incremental.raw.s_department_test_schedule_hroc_national (hk_l_department_test_schedule,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON);

