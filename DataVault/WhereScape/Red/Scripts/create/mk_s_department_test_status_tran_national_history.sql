CREATE VIEW bus.s_department_test_status_tran_national_history(
hk_l_department_test_status, 
process_status_batch_no, 
dstatusdate, 
lasttool, 
lastuser, 
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
s_department_test_status_tran_national.hk_l_department_test_status, 
s_department_test_status_tran_national.process_status_batch_no, 
s_department_test_status_tran_national.dstatusdate, 
s_department_test_status_tran_national.lasttool, 
s_department_test_status_tran_national.lastuser, 
s_department_test_status_tran_national.dss_change_hash, 
s_department_test_status_tran_national.dss_record_source, 
s_department_test_status_tran_national.dss_load_date, 
s_department_test_status_tran_national.dss_start_date, 
s_department_test_status_tran_national.dss_version, 
s_department_test_status_tran_national.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_l_department_test_status
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_l_department_test_status
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_department_test_status_tran_national] s_department_test_status_tran_national


