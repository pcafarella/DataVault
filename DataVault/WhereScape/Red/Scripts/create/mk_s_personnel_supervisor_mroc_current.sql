CREATE VIEW bus.s_personnel_supervisor_mroc_current(
hk_l_personnel_supervisor, 
reports_to_legal_first_name, 
reports_to_legal_last_name, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
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
s_personnel_supervisor_mroc.dss_create_time 
FROM [TABLEOWNER].[s_personnel_supervisor_mroc] s_personnel_supervisor_mroc
INNER JOIN (
    SELECT 
    hk_l_personnel_supervisor, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_personnel_supervisor_mroc]
    GROUP BY hk_l_personnel_supervisor) curr
ON curr.hk_l_personnel_supervisor = s_personnel_supervisor_mroc.hk_l_personnel_supervisor
AND curr.dss_start_date = s_personnel_supervisor_mroc.dss_start_date


