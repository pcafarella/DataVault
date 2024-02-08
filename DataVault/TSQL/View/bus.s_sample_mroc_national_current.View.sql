EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
/****** Object:  View [bus].[s_sample_mroc_national_current]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [bus].[s_sample_mroc_national_current]
GO
/****** Object:  View [bus].[s_sample_mroc_national_current]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       VIEW [bus].[s_sample_mroc_national_current](
hk_h_sample, 
clientid, 
projectnum, 
site, 
locator, 
qctype, 
collectby, 
receivedate, 
collectdate, 
tat, 
duedate, 
priorityflag, 
login_seq, 
prelognum, 
presamplenum, 
expectdate, 
orderdate, 
samplecomments, 
description, 
quotenumref, 
totalprice, 
lastdate, 
lasttool, 
lastuser, 
samp_function, 
designid, 
reportdate, 
prelog_exportedon, 
original_report_date, 
tableid, 
duedate2, 
collect_timezone, 
utc_collectdate, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_sample_mroc_national.hk_h_sample, 
s_sample_mroc_national.clientid, 
s_sample_mroc_national.projectnum, 
s_sample_mroc_national.site, 
s_sample_mroc_national.locator, 
s_sample_mroc_national.qctype, 
s_sample_mroc_national.collectby, 
s_sample_mroc_national.receivedate, 
s_sample_mroc_national.collectdate, 
s_sample_mroc_national.tat, 
s_sample_mroc_national.duedate, 
s_sample_mroc_national.priorityflag, 
s_sample_mroc_national.login_seq, 
s_sample_mroc_national.prelognum, 
s_sample_mroc_national.presamplenum, 
s_sample_mroc_national.expectdate, 
s_sample_mroc_national.orderdate, 
s_sample_mroc_national.samplecomments, 
s_sample_mroc_national.description, 
s_sample_mroc_national.quotenumref, 
s_sample_mroc_national.totalprice, 
s_sample_mroc_national.lastdate, 
s_sample_mroc_national.lasttool, 
s_sample_mroc_national.lastuser, 
s_sample_mroc_national.samp_function, 
s_sample_mroc_national.designid, 
s_sample_mroc_national.reportdate, 
s_sample_mroc_national.prelog_exportedon, 
s_sample_mroc_national.original_report_date, 
s_sample_mroc_national.tableid, 
s_sample_mroc_national.duedate2, 
s_sample_mroc_national.collect_timezone, 
s_sample_mroc_national.utc_collectdate, 
s_sample_mroc_national.dss_change_hash, 
s_sample_mroc_national.dss_record_source, 
s_sample_mroc_national.dss_load_date, 
s_sample_mroc_national.dss_start_date, 
s_sample_mroc_national.dss_version, 
s_sample_mroc_national.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_sample_mroc_national s_sample_mroc_national
INNER JOIN (
    SELECT 
    hk_h_sample, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_sample_mroc_national
    GROUP BY hk_h_sample) curr
ON curr.hk_h_sample = s_sample_mroc_national.hk_h_sample
AND curr.dss_start_date = s_sample_mroc_national.dss_start_date
INNER JOIN WSDataVault_dev_incremental.raw.h_sample on h_sample.hk_h_sample = s_sample_mroc_national.hk_h_sample
WHERE (NOT EXISTS (SELECT 1 FROM  ref.r_record_tracking where key_value =  h_sample.sample_no AND audit_table = 'SAMPLE' AND audit_action = 'DELETE' ) 
        OR EXISTS (SELECT  1 FROM ref.r_record_tracking where key_value =  h_sample.sample_no AND audit_table = 'SAMPLE' AND audit_action = 'INSERT' ))
 

GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
