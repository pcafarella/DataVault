CREATE TABLE WSDataVault_dev_incremental.stage.stage_department_test_schedule_national (
  hk_l_department_test_schedule nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, test_no nvarchar(4000) -- load_orderdetail_national.samplenum 
, test_no_bkcc nvarchar(max) -- load_ordermast_national.pmatnumref 
, test_no_tenant_id nvarchar(255) 
, department_no nvarchar(50) -- load_orderdetail_national.deptnum 
, department_no_bkcc nvarchar(50) 
, department_no_tenant_id nvarchar(50) 
, process_status_code nvarchar(4) -- load_orderdetail_national.dstatus 
, process_status_date datetime2 -- load_orderdetail_national.dstatusdate 
, process_status_batch_no nvarchar(20) -- load_orderdetail_national.worknum 
, workdate datetime2 -- load_orderdetail_national.workdate 
, workstatus nvarchar(4) -- load_orderdetail_national.workstatus 
, dprevdeptnum decimal(12,2) -- load_orderdetail_national.dprevdeptnum 
, dnextdeptnum decimal(12,2) -- load_orderdetail_national.dnextdeptnum 
, lasttool nvarchar(20) -- load_orderdetail_national.lasttool 
, lastuser nvarchar(20) -- load_orderdetail_national.lastuser 
, login_seq nvarchar(50) -- load_orderdetail_national.login_seq 
, priorityflag nvarchar(3) -- load_orderdetail_national.priorityflag 
, class nvarchar(1) -- load_orderdetail_national.class 
, dalloc decimal(12,2) -- load_orderdetail_national.dalloc 
, dprice decimal(12,2) -- load_orderdetail_national.dprice 
, dcost decimal(12,2) -- load_orderdetail_national.dcost 
, dholddays decimal(12,2) -- load_orderdetail_national.dholddays 
, dholddate datetime2 -- load_orderdetail_national.dholddate 
, dduedays decimal(12,2) -- load_orderdetail_national.dduedays 
, dduedate datetime2 -- load_orderdetail_national.dduedate 
, dss_change_hash_department_test_schedule_hroc_national nchar(64) NOT NULL 
, dss_change_hash_department_test_schedule_lroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_ordermast_national.dss_record_source 
, dss_load_date datetime2 -- load_ordermast_national.dss_load_date 
, dss_create_time datetime2 
) 
;


