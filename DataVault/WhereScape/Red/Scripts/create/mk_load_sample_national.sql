CREATE TABLE WSDataVault_dev_incremental.load.load_sample_national (
  samplenum nvarchar(50) -- SAMPLE.SAMPLENUM 
, clientid nvarchar(50) -- SAMPLE.CLIENTID 
, acctnum nvarchar(20) -- SAMPLE.ACCTNUM 
, projectnum nvarchar(255) -- SAMPLE.PROJECTNUM 
, site nvarchar(max) -- SAMPLE.SITE 
, locator nvarchar(20) -- SAMPLE.LOCATOR 
, qctype nvarchar(10) -- SAMPLE.QCTYPE 
, collectby nvarchar(20) -- SAMPLE.COLLECTBY 
, receivedate datetime2 -- SAMPLE.RECEIVEDATE 
, collectdate datetime2 -- SAMPLE.COLLECTDATE 
, tat decimal(12,2) -- SAMPLE.TAT 
, duedate datetime2 -- SAMPLE.DUEDATE 
, priorityflag nvarchar(3) -- SAMPLE.PRIORITYFLAG 
, loginnum nvarchar(50) -- SAMPLE.LOGINNUM 
, login_seq decimal(12,2) -- SAMPLE.LOGIN_SEQ 
, prelognum nvarchar(10) -- SAMPLE.PRELOGNUM 
, presamplenum nvarchar(20) -- SAMPLE.PRESAMPLENUM 
, expectdate datetime2 -- SAMPLE.EXPECTDATE 
, orderdate datetime2 -- SAMPLE.ORDERDATE 
, description nvarchar(60) -- SAMPLE.DESCRIPTION 
, comments nvarchar(max) -- SAMPLE.COMMENTS 
, quotenumref nvarchar(20) -- SAMPLE.QUOTENUMREF 
, totalprice decimal(12,2) -- SAMPLE.TOTALPRICE 
, invoicenum nvarchar(50) -- SAMPLE.INVOICENUM 
, lastdate datetime2 -- SAMPLE.LASTDATE 
, lasttool nvarchar(20) -- SAMPLE.LASTTOOL 
, lastuser nvarchar(20) -- SAMPLE.LASTUSER 
, samp_function nvarchar(1) -- SAMPLE.SAMP_FUNCTION 
, designid nvarchar(10) -- SAMPLE.DESIGNID 
, reportdate datetime2 -- SAMPLE.REPORTDATE 
, prelog_exportedon datetime2 -- SAMPLE.PRELOG_EXPORTEDON 
, original_report_date datetime2 -- SAMPLE.ORIGINAL_REPORT_DATE 
, tableid nvarchar(10) -- SAMPLE.TABLEID 
, duedate2 datetime2 -- SAMPLE.DUEDATE2 
, collect_timezone nvarchar(10) -- SAMPLE.COLLECT_TIMEZONE 
, utc_collectdate datetime2 -- SAMPLE.UTC_COLLECTDATE 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


