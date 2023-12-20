CREATE VIEW bus.s_department_lroc_masterdata_current(
hk_h_department, 
department_name, 
department_short_name, 
department_type, 
department_level, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_department_lroc_masterdata.hk_h_department, 
s_department_lroc_masterdata.department_name, 
s_department_lroc_masterdata.department_short_name, 
s_department_lroc_masterdata.department_type, 
s_department_lroc_masterdata.department_level, 
s_department_lroc_masterdata.dss_change_hash, 
s_department_lroc_masterdata.dss_record_source, 
s_department_lroc_masterdata.dss_load_date, 
s_department_lroc_masterdata.dss_start_date, 
s_department_lroc_masterdata.dss_version, 
s_department_lroc_masterdata.dss_create_time 
FROM [TABLEOWNER].[s_department_lroc_masterdata] s_department_lroc_masterdata
INNER JOIN (
    SELECT 
    hk_h_department, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_department_lroc_masterdata]
    GROUP BY hk_h_department) curr
ON curr.hk_h_department = s_department_lroc_masterdata.hk_h_department
AND curr.dss_start_date = s_department_lroc_masterdata.dss_start_date


