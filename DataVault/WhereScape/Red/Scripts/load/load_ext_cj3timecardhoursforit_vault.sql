Truncate table WSDataVault_dev_incremental.load.load_ext_cj3timecardhoursforit_vault;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_ext_cj3timecardhoursforit_vault
(
company_code
,payroll_name
,file_number
,timecard_date
,day_of_the_week
,hours
,pay_code
,timecard_work_department
,reports_to_file_number
,Assigned_Shift_Description
,Business_Unit_Description
,dss_record_source
,dss_load_date
)
Select ext_CJ3TimecardHoursforIT.company_code
,ext_CJ3TimecardHoursforIT.payroll_name
,ext_CJ3TimecardHoursforIT.file_number
,ext_CJ3TimecardHoursforIT.timecard_date
,ext_CJ3TimecardHoursforIT.day_of_the_week
,ext_CJ3TimecardHoursforIT.hours
,ext_CJ3TimecardHoursforIT.pay_code
,ext_CJ3TimecardHoursforIT.timecard_work_department
,ext_CJ3TimecardHoursforIT.reports_to_file_number
,ext_CJ3TimecardHoursforIT.Assigned_Shift_Description
,ext_CJ3TimecardHoursforIT.Business_Unit_Description
,''
,''
From
[WSDataVault_dev_incremental].ext.ext_CJ3TimecardHoursforIT ext_CJ3TimecardHoursforIT;
UPDATE WSDataVault_dev_incremental.load.load_ext_cj3timecardhoursforit_vault SET dss_record_source = 'Vault.ext.ext_CJ3TimecardHoursforIT'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;