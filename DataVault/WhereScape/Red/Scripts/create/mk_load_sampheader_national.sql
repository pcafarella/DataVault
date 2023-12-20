CREATE TABLE WSDataVault_dev_incremental.load.load_sampheader_national (
  samp_joinid nvarchar(50) -- SAMPHEADER.SAMP_JOINID 
, audit_seq decimal(12,2) -- SAMPHEADER.AUDIT_SEQ 
, samplenum nvarchar(50) -- SAMPHEADER.SAMPLENUM 
, samp_tag nvarchar(10) -- SAMPHEADER.SAMP_TAG 
, loginnum nvarchar(10) -- SAMPHEADER.LOGINNUM 
, login_seq decimal(12,2) -- SAMPHEADER.LOGIN_SEQ 
, list_joinid nvarchar(20) -- SAMPHEADER.LIST_JOINID 
, snapshot_flag nvarchar(1) -- SAMPHEADER.SNAPSHOT_FLAG 
, dkey_flag nvarchar(1) -- SAMPHEADER.DKEY_FLAG 
, parm_validate_flag nvarchar(1) -- SAMPHEADER.PARM_VALIDATE_FLAG 
, dkey_cnt decimal(12,2) -- SAMPHEADER.DKEY_CNT 
, pchain_id nvarchar(20) -- SAMPHEADER.PCHAIN_ID 
, calcid nvarchar(20) -- SAMPHEADER.CALCID 
, process_step decimal(12,2) -- SAMPHEADER.PROCESS_STEP 
, process_id nvarchar(30) -- SAMPHEADER.PROCESS_ID 
, nextprocess_id nvarchar(30) -- SAMPHEADER.NEXTPROCESS_ID 
, process_status nvarchar(1) -- SAMPHEADER.PROCESS_STATUS 
, process_message nvarchar(100) -- SAMPHEADER.PROCESS_MESSAGE 
, reqavail_flag nvarchar(1) -- SAMPHEADER.REQAVAIL_FLAG 
, calcavail_flag nvarchar(1) -- SAMPHEADER.CALCAVAIL_FLAG 
, approval_status nvarchar(4) -- SAMPHEADER.APPROVAL_STATUS 
, galp_id decimal(12,2) -- SAMPHEADER.GALP_ID 
, input_seq decimal(12,2) -- SAMPHEADER.INPUT_SEQ 
, inputdate datetime2 -- SAMPHEADER.INPUTDATE 
, samp_type nvarchar(20) -- SAMPHEADER.SAMP_TYPE 
, run_id nvarchar(20) -- SAMPHEADER.RUN_ID 
, link_id nvarchar(20) -- SAMPHEADER.LINK_ID 
, enterdate datetime2 -- SAMPHEADER.ENTERDATE 
, prep_date1 datetime2 -- SAMPHEADER.PREP_DATE1 
, prep_date2 datetime2 -- SAMPHEADER.PREP_DATE2 
, measuredate datetime2 -- SAMPHEADER.MEASUREDATE 
, rptremarks nvarchar(100) -- SAMPHEADER.RPTREMARKS 
, comments nvarchar(90) -- SAMPHEADER.COMMENTS 
, lastdate datetime2 -- SAMPHEADER.LASTDATE 
, lastuser nvarchar(20) -- SAMPHEADER.LASTUSER 
, lasttool nvarchar(20) -- SAMPHEADER.LASTTOOL 
, analysis_type nvarchar(10) -- SAMPHEADER.ANALYSIS_TYPE 
, analysis_count decimal(12,2) -- SAMPHEADER.ANALYSIS_COUNT 
, rpt_mdl nchar(1) -- SAMPHEADER.RPT_MDL 
, virtual_set decimal(12,2) -- SAMPHEADER.VIRTUAL_SET 
, worknum nvarchar(20) -- SAMPHEADER.WORKNUM 
, tic decimal(12,2) -- SAMPHEADER.TIC 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


