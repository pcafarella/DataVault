CREATE VIEW bus.s_test_hroc_national_current(
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
dss_create_time)
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
s_test_hroc_national.dss_create_time 
FROM [TABLEOWNER].[s_test_hroc_national] s_test_hroc_national
INNER JOIN (
    SELECT 
    hk_h_test, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_test_hroc_national]
    GROUP BY hk_h_test) curr
ON curr.hk_h_test = s_test_hroc_national.hk_h_test
AND curr.dss_start_date = s_test_hroc_national.dss_start_date


