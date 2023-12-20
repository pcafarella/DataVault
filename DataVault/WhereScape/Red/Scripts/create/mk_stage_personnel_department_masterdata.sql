CREATE TABLE WSDataVault_dev_incremental.stage.stage_personnel_department_masterdata (
  hk_l_personnel_department nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, hk_h_personnel nchar(64) NOT NULL 
 
, personnel_no nvarchar(50) -- load_adp_supervisor_department_masterdata.supervisor_file_number 
, personnel_no_bkcc nvarchar(50) 
, personnel_no_tenant_id nvarchar(50) 
 
, department_no nvarchar(50) -- load_adp_supervisor_department_masterdata.adj_department 
, department_no_bkcc nvarchar(50) 
, department_no_tenant_id nvarchar(50) 
 
, dss_record_source nvarchar(255) -- load_adp_supervisor_department_masterdata.dss_record_source 
 
, dss_load_date datetime2 -- load_adp_supervisor_department_masterdata.dss_load_date 
, dss_create_time datetime2 
) 
;


