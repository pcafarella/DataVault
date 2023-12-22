/****** Object:  View [bus].[s_product_mroc_national_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       VIEW [bus].[s_product_mroc_national_current](
hk_h_product, 
matrix, 
description, 
method, 
class, 
holddays, 
holdflg, 
duedays, 
factorflg, 
containertype, 
bottles, 
lastdate, 
lasttool, 
lastuser, 
costcenter, 
phasecode, 
auto_anrev_flag, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_product_mroc_national.hk_h_product, 
s_product_mroc_national.matrix, 
s_product_mroc_national.description, 
s_product_mroc_national.method, 
s_product_mroc_national.class, 
s_product_mroc_national.holddays, 
s_product_mroc_national.holdflg, 
s_product_mroc_national.duedays, 
s_product_mroc_national.factorflg, 
s_product_mroc_national.containertype, 
s_product_mroc_national.bottles, 
s_product_mroc_national.lastdate, 
s_product_mroc_national.lasttool, 
s_product_mroc_national.lastuser, 
s_product_mroc_national.costcenter, 
s_product_mroc_national.phasecode, 
s_product_mroc_national.auto_anrev_flag, 
s_product_mroc_national.dss_change_hash, 
s_product_mroc_national.dss_record_source, 
s_product_mroc_national.dss_load_date, 
s_product_mroc_national.dss_start_date, 
s_product_mroc_national.dss_version, 
s_product_mroc_national.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_product_mroc_national s_product_mroc_national
INNER JOIN (
    SELECT 
    hk_h_product, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_product_mroc_national
    GROUP BY hk_h_product) curr
ON curr.hk_h_product = s_product_mroc_national.hk_h_product
AND curr.dss_start_date = s_product_mroc_national.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_product_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
