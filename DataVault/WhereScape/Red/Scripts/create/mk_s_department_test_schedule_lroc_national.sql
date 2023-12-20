CREATE TABLE WSDataVault_dev_incremental.raw.s_department_test_schedule_lroc_national (
 
  hk_l_department_test_schedule nchar(64) NOT NULL -- stage_department_test_schedule_national.hk_l_department_test_schedule 
, login_seq nvarchar(50) -- stage_department_test_schedule_national.login_seq 
 
, priorityflag nvarchar(3) -- stage_department_test_schedule_national.priorityflag 
, class nvarchar(1) -- stage_department_test_schedule_national.class 
, dalloc decimal(12,2) -- stage_department_test_schedule_national.dalloc 
, dprice decimal(12,2) -- stage_department_test_schedule_national.dprice 
, dcost decimal(12,2) -- stage_department_test_schedule_national.dcost 
, dholddays decimal(12,2) -- stage_department_test_schedule_national.dholddays 
, dholddate datetime2 -- stage_department_test_schedule_national.dholddate 
, dduedays decimal(12,2) -- stage_department_test_schedule_national.dduedays 
, dduedate datetime2 -- stage_department_test_schedule_national.dduedate 
 
, dss_change_hash nchar(64) NOT NULL -- stage_department_test_schedule_national.dss_change_hash_department_test_schedule_lroc_national 
 
, dss_record_source nvarchar(255) -- stage_department_test_schedule_national.dss_record_source 
 
, dss_load_date datetime2 -- stage_department_test_schedule_national.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_department__2f1846fb_idx_CK ON WSDataVault_dev_incremental.raw.s_department_test_schedule_lroc_national (hk_l_department_test_schedule,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_department__2f1846fb_idx_PK ON WSDataVault_dev_incremental.raw.s_department_test_schedule_lroc_national (hk_l_department_test_schedule,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

