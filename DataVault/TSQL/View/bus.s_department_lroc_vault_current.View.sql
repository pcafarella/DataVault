/****** Object:  View [bus].[s_department_lroc_vault_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_department_lroc_vault_current](
hk_h_department, 
department_name, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_department_lroc_vault.hk_h_department, 
s_department_lroc_vault.department_name, 
s_department_lroc_vault.dss_change_hash, 
s_department_lroc_vault.dss_record_source, 
s_department_lroc_vault.dss_load_date, 
s_department_lroc_vault.dss_start_date, 
s_department_lroc_vault.dss_version, 
s_department_lroc_vault.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_department_lroc_vault s_department_lroc_vault
INNER JOIN (
    SELECT 
    hk_h_department, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_department_lroc_vault
    GROUP BY hk_h_department) curr
ON curr.hk_h_department = s_department_lroc_vault.hk_h_department
AND curr.dss_start_date = s_department_lroc_vault.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_lroc_vault_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_lroc_vault_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_lroc_vault_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_lroc_vault_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_lroc_vault_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_lroc_vault_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
