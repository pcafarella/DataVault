CREATE TABLE WSDataVault_dev_incremental.raw.s_personnel_supervisor_mroc (
 
  hk_l_personnel_supervisor nchar(64) NOT NULL -- stage_personnel_supervisor.hk_l_personnel_supervisor 
 
, reports_to_legal_first_name nvarchar(16) -- stage_personnel_supervisor.reports_to_legal_first_name 
 
, reports_to_legal_last_name nvarchar(32) -- stage_personnel_supervisor.reports_to_legal_last_name 
 
, dss_change_hash nchar(64) NOT NULL -- stage_personnel_supervisor.dss_change_hash_personnel_supervisor_mroc 
 
, dss_record_source nvarchar(255) -- stage_personnel_supervisor.dss_record_source 
, dss_load_date datetime2 -- stage_personnel_supervisor.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_personnel_s_e46fd3c5_idx_CK ON WSDataVault_dev_incremental.raw.s_personnel_supervisor_mroc (hk_l_personnel_supervisor,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_personnel_s_e46fd3c5_idx_PK ON WSDataVault_dev_incremental.raw.s_personnel_supervisor_mroc (hk_l_personnel_supervisor,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

