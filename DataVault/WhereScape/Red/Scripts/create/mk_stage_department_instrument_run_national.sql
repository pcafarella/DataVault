CREATE TABLE WSDataVault_dev_incremental.stage.stage_department_instrument_run_national (
  hk_l_department_instrument_run nchar(64) NOT NULL 
, hk_h_analytical_instrument nchar(64) NOT NULL 
, hk_h_sample nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, hk_h_analysis_process nchar(64) NOT NULL 
, department_no nvarchar(50) -- load_rundef_national.deptnum 
, department_no_bkcc nvarchar(50) 
, department_no_tenant_id nvarchar(50) 
, sample_no nvarchar(50) -- load_sample_national.samplenum 
, sample_no_bkcc nvarchar(255) 
, sample_no_tenant_id nvarchar(255) 
, instrument_no nvarchar(50) -- load_rundef_national.instrument_id 
, instrument_no_bkcc nvarchar(50) 
, instrument_no_tenant_id nvarchar(50) 
, analysis_process_code nvarchar(50) -- load_listheader_national.listtype 
, analysis_process_code_bkcc nvarchar(50) 
, analysis_process_code_tenant_id nvarchar(50) 
, process_occurence_no nvarchar(50) -- load_sampheader_national.samp_joinid 
, description nvarchar(60) -- load_sample_national.description 
, instrument_run_no nvarchar(20) -- load_rundef_national.run_id 
, audit_seq decimal(12,2) -- load_sampheader_national.audit_seq 
, samp_tag nvarchar(10) -- load_sampheader_national.samp_tag 
, login_seq decimal(12,2) -- load_sampheader_national.login_seq 
, list_joinid nvarchar(20) -- load_listheader_national.list_joinid 
, snapshot_flag nvarchar(1) -- load_sampheader_national.snapshot_flag 
, dkey_flag nvarchar(1) -- load_sampheader_national.dkey_flag 
, parm_validate_flag nvarchar(1) -- load_sampheader_national.parm_validate_flag 
, dkey_cnt decimal(12,2) -- load_sampheader_national.dkey_cnt 
, pchain_id nvarchar(20) -- load_sampheader_national.pchain_id 
, calcid nvarchar(20) -- load_sampheader_national.calcid 
, process_step decimal(12,2) -- load_sampheader_national.process_step 
, process_id nvarchar(30) -- load_sampheader_national.process_id 
, nextprocess_id nvarchar(30) -- load_sampheader_national.nextprocess_id 
, process_status nvarchar(1) -- load_sampheader_national.process_status 
, process_message nvarchar(100) -- load_sampheader_national.process_message 
, reqavail_flag nvarchar(1) -- load_sampheader_national.reqavail_flag 
, calcavail_flag nvarchar(1) -- load_sampheader_national.calcavail_flag 
, approval_status nvarchar(4) -- load_sampheader_national.approval_status 
, galp_id decimal(12,2) -- load_sampheader_national.galp_id 
, input_seq decimal(12,2) -- load_sampheader_national.input_seq 
, inputdate datetime2 -- load_sampheader_national.inputdate 
, samp_type nvarchar(20) -- load_sampheader_national.samp_type 
, link_id nvarchar(20) -- load_sampheader_national.link_id 
, enterdate datetime2 -- load_sampheader_national.enterdate 
, prep_date1 datetime2 -- load_sampheader_national.prep_date1 
, prep_date2 datetime2 -- load_sampheader_national.prep_date2 
, measuredate datetime2 -- load_sampheader_national.measuredate 
, rptremarks nvarchar(100) -- load_sampheader_national.rptremarks 
, comments nvarchar(90) -- load_sampheader_national.comments 
, lastdate datetime2 -- load_sampheader_national.lastdate 
, lastuser nvarchar(20) -- load_sampheader_national.lastuser 
, lasttool nvarchar(20) -- load_sampheader_national.lasttool 
, analysis_type nvarchar(10) -- load_sampheader_national.analysis_type 
, analysis_count decimal(12,2) -- load_sampheader_national.analysis_count 
, rpt_mdl nchar(1) -- load_sampheader_national.rpt_mdl 
, virtual_set decimal(12,2) -- load_sampheader_national.virtual_set 
, worknum nvarchar(20) -- load_sampheader_national.worknum 
, tic decimal(12,2) -- load_sampheader_national.tic 
, run_date datetime2 -- load_rundef_national.run_date 
, run_type nvarchar(10) -- load_rundef_national.run_type 
, analyst nvarchar(30) -- load_rundef_national.analyst 
, dss_change_hash_department_instrument_run_mroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_rundef_national.dss_record_source 
, dss_load_date datetime2 -- load_rundef_national.dss_load_date 
, dss_create_time datetime2 
) 
;


