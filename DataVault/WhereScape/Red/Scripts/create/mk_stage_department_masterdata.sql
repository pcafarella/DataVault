CREATE TABLE WSDataVault_dev_incremental.stage.stage_department_masterdata (
  hk_h_department nchar(64) NOT NULL 
, department_no nvarchar(50) -- load_department_type_masterdata.department_no 
, department_no_bkcc nvarchar(50) 
, tenant_id nvarchar(50) -- load_department_type_masterdata.tenant_id 
 
, department_name nvarchar(100) -- load_department_type_masterdata.department_name 
 
, department_short_name nvarchar(50) -- load_department_type_masterdata.department_short_name 
 
, department_type nvarchar(14) -- load_department_type_masterdata.department_type 
, department_level tinyint -- load_department_type_masterdata.department_level 
, dss_change_hash_department_lroc_masterdata nchar(64) NOT NULL 
 
, dss_record_source nvarchar(255) -- load_department_type_masterdata.dss_record_source 
, dss_load_date datetime2 -- load_department_type_masterdata.dss_load_date 
, dss_create_time datetime2 
) 
;


