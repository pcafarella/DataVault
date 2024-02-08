EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_current_flag'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_end_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
/****** Object:  View [bus].[s_sample_mroc_national_history]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [bus].[s_sample_mroc_national_history]
GO
/****** Object:  View [bus].[s_sample_mroc_national_history]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       VIEW [bus].[s_sample_mroc_national_history](
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
dss_create_time, 
dss_end_date, 
dss_current_flag)
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
s_sample_mroc_national.dss_create_time, 
 CASE WHEN r.key_value IS NOT NULL AND LEAD(dss_start_date) OVER(PARTITION BY h_sample.hk_h_sample  ORDER BY dss_start_date) IS NULL THEN dss_start_date ELSE
		 LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY h_sample.hk_h_sample  ORDER BY dss_start_date) END dss_end_date, 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY s_sample_mroc_national.hk_h_sample ORDER BY dss_start_date) IS NOT NULL OR (r.key_value IS NOT NULL AND ri.key_value is null) THEN 'N' ELSE 'Y' END dss_current_flag
FROM  raw.s_sample_mroc_national s_sample_mroc_national
INNER JOIN raw.h_sample on h_sample.hk_h_sample = s_sample_mroc_national.hk_h_sample
LEFT JOIN ref.r_record_tracking r on  r.key_value =  h_sample.sample_no AND r.audit_table = 'SAMPLE' AND r.audit_action = 'DELETE'
LEFT JOIN ref.r_record_tracking ri on  ri.key_value =  h_sample.sample_no AND ri.audit_table = 'SAMPLE' AND  ri.audit_action = 'INSERT'

  
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'End date determined by the next Satellite change record dss_start_date' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_end_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'CurrentFlag ''N'' unless next Satellite change record dss_start_date is null, indicating this is the most current record.' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_sample_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_current_flag'
GO
