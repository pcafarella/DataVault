CREATE TABLE WSDataVault_dev_incremental.load.load_ext_cj3timecardhoursforit_vault (
  company_code nvarchar(64) -- ext_CJ3TimecardHoursforIT.company_code 
, payroll_name nvarchar(64) -- ext_CJ3TimecardHoursforIT.payroll_name 
, file_number nvarchar(50) -- ext_CJ3TimecardHoursforIT.file_number 
, timecard_date datetime2 -- ext_CJ3TimecardHoursforIT.timecard_date 
, day_of_the_week nvarchar(64) -- ext_CJ3TimecardHoursforIT.day_of_the_week 
, hours decimal(12,2) -- ext_CJ3TimecardHoursforIT.hours 
, pay_code nvarchar(32) -- ext_CJ3TimecardHoursforIT.pay_code 
 
, timecard_work_department nvarchar(50) -- ext_CJ3TimecardHoursforIT.timecard_work_department 
, reports_to_file_number int -- ext_CJ3TimecardHoursforIT.reports_to_file_number 
 
, Assigned_Shift_Description VARCHAR(100) -- ext_CJ3TimecardHoursforIT.Assigned_Shift_Description 
 
, Business_Unit_Description VARCHAR(100) NOT NULL -- ext_CJ3TimecardHoursforIT.Business_Unit_Description 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


