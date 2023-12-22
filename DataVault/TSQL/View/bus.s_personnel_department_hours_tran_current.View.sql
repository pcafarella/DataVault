/****** Object:  View [bus].[s_personnel_department_hours_tran_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [bus].[s_personnel_department_hours_tran_current](
hk_l_personnel_department_hours, 
hours, 
business_unit,
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_personnel_department_hours_tran.hk_l_personnel_department_hours, 
s_personnel_department_hours_tran.hours, 
s_personnel_department_hours_tran.business_unit,
s_personnel_department_hours_tran.dss_change_hash, 
s_personnel_department_hours_tran.dss_record_source, 
s_personnel_department_hours_tran.dss_load_date, 
s_personnel_department_hours_tran.dss_start_date, 
s_personnel_department_hours_tran.dss_version, 
s_personnel_department_hours_tran.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_personnel_department_hours_tran s_personnel_department_hours_tran
INNER JOIN (
    SELECT 
    hk_l_personnel_department_hours, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_personnel_department_hours_tran
    GROUP BY hk_l_personnel_department_hours) curr
ON curr.hk_l_personnel_department_hours = s_personnel_department_hours_tran.hk_l_personnel_department_hours
AND curr.dss_start_date = s_personnel_department_hours_tran.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_personnel_department_hours_tran_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_personnel_department_hours_tran_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_personnel_department_hours_tran_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_personnel_department_hours_tran_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_personnel_department_hours_tran_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_personnel_department_hours_tran_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
