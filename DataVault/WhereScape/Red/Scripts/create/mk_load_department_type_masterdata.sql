CREATE TABLE WSDataVault_dev_incremental.load.load_department_type_masterdata (
  department_no nvarchar(50) -- department_type.department_no 
, department_name nvarchar(100) -- department_type.department_name 
, department_short_name nvarchar(50) -- department_type.department_short_name 
, department_type nvarchar(14) -- department_type.department_type 
, tenant_id nvarchar(50) -- department_type.tenant_id 
, department_level tinyint -- department_type.department_level 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


