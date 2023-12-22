CREATE VIEW bus.s_test_hroc_national_history(
hk_h_test, 
price, 
pkey, 
plevel, 
pprodref, 
pmatnumref, 
class, 
cost, 
holddate, 
holddays, 
holdflg, 
duedate, 
duedays, 
location, 
bottles, 
lastdate, 
lasttool, 
lastuser, 
designid, 
comp, 
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
s_test_hroc_national.hk_h_test, 
s_test_hroc_national.price, 
s_test_hroc_national.pkey, 
s_test_hroc_national.plevel, 
s_test_hroc_national.pprodref, 
s_test_hroc_national.pmatnumref, 
s_test_hroc_national.class, 
s_test_hroc_national.cost, 
s_test_hroc_national.holddate, 
s_test_hroc_national.holddays, 
s_test_hroc_national.holdflg, 
s_test_hroc_national.duedate, 
s_test_hroc_national.duedays, 
s_test_hroc_national.location, 
s_test_hroc_national.bottles, 
s_test_hroc_national.lastdate, 
s_test_hroc_national.lasttool, 
s_test_hroc_national.lastuser, 
s_test_hroc_national.designid, 
s_test_hroc_national.comp, 
s_test_hroc_national.dss_change_hash, 
s_test_hroc_national.dss_record_source, 
s_test_hroc_national.dss_load_date, 
s_test_hroc_national.dss_start_date, 
s_test_hroc_national.dss_version, 
s_test_hroc_national.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_h_test
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_h_test
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_test_hroc_national] s_test_hroc_national

