CREATE VIEW bus.s_department_lroc_vault_history(
hk_h_department, 
department_name, 
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
s_department_lroc_vault.hk_h_department, 
s_department_lroc_vault.department_name, 
s_department_lroc_vault.dss_change_hash, 
s_department_lroc_vault.dss_record_source, 
s_department_lroc_vault.dss_load_date, 
s_department_lroc_vault.dss_start_date, 
s_department_lroc_vault.dss_version, 
s_department_lroc_vault.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_h_department
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_h_department
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_department_lroc_vault] s_department_lroc_vault


