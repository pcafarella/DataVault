CREATE VIEW bus.s_department_test_schedule_lroc_national_current(
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
dss_create_time)
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
s_department_test_schedule_lroc_national.dss_create_time 
FROM [TABLEOWNER].[s_department_test_schedule_lroc_national] s_department_test_schedule_lroc_national
INNER JOIN (
    SELECT 
    hk_l_department_test_schedule, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_department_test_schedule_lroc_national]
    GROUP BY hk_l_department_test_schedule) curr
ON curr.hk_l_department_test_schedule = s_department_test_schedule_lroc_national.hk_l_department_test_schedule
AND curr.dss_start_date = s_department_test_schedule_lroc_national.dss_start_date


