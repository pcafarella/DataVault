CREATE VIEW bus.s_customer_mroc_national_history(
hk_h_customer, 
acctname, 
acctfactor, 
lastdate, 
lasttool, 
lastuser, 
mas90code, 
date_establishd, 
dso, 
customertype, 
creationdate, 
national_acct_flag, 
active, 
sample_state, 
buyer_type, 
market_segment, 
industry_sector, 
pace_excludeinflation, 
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
s_customer_mroc_national.hk_h_customer, 
s_customer_mroc_national.acctname, 
s_customer_mroc_national.acctfactor, 
s_customer_mroc_national.lastdate, 
s_customer_mroc_national.lasttool, 
s_customer_mroc_national.lastuser, 
s_customer_mroc_national.mas90code, 
s_customer_mroc_national.date_establishd, 
s_customer_mroc_national.dso, 
s_customer_mroc_national.customertype, 
s_customer_mroc_national.creationdate, 
s_customer_mroc_national.national_acct_flag, 
s_customer_mroc_national.active, 
s_customer_mroc_national.sample_state, 
s_customer_mroc_national.buyer_type, 
s_customer_mroc_national.market_segment, 
s_customer_mroc_national.industry_sector, 
s_customer_mroc_national.pace_excludeinflation, 
s_customer_mroc_national.dss_change_hash, 
s_customer_mroc_national.dss_record_source, 
s_customer_mroc_national.dss_load_date, 
s_customer_mroc_national.dss_start_date, 
s_customer_mroc_national.dss_version, 
s_customer_mroc_national.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_h_customer
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_h_customer
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_customer_mroc_national] s_customer_mroc_national


