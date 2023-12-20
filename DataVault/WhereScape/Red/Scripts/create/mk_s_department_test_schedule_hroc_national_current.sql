CREATE VIEW bus.s_department_test_schedule_hroc_national_current(
hk_l_department_test_schedule, 
process_status_code, 
process_status_date, 
process_status_batch_no, 
workdate, 
workstatus, 
dprevdeptnum, 
dnextdeptnum, 
lasttool, 
lastuser, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_department_test_schedule_hroc_national.hk_l_department_test_schedule, 
s_department_test_schedule_hroc_national.process_status_code, 
s_department_test_schedule_hroc_national.process_status_date, 
s_department_test_schedule_hroc_national.process_status_batch_no, 
s_department_test_schedule_hroc_national.workdate, 
s_department_test_schedule_hroc_national.workstatus, 
s_department_test_schedule_hroc_national.dprevdeptnum, 
s_department_test_schedule_hroc_national.dnextdeptnum, 
s_department_test_schedule_hroc_national.lasttool, 
s_department_test_schedule_hroc_national.lastuser, 
s_department_test_schedule_hroc_national.dss_change_hash, 
s_department_test_schedule_hroc_national.dss_record_source, 
s_department_test_schedule_hroc_national.dss_load_date, 
s_department_test_schedule_hroc_national.dss_start_date, 
s_department_test_schedule_hroc_national.dss_version, 
s_department_test_schedule_hroc_national.dss_create_time 
FROM [TABLEOWNER].[s_department_test_schedule_hroc_national] s_department_test_schedule_hroc_national
INNER JOIN (
    SELECT 
    hk_l_department_test_schedule, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_department_test_schedule_hroc_national]
    GROUP BY hk_l_department_test_schedule) curr
ON curr.hk_l_department_test_schedule = s_department_test_schedule_hroc_national.hk_l_department_test_schedule
AND curr.dss_start_date = s_department_test_schedule_hroc_national.dss_start_date


