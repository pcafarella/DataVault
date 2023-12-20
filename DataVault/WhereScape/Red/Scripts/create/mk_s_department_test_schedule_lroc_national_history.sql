CREATE VIEW bus.s_department_test_schedule_lroc_national_history(
hk_l_department_test_schedule, 
login_seq, 
priorityflag, 
class, 
dalloc, 
dprice, 
dcost, 
dholddays, 
dholddate, 
dduedays, 
dduedate, 
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
s_department_test_schedule_lroc_national.hk_l_department_test_schedule, 
s_department_test_schedule_lroc_national.login_seq, 
s_department_test_schedule_lroc_national.priorityflag, 
s_department_test_schedule_lroc_national.class, 
s_department_test_schedule_lroc_national.dalloc, 
s_department_test_schedule_lroc_national.dprice, 
s_department_test_schedule_lroc_national.dcost, 
s_department_test_schedule_lroc_national.dholddays, 
s_department_test_schedule_lroc_national.dholddate, 
s_department_test_schedule_lroc_national.dduedays, 
s_department_test_schedule_lroc_national.dduedate, 
s_department_test_schedule_lroc_national.dss_change_hash, 
s_department_test_schedule_lroc_national.dss_record_source, 
s_department_test_schedule_lroc_national.dss_load_date, 
s_department_test_schedule_lroc_national.dss_start_date, 
s_department_test_schedule_lroc_national.dss_version, 
s_department_test_schedule_lroc_national.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_l_department_test_schedule
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_l_department_test_schedule
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_department_test_schedule_lroc_national] s_department_test_schedule_lroc_national


