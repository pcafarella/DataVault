CREATE TABLE WSDataVault_dev_incremental.stage.stage_department_paceport (
  hk_h_department nchar(64) NOT NULL 
, department_no nvarchar(50) -- load_dmart_locations_paceport.location_seq 
, department_no_bkcc nvarchar(50) 
, tenant_id nvarchar(50) -- load_dmart_locations_paceport.system_id 
 
, dss_record_source nvarchar(255) -- load_dmart_locations_paceport.dss_record_source 
, dss_load_date datetime2 -- load_dmart_locations_paceport.dss_load_date 
, dss_create_time datetime2 
) 
;


