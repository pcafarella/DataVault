CREATE TABLE WSDataVault_dev_incremental.raw.l_personnel_supervisor (
 
  hk_l_personnel_supervisor nchar(64) NOT NULL -- stage_personnel_supervisor.hk_l_personnel_supervisor 
 
, hk_h_personnel_personnel_no nchar(64) NOT NULL -- stage_personnel_supervisor.hk_h_personnel_personnel_no 
 
, hk_h_personnel_personnel_supervisor_no nchar(64) NOT NULL -- stage_personnel_supervisor.hk_h_personnel_personnel_supervisor_no 
 
, dss_record_source nvarchar(255) -- stage_personnel_supervisor.dss_record_source 
, dss_load_date datetime2 -- stage_personnel_supervisor.dss_load_date 
, dss_create_time datetime2 
) 
;

CREATE NONCLUSTERED INDEX l_personnel_s_59a518da_idx_1 ON WSDataVault_dev_incremental.raw.l_personnel_supervisor (hk_h_personnel_personnel_no) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_personnel_s_59a518da_idx_2 ON WSDataVault_dev_incremental.raw.l_personnel_supervisor (hk_h_personnel_personnel_supervisor_no) WITH (SORT_IN_TEMPDB = OFF);
ALTER TABLE WSDataVault_dev_incremental.raw.l_personnel_supervisor ADD CONSTRAINT l_personnel_s_59a518da_idx_PK PRIMARY KEY NONCLUSTERED (hk_l_personnel_supervisor) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

