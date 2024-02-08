EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_current_flag'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_end_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
/****** Object:  View [bus].[s_test_hroc_national_history]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [bus].[s_test_hroc_national_history]
GO
/****** Object:  View [bus].[s_test_hroc_national_history]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE                    VIEW [bus].[s_test_hroc_national_history] AS

 --select * from [bus].[s_test_hroc_national_current] s join raw.h_test on h_test.hk_h_test = s.hk_h_test WHERE h_test.test_no like   '%L1698865-14|CRICP%'
 --select * from [bus].[s_test_hroc_national_history] s join raw.h_test on h_test.hk_h_test = s.hk_h_test WHERE h_test.test_no like    'L1698865-14%CRICP%'
-- select * from [raw].[s_test_hroc_national] s join raw.h_test on h_test.hk_h_test = s.hk_h_test WHERE h_test.test_no like    'L1698865-14%'
-- select * from ref.r_record_tracking where key_value = 'L1661969-01'

 
SELECT 
s_test_hroc_national.hk_h_test, 
s_test_hroc_national.price, 
s_test_hroc_national.surcharge, 
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
CASE WHEN r.hk_h_test IS NULL AND LEAD(s_test_hroc_national.dss_start_date) OVER(PARTITION BY h_test.hk_h_test  ORDER BY s_test_hroc_national.dss_start_date) IS NULL THEN s_test_hroc_national.dss_start_date ELSE
		 LEAD(s_test_hroc_national.dss_start_date, 1, '9999-12-31') OVER(PARTITION BY h_test.hk_h_test  ORDER BY s_test_hroc_national.dss_start_date) END dss_end_date, 
 CASE WHEN LEAD(s_test_hroc_national.dss_start_date, 1, NULL) OVER(PARTITION BY s_test_hroc_national.hk_h_test ORDER BY s_test_hroc_national.dss_start_date) IS NOT NULL OR (r.hk_h_test IS NULL) THEN 'N' ELSE 'Y' END dss_current_flag 
FROM WSDataVault_dev_incremental.raw.s_test_hroc_national s_test_hroc_national
JOIN raw.h_test on h_test.hk_h_test = s_test_hroc_national.hk_h_test
LEFT JOIN bus.s_test_hroc_national_current r on r.hk_h_test = h_test.hk_h_test

GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'End date determined by the next Satellite change record dss_start_date' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_end_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'CurrentFlag ''N'' unless next Satellite change record dss_start_date is null, indicating this is the most current record.' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_current_flag'
GO
