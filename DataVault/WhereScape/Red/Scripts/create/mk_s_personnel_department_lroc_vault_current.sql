CREATE VIEW bus.s_personnel_department_lroc_vault_current(
hk_l_personnel_department, 
home_department_description, 
payroll_company_code, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_personnel_department_lroc_vault.hk_l_personnel_department, 
s_personnel_department_lroc_vault.home department description, 
s_personnel_department_lroc_vault.payroll_company_code, 
s_personnel_department_lroc_vault.dss_change_hash, 
s_personnel_department_lroc_vault.dss_record_source, 
s_personnel_department_lroc_vault.dss_load_date, 
s_personnel_department_lroc_vault.dss_start_date, 
s_personnel_department_lroc_vault.dss_version, 
s_personnel_department_lroc_vault.dss_create_time 
FROM [TABLEOWNER].[s_personnel_department_lroc_vault] s_personnel_department_lroc_vault
INNER JOIN (
    SELECT 
    hk_l_personnel_department, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_personnel_department_lroc_vault]
    GROUP BY hk_l_personnel_department) curr
ON curr.hk_l_personnel_department = s_personnel_department_lroc_vault.hk_l_personnel_department
AND curr.dss_start_date = s_personnel_department_lroc_vault.dss_start_date


