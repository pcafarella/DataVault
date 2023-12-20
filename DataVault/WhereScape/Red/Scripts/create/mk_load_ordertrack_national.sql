CREATE TABLE WSDataVault_dev_incremental.load.load_ordertrack_national (
  samplenum nvarchar(20) -- ORDERTRACK.SAMPLENUM 
, matnum nvarchar(4) -- ORDERTRACK.MATNUM 
, prod nvarchar(20) -- ORDERTRACK.PROD 
, deptnum nvarchar(50) -- ORDERTRACK.DEPTNUM 
, worknum nvarchar(20) -- ORDERTRACK.WORKNUM 
, dstatus nvarchar(4) -- ORDERTRACK.DSTATUS 
, dstatusdate datetime2 -- ORDERTRACK.DSTATUSDATE 
, lastdate datetime2 -- ORDERTRACK.LASTDATE 
, lasttool nvarchar(20) -- ORDERTRACK.LASTTOOL 
, lastuser nvarchar(20) -- ORDERTRACK.LASTUSER 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


