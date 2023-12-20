CREATE VIEW bus.s_personnel_lroc_history(
hk_h_personnel, 
first_name, 
last_name, 
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
s_personnel_lroc.hk_h_personnel, 
s_personnel_lroc.first_name, 
s_personnel_lroc.last_name, 
s_personnel_lroc.dss_change_hash, 
s_personnel_lroc.dss_record_source, 
s_personnel_lroc.dss_load_date, 
s_personnel_lroc.dss_start_date, 
s_personnel_lroc.dss_version, 
s_personnel_lroc.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_h_personnel
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_h_personnel
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_personnel_lroc] s_personnel_lroc


