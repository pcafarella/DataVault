CREATE TABLE WSDataVault_dev_incremental.raw.s_department_instrument_run_mroc_national (
 
  hk_l_department_instrument_run nchar(64) NOT NULL -- stage_department_instrument_run_national.hk_l_department_instrument_run 
 
, instrument_run_no nvarchar(20) -- stage_department_instrument_run_national.instrument_run_no 
, audit_seq decimal(12,2) -- stage_department_instrument_run_national.audit_seq 
, samp_tag nvarchar(10) -- stage_department_instrument_run_national.samp_tag 
, login_seq decimal(12,2) -- stage_department_instrument_run_national.login_seq 
 
, list_joinid nvarchar(20) -- stage_department_instrument_run_national.list_joinid 
 
, snapshot_flag nvarchar(1) -- stage_department_instrument_run_national.snapshot_flag 
, dkey_flag nvarchar(1) -- stage_department_instrument_run_national.dkey_flag 
 
, parm_validate_flag nvarchar(1) -- stage_department_instrument_run_national.parm_validate_flag 
, dkey_cnt decimal(12,2) -- stage_department_instrument_run_national.dkey_cnt 
, pchain_id nvarchar(20) -- stage_department_instrument_run_national.pchain_id 
, calcid nvarchar(20) -- stage_department_instrument_run_national.calcid 
 
, process_step decimal(12,2) -- stage_department_instrument_run_national.process_step 
, process_id nvarchar(30) -- stage_department_instrument_run_national.process_id 
 
, nextprocess_id nvarchar(30) -- stage_department_instrument_run_national.nextprocess_id 
 
, process_status nvarchar(1) -- stage_department_instrument_run_national.process_status 
 
, process_message nvarchar(100) -- stage_department_instrument_run_national.process_message 
 
, reqavail_flag nvarchar(1) -- stage_department_instrument_run_national.reqavail_flag 
 
, calcavail_flag nvarchar(1) -- stage_department_instrument_run_national.calcavail_flag 
 
, approval_status nvarchar(4) -- stage_department_instrument_run_national.approval_status 
, galp_id decimal(12,2) -- stage_department_instrument_run_national.galp_id 
, input_seq decimal(12,2) -- stage_department_instrument_run_national.input_seq 
, inputdate datetime2 -- stage_department_instrument_run_national.inputdate 
, samp_type nvarchar(20) -- stage_department_instrument_run_national.samp_type 
, link_id nvarchar(20) -- stage_department_instrument_run_national.link_id 
, enterdate datetime2 -- stage_department_instrument_run_national.enterdate 
, prep_date1 datetime2 -- stage_department_instrument_run_national.prep_date1 
, prep_date2 datetime2 -- stage_department_instrument_run_national.prep_date2 
, measuredate datetime2 -- stage_department_instrument_run_national.measuredate 
 
, rptremarks nvarchar(100) -- stage_department_instrument_run_national.rptremarks 
, comments nvarchar(90) -- stage_department_instrument_run_national.comments 
, lastdate datetime2 -- stage_department_instrument_run_national.lastdate 
, lastuser nvarchar(20) -- stage_department_instrument_run_national.lastuser 
, lasttool nvarchar(20) -- stage_department_instrument_run_national.lasttool 
 
, analysis_type nvarchar(10) -- stage_department_instrument_run_national.analysis_type 
 
, analysis_count decimal(12,2) -- stage_department_instrument_run_national.analysis_count 
, rpt_mdl nchar(1) -- stage_department_instrument_run_national.rpt_mdl 
 
, virtual_set decimal(12,2) -- stage_department_instrument_run_national.virtual_set 
, worknum nvarchar(20) -- stage_department_instrument_run_national.worknum 
, tic decimal(12,2) -- stage_department_instrument_run_national.tic 
, run_date datetime2 -- stage_department_instrument_run_national.run_date 
, run_type nvarchar(10) -- stage_department_instrument_run_national.run_type 
, analyst nvarchar(30) -- stage_department_instrument_run_national.analyst 
 
, dss_change_hash nchar(64) NOT NULL -- stage_department_instrument_run_national.dss_change_hash_department_instrument_run_mroc_national 
 
, dss_record_source nvarchar(255) -- stage_department_instrument_run_national.dss_record_source 
 
, dss_load_date datetime2 -- stage_department_instrument_run_national.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_department__9c6815ed_idx_CK ON WSDataVault_dev_incremental.raw.s_department_instrument_run_mroc_national (hk_l_department_instrument_run,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_department__9c6815ed_idx_PK ON WSDataVault_dev_incremental.raw.s_department_instrument_run_mroc_national (hk_l_department_instrument_run,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

