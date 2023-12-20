CREATE VIEW bus.s_department_lroc_national_history(
hk_h_department, 
department_name, 
department_short_name, 
deptacctref, 
qcskip_flag, 
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
s_department_lroc_national.hk_h_department, 
s_department_lroc_national.department_name, 
s_department_lroc_national.department_short_name, 
s_department_lroc_national.deptacctref, 
s_department_lroc_national.qcskip_flag, 
s_department_lroc_national.dss_change_hash, 
s_department_lroc_national.dss_record_source, 
s_department_lroc_national.dss_load_date, 
s_department_lroc_national.dss_start_date, 
s_department_lroc_national.dss_version, 
s_department_lroc_national.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_h_department
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_h_department
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_department_lroc_national] s_department_lroc_national


