CREATE VIEW bus.s_personnel_lroc_current(
hk_h_personnel, 
first_name, 
last_name, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
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
s_personnel_lroc.dss_create_time 
FROM [TABLEOWNER].[s_personnel_lroc] s_personnel_lroc
INNER JOIN (
    SELECT 
    hk_h_personnel, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_personnel_lroc]
    GROUP BY hk_h_personnel) curr
ON curr.hk_h_personnel = s_personnel_lroc.hk_h_personnel
AND curr.dss_start_date = s_personnel_lroc.dss_start_date


