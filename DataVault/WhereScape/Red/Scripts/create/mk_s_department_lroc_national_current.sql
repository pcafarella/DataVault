CREATE VIEW bus.s_department_lroc_national_current(
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
dss_create_time)
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
s_department_lroc_national.dss_create_time 
FROM [TABLEOWNER].[s_department_lroc_national] s_department_lroc_national
INNER JOIN (
    SELECT 
    hk_h_department, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_department_lroc_national]
    GROUP BY hk_h_department) curr
ON curr.hk_h_department = s_department_lroc_national.hk_h_department
AND curr.dss_start_date = s_department_lroc_national.dss_start_date


