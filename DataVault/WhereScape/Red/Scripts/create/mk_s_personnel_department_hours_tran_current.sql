CREATE VIEW bus.s_personnel_department_hours_tran_current(
hk_l_personnel_department_hours, 
hours, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_personnel_department_hours_tran.hk_l_personnel_department_hours, 
s_personnel_department_hours_tran.hours, 
s_personnel_department_hours_tran.dss_change_hash, 
s_personnel_department_hours_tran.dss_record_source, 
s_personnel_department_hours_tran.dss_load_date, 
s_personnel_department_hours_tran.dss_start_date, 
s_personnel_department_hours_tran.dss_version, 
s_personnel_department_hours_tran.dss_create_time 
FROM [TABLEOWNER].[s_personnel_department_hours_tran] s_personnel_department_hours_tran
INNER JOIN (
    SELECT 
    hk_l_personnel_department_hours, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_personnel_department_hours_tran]
    GROUP BY hk_l_personnel_department_hours) curr
ON curr.hk_l_personnel_department_hours = s_personnel_department_hours_tran.hk_l_personnel_department_hours
AND curr.dss_start_date = s_personnel_department_hours_tran.dss_start_date


