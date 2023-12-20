CREATE VIEW bus.s_work_order_mroc_national_current(
hk_h_work_order, 
receivedate, 
projectnum, 
locator, 
description, 
first_login_seq, 
sdgid, 
status, 
report_complete, 
tsr, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_work_order_mroc_national.hk_h_work_order, 
s_work_order_mroc_national.receivedate, 
s_work_order_mroc_national.projectnum, 
s_work_order_mroc_national.locator, 
s_work_order_mroc_national.description, 
s_work_order_mroc_national.first_login_seq, 
s_work_order_mroc_national.sdgid, 
s_work_order_mroc_national.status, 
s_work_order_mroc_national.report_complete, 
s_work_order_mroc_national.tsr, 
s_work_order_mroc_national.dss_change_hash, 
s_work_order_mroc_national.dss_record_source, 
s_work_order_mroc_national.dss_load_date, 
s_work_order_mroc_national.dss_start_date, 
s_work_order_mroc_national.dss_version, 
s_work_order_mroc_national.dss_create_time 
FROM [TABLEOWNER].[s_work_order_mroc_national] s_work_order_mroc_national
INNER JOIN (
    SELECT 
    hk_h_work_order, 
    MAX(dss_start_date) AS dss_start_date
    FROM [TABLEOWNER].[s_work_order_mroc_national]
    GROUP BY hk_h_work_order) curr
ON curr.hk_h_work_order = s_work_order_mroc_national.hk_h_work_order
AND curr.dss_start_date = s_work_order_mroc_national.dss_start_date


