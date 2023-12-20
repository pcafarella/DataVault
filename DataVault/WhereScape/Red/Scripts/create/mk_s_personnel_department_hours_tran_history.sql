CREATE VIEW bus.s_personnel_department_hours_tran_history(
hk_l_personnel_department_hours, 
hours, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time, 
dss_end_date, 
dss_current_flag)
AS
SELECT 
s_personnel_department_hours_tran.hk_l_personnel_department_hours, 
s_personnel_department_hours_tran.hours, 
s_personnel_department_hours_tran.dss_change_hash, 
s_personnel_department_hours_tran.dss_record_source, 
s_personnel_department_hours_tran.dss_load_date, 
s_personnel_department_hours_tran.dss_start_date, 
s_personnel_department_hours_tran.dss_version, 
s_personnel_department_hours_tran.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_l_personnel_department_hours
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_l_personnel_department_hours
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_personnel_department_hours_tran] s_personnel_department_hours_tran


