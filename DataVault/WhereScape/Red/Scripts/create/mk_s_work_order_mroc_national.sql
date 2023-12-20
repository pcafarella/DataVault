CREATE TABLE WSDataVault_dev_incremental.raw.s_work_order_mroc_national (
 
  hk_h_work_order nchar(64) NOT NULL -- stage_work_order_national.hk_h_work_order 
, receivedate datetime2 -- stage_work_order_national.receivedate 
, projectnum nvarchar(255) -- stage_work_order_national.projectnum 
, locator nvarchar(20) -- stage_work_order_national.locator 
, description nvarchar(60) -- stage_work_order_national.description 
, first_login_seq decimal(12,2) -- stage_work_order_national.first_login_seq 
, sdgid nvarchar(50) -- stage_work_order_national.sdgid 
, status nvarchar(50) -- stage_work_order_national.status 
, report_complete nchar(1) -- stage_work_order_national.report_complete 
, tsr nvarchar(4) -- stage_work_order_national.tsr 
 
, dss_change_hash nchar(64) NOT NULL -- stage_work_order_national.dss_change_hash_work_order_mroc_national 
, dss_record_source nvarchar(255) -- stage_work_order_national.dss_record_source 
, dss_load_date datetime2 -- stage_work_order_national.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE CLUSTERED INDEX s_work_order__e0da05e5_idx_PK ON WSDataVault_dev_incremental.raw.s_work_order_mroc_national (hk_h_work_order,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX s_work_order__e0da05e5_idx_CK ON WSDataVault_dev_incremental.raw.s_work_order_mroc_national (hk_h_work_order,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

