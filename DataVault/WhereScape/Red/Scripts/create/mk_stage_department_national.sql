CREATE TABLE WSDataVault_dev_incremental.stage.stage_department_national (
  hk_h_department nchar(64) NOT NULL 
, department_no nvarchar(50) -- load_deptdef_national.deptnum 
, department_no_bkcc nvarchar(50) 
, tenant_id nvarchar(50) 
, department_name nvarchar(100) -- load_deptdef_national.deptname 
, department_short_name nvarchar(50) -- load_deptdef_national.deptabbr 
, deptacctref nvarchar(20) -- load_deptdef_national.deptacctref 
, qcskip_flag nvarchar(1) -- load_deptdef_national.qcskip_flag 
, dss_change_hash_department_lroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_deptdef_national.dss_record_source 
, dss_load_date datetime2 -- load_deptdef_national.dss_load_date 
, dss_create_time datetime2 
) 
;


