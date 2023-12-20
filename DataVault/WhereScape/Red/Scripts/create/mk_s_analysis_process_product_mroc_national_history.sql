CREATE VIEW bus.s_analysis_process_product_mroc_national_history(
hk_l_analysis_process_product, 
link_id, 
description, 
list_pointer, 
list_func, 
parm_stored, 
pchain_name, 
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
s_analysis_process_product_mroc_national.hk_l_analysis_process_product, 
s_analysis_process_product_mroc_national.link_id, 
s_analysis_process_product_mroc_national.description, 
s_analysis_process_product_mroc_national.list_pointer, 
s_analysis_process_product_mroc_national.list_func, 
s_analysis_process_product_mroc_national.parm_stored, 
s_analysis_process_product_mroc_national.pchain_name, 
s_analysis_process_product_mroc_national.dss_change_hash, 
s_analysis_process_product_mroc_national.dss_record_source, 
s_analysis_process_product_mroc_national.dss_load_date, 
s_analysis_process_product_mroc_national.dss_start_date, 
s_analysis_process_product_mroc_national.dss_version, 
s_analysis_process_product_mroc_national.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_l_analysis_process_product
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_l_analysis_process_product
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM [TABLEOWNER].[s_analysis_process_product_mroc_national] s_analysis_process_product_mroc_national


