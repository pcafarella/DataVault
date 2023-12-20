CREATE TABLE WSDataVault_dev_incremental.stage.stage_department_test_status_national (
  hk_l_department_test_status nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, department_no nvarchar(50) -- load_ordertrack_national.deptnum 
, department_no_bkcc nvarchar(50) 
, department_no_tenant_id nvarchar(255) 
, test_no nvarchar(4000) 
, test_no_bkcc nvarchar(50) -- load_ordermast_national.pmatnumref 
, test_no_tenant_id nvarchar(50) 
, process_status_code nvarchar(4) -- load_ordertrack_national.dstatus 
, process_status_date datetime2 -- load_ordertrack_national.lastdate 
, process_status_batch_no nvarchar(20) -- load_ordertrack_national.worknum 
, dstatusdate datetime2 -- load_ordertrack_national.dstatusdate 
, lasttool nvarchar(20) -- load_ordertrack_national.lasttool 
, lastuser nvarchar(20) -- load_ordertrack_national.lastuser 
, dss_change_hash_department_test_status_tran_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_ordermast_national.dss_record_source 
, dss_load_date datetime2 -- load_ordermast_national.dss_load_date 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX stage_departm_1ad28b3e_idx_A ON WSDataVault_dev_incremental.stage.stage_department_test_status_national (department_no,department_no_bkcc,department_no_tenant_id,test_no,test_no_bkcc,test_no_tenant_id,process_status_code,process_status_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

