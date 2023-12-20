CREATE VIEW bus.s_personnel_supervisor_mroc_history(
hk_l_personnel_supervisor, 
reports_to_legal_first_name, 
reports_to_legal_last_name, 
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
s_personnel_supervisor_mroc.hk_l_personnel_supervisor, 
s_personnel_supervisor_mroc.reports to legal first name, 
s_personnel_supervisor_mroc.reports to legal last name, 
s_personnel_supervisor_mroc.dss_change_hash, 
s_personnel_supervisor_mroc.dss_record_source, 
s_personnel_supervisor_mroc.dss_load_date, 
s_personnel_supervisor_mroc.dss_start_date, 
s_personnel_supervisor_mroc.dss_version, 
s_personnel_supervisor_mroc.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_l_personnel_supervisor
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_l_personnel_supervisor
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_personnel_supervisor_mroc] s_personnel_supervisor_mroc


