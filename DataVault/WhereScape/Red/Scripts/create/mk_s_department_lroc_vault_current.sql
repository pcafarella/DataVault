CREATE VIEW bus.s_department_lroc_vault_current(
hk_h_department, 
department_name, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_department_lroc_vault.hk_h_department, 
s_department_lroc_vault.department_name, 
s_department_lroc_vault.dss_change_hash, 
s_department_lroc_vault.dss_record_source, 
s_department_lroc_vault.dss_load_date, 
s_department_lroc_vault.dss_start_date, 
s_department_lroc_vault.dss_version, 
s_department_lroc_vault.dss_create_time 
FROM [TABLEOWNER].[s_department_lroc_vault] s_department_lroc_vault
INNER JOIN (
    SELECT 
    hk_h_department, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_department_lroc_vault]
    GROUP BY hk_h_department) curr
ON curr.hk_h_department = s_department_lroc_vault.hk_h_department
AND curr.dss_start_date = s_department_lroc_vault.dss_start_date


