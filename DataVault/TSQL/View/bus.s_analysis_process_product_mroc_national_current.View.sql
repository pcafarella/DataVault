/****** Object:  View [bus].[s_analysis_process_product_mroc_national_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_analysis_process_product_mroc_national_current](
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
dss_create_time)
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
s_analysis_process_product_mroc_national.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_analysis_process_product_mroc_national s_analysis_process_product_mroc_national
INNER JOIN (
    SELECT 
    hk_l_analysis_process_product, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_analysis_process_product_mroc_national
    GROUP BY hk_l_analysis_process_product) curr
ON curr.hk_l_analysis_process_product = s_analysis_process_product_mroc_national.hk_l_analysis_process_product
AND curr.dss_start_date = s_analysis_process_product_mroc_national.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analysis_process_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analysis_process_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analysis_process_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analysis_process_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analysis_process_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_analysis_process_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
