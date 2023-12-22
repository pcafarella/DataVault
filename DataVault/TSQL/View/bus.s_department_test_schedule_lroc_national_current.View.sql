/****** Object:  View [bus].[s_department_test_schedule_lroc_national_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_department_test_schedule_lroc_national_current](
hk_l_department_test_schedule, 
login_seq, 
priorityflag, 
class, 
dalloc, 
dprice, 
dcost, 
dholddays, 
dholddate, 
dduedays, 
dduedate, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_department_test_schedule_lroc_national.hk_l_department_test_schedule, 
s_department_test_schedule_lroc_national.login_seq, 
s_department_test_schedule_lroc_national.priorityflag, 
s_department_test_schedule_lroc_national.class, 
s_department_test_schedule_lroc_national.dalloc, 
s_department_test_schedule_lroc_national.dprice, 
s_department_test_schedule_lroc_national.dcost, 
s_department_test_schedule_lroc_national.dholddays, 
s_department_test_schedule_lroc_national.dholddate, 
s_department_test_schedule_lroc_national.dduedays, 
s_department_test_schedule_lroc_national.dduedate, 
s_department_test_schedule_lroc_national.dss_change_hash, 
s_department_test_schedule_lroc_national.dss_record_source, 
s_department_test_schedule_lroc_national.dss_load_date, 
s_department_test_schedule_lroc_national.dss_start_date, 
s_department_test_schedule_lroc_national.dss_version, 
s_department_test_schedule_lroc_national.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_department_test_schedule_lroc_national s_department_test_schedule_lroc_national
INNER JOIN (
    SELECT 
    hk_l_department_test_schedule, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_department_test_schedule_lroc_national
    GROUP BY hk_l_department_test_schedule) curr
ON curr.hk_l_department_test_schedule = s_department_test_schedule_lroc_national.hk_l_department_test_schedule
AND curr.dss_start_date = s_department_test_schedule_lroc_national.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_test_schedule_lroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_test_schedule_lroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_test_schedule_lroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_test_schedule_lroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_test_schedule_lroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_test_schedule_lroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
