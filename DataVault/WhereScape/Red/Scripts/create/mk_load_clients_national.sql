CREATE TABLE WSDataVault_dev_incremental.load.load_clients_national (
  acctnum nvarchar(50) -- CLIENTS.ACCTNUM 
, projectnum nvarchar(50) -- CLIENTS.PROJECTNUM 
, active nvarchar(1) -- CLIENTS.ACTIVE 
, sample_interval decimal(12,2) -- CLIENTS.SAMPLE_INTERVAL 
, tat decimal(12,2) -- CLIENTS.TAT 
, tsr nvarchar(4) -- CLIENTS.TSR 
, basin tinyint -- CLIENTS.BASIN 
, sample_state nvarchar(2) -- CLIENTS.SAMPLE_STATE 
, client_type nvarchar(1) -- CLIENTS.CLIENT_TYPE 
, acct_alert nvarchar(1) -- CLIENTS.ACCT_ALERT 
, po_required nvarchar(1) -- CLIENTS.PO_REQUIRED 
, rpt_quals nvarchar(1) -- CLIENTS.RPT_QUALS 
, rpt_mcl nvarchar(1) -- CLIENTS.RPT_MCL 
, ponumber nvarchar(40) -- CLIENTS.PONUMBER 
, termcode nvarchar(10) -- CLIENTS.TERMCODE 
, designid nvarchar(10) -- CLIENTS.DESIGNID 
, comments nvarchar(max) -- CLIENTS.COMMENTS 
, source nvarchar(4) -- CLIENTS.SOURCE 
, terr nvarchar(2) -- CLIENTS.TERR 
, county nvarchar(50) -- CLIENTS.COUNTY 
, inv_with_rpt nvarchar(1) -- CLIENTS.INV_WITH_RPT 
, webflag nvarchar(1) -- CLIENTS.WEBFLAG 
, rpt_qc nvarchar(1) -- CLIENTS.RPT_QC 
, webinvflag nvarchar(1) -- CLIENTS.WEBINVFLAG 
, archive_flag nvarchar(1) -- CLIENTS.ARCHIVE_FLAG 
, archive_date datetime2 -- CLIENTS.ARCHIVE_DATE 
, service nvarchar(4) -- CLIENTS.SERVICE 
, rpt_mdl nvarchar(1) -- CLIENTS.RPT_MDL 
, min_invoice_amt decimal(12,2) -- CLIENTS.MIN_INVOICE_AMT 
, report_packet_id decimal(12,2) -- CLIENTS.REPORT_PACKET_ID 
, historical_data_check nchar(1) -- CLIENTS.HISTORICAL_DATA_CHECK 
, rpt_multi_runs nchar(1) -- CLIENTS.RPT_MULTI_RUNS 
, container_label_type nvarchar(20) -- CLIENTS.CONTAINER_LABEL_TYPE 
, hdc_level_2 nchar(1) -- CLIENTS.HDC_LEVEL_2 
, uploaded_data_flag nvarchar(20) -- CLIENTS.UPLOADED_DATA_FLAG 
, lastdate datetime2 -- CLIENTS.LASTDATE 
, lastuser nvarchar(30) -- CLIENTS.LASTUSER 
, lasttool nvarchar(30) -- CLIENTS.LASTTOOL 
, certification_program nvarchar(30) -- CLIENTS.CERTIFICATION_PROGRAM 
, use_repdb_config nvarchar(1) -- CLIENTS.USE_REPDB_CONFIG 
, buyer_type nvarchar(20) -- CLIENTS.BUYER_TYPE 
, market_segment nvarchar(20) -- CLIENTS.MARKET_SEGMENT 
, industry_sector nvarchar(20) -- CLIENTS.INDUSTRY_SECTOR 
, combine_inv_coc nvarchar(1) -- CLIENTS.COMBINE_INV_COC 
, auto_approve_lvl2_report nchar(1) -- CLIENTS.AUTO_APPROVE_LVL2_REPORT 
, scinfl_percent decimal(12,2) -- CLIENTS.SCINFL_PERCENT 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


