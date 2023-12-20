CREATE TABLE WSDataVault_dev_incremental.stage.stage_personnel_department_hours (
  hk_l_personnel_department_hours nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, hk_h_personnel nchar(64) NOT NULL 
, personnel_no nvarchar(50) -- load_ext_cj3timecardhoursforit_vault.file_number 
, personnel_no_bkcc nvarchar(50) 
, personnel_no_tenant_id nvarchar(50) 
 
, department_no nvarchar(50) -- load_ext_cj3timecardhoursforit_vault.timecard_work_department 
, department_no_bkcc nvarchar(50) 
, department_no_tenant_id nvarchar(50) 
, date_worked datetime2 -- load_ext_cj3timecardhoursforit_vault.timecard_date 
, payroll_name nvarchar(64) -- load_ext_cj3timecardhoursforit_vault.payroll_name 
, pay_code nvarchar(32) -- load_ext_cj3timecardhoursforit_vault.pay_code 
 
, reports_to_file_number int -- load_ext_cj3timecardhoursforit_vault.reports_to_file_number 
, hours decimal(12,2) -- load_ext_cj3timecardhoursforit_vault.hours 
 
, business_unit nvarchar(100) -- load_ext_cj3timecardhoursforit_vault.business_unit_description 
, dss_change_hash_personnel_department_hours_tran nchar(64) NOT NULL 
 
, dss_record_source nvarchar(255) -- load_ext_cj3timecardhoursforit_vault.dss_record_source 
, dss_load_date datetime2 -- load_ext_cj3timecardhoursforit_vault.dss_load_date 
, dss_create_time datetime2 
) 
;


