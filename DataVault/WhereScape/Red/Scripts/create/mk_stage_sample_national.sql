CREATE TABLE WSDataVault_dev_incremental.stage.stage_sample_national (
  hk_h_sample nchar(64) NOT NULL 
, sample_no nvarchar(50) -- load_sample_national.samplenum 
, sample_no_bkcc nvarchar(255) -- load_sample_national.loginnum 
, tenant_id nvarchar(255) 
, clientid nvarchar(50) -- load_sample_national.clientid 
, projectnum nvarchar(255) -- load_sample_national.projectnum 
, site nvarchar(max) -- load_sample_national.site 
, locator nvarchar(20) -- load_sample_national.locator 
, qctype nvarchar(10) -- load_sample_national.qctype 
, collectby nvarchar(20) -- load_sample_national.collectby 
, receivedate datetime2 -- load_sample_national.receivedate 
, collectdate datetime2 -- load_sample_national.collectdate 
, tat decimal(12,2) -- load_sample_national.tat 
, duedate datetime2 -- load_sample_national.duedate 
, priorityflag nvarchar(3) -- load_sample_national.priorityflag 
, login_seq decimal(12,2) -- load_sample_national.login_seq 
, prelognum nvarchar(10) -- load_sample_national.prelognum 
, presamplenum nvarchar(20) -- load_sample_national.presamplenum 
, expectdate datetime2 -- load_sample_national.expectdate 
, orderdate datetime2 -- load_sample_national.orderdate 
, samplecomments nvarchar(max) -- load_sample_national.comments 
, description nvarchar(60) -- load_sample_national.description 
, quotenumref nvarchar(20) -- load_sample_national.quotenumref 
, totalprice decimal(12,2) -- load_sample_national.totalprice 
, lastdate datetime2 -- load_sample_national.lastdate 
, lasttool nvarchar(20) -- load_sample_national.lasttool 
, lastuser nvarchar(20) -- load_sample_national.lastuser 
, samp_function nvarchar(1) -- load_sample_national.samp_function 
, designid nvarchar(10) -- load_sample_national.designid 
, reportdate datetime2 -- load_sample_national.reportdate 
, prelog_exportedon datetime2 -- load_sample_national.prelog_exportedon 
, original_report_date datetime2 -- load_sample_national.original_report_date 
, tableid nvarchar(10) -- load_sample_national.tableid 
, duedate2 datetime2 -- load_sample_national.duedate2 
, collect_timezone nvarchar(10) -- load_sample_national.collect_timezone 
, utc_collectdate datetime2 -- load_sample_national.utc_collectdate 
, dss_change_hash_sample_mroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_sample_national.dss_record_source 
, dss_load_date datetime2 -- load_sample_national.dss_load_date 
, dss_create_time datetime2 
) 
;


