CREATE TABLE WSDataVault_dev_incremental.load.load_orderdetail_national (
  samplenum nvarchar(4000) -- ORDERDETAIL.SAMPLENUM 
, matnum nvarchar(50) -- ORDERDETAIL.MATNUM 
, prod nvarchar(20) -- ORDERDETAIL.PROD 
, login_seq nvarchar(50) -- ORDERDETAIL.LOGIN_SEQ 
, loginnum nvarchar(10) -- ORDERDETAIL.LOGINNUM 
, worknum nvarchar(20) -- ORDERDETAIL.WORKNUM 
, workdate datetime2 -- ORDERDETAIL.WORKDATE 
, workstatus nvarchar(50) -- ORDERDETAIL.WORKSTATUS 
, priorityflag nvarchar(3) -- ORDERDETAIL.PRIORITYFLAG 
, class nvarchar(50) -- ORDERDETAIL.CLASS 
, deptnum nvarchar(50) -- ORDERDETAIL.DEPTNUM 
, dstatus nvarchar(4) -- ORDERDETAIL.DSTATUS 
, dstatusdate datetime2 -- ORDERDETAIL.DSTATUSDATE 
, dalloc decimal(12,2) -- ORDERDETAIL.DALLOC 
, dprice decimal(12,2) -- ORDERDETAIL.DPRICE 
, dcost decimal(12,2) -- ORDERDETAIL.DCOST 
, dholddays decimal(12,2) -- ORDERDETAIL.DHOLDDAYS 
, dholddate datetime2 -- ORDERDETAIL.DHOLDDATE 
, dduedays decimal(12,2) -- ORDERDETAIL.DDUEDAYS 
, dduedate datetime2 -- ORDERDETAIL.DDUEDATE 
, dprevdeptnum decimal(12,2) -- ORDERDETAIL.DPREVDEPTNUM 
, dnextdeptnum decimal(12,2) -- ORDERDETAIL.DNEXTDEPTNUM 
, lastdate datetime2 -- ORDERDETAIL.LASTDATE 
, lasttool nvarchar(20) -- ORDERDETAIL.LASTTOOL 
, lastuser nvarchar(20) -- ORDERDETAIL.LASTUSER 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


