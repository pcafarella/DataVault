CREATE VIEW bus.s_invoice_mroc_national_history(
hk_h_invoice, 
ponumber, 
invoicedate, 
invoiceref, 
invoicecomm, 
projectnum, 
description, 
status, 
lastdate, 
lasttool, 
lastuser, 
redostatus, 
mas90date, 
original_invoice_date, 
summary_invoice, 
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
s_invoice_mroc_national.hk_h_invoice, 
s_invoice_mroc_national.ponumber, 
s_invoice_mroc_national.invoicedate, 
s_invoice_mroc_national.invoiceref, 
s_invoice_mroc_national.invoicecomm, 
s_invoice_mroc_national.projectnum, 
s_invoice_mroc_national.description, 
s_invoice_mroc_national.status, 
s_invoice_mroc_national.lastdate, 
s_invoice_mroc_national.lasttool, 
s_invoice_mroc_national.lastuser, 
s_invoice_mroc_national.redostatus, 
s_invoice_mroc_national.mas90date, 
s_invoice_mroc_national.original_invoice_date, 
s_invoice_mroc_national.summary_invoice, 
s_invoice_mroc_national.dss_change_hash, 
s_invoice_mroc_national.dss_record_source, 
s_invoice_mroc_national.dss_load_date, 
s_invoice_mroc_national.dss_start_date, 
s_invoice_mroc_national.dss_version, 
s_invoice_mroc_national.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_h_invoice
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_h_invoice
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_invoice_mroc_national] s_invoice_mroc_national


