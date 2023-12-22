/****** Object:  View [bus].[s_department_instrument_run_mroc_national_history]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_department_instrument_run_mroc_national_history](
hk_l_department_instrument_run, 
instrument_run_no, 
audit_seq, 
samp_tag, 
login_seq, 
list_joinid, 
snapshot_flag, 
dkey_flag, 
parm_validate_flag, 
dkey_cnt, 
pchain_id, 
calcid, 
process_step, 
process_id, 
nextprocess_id, 
process_status, 
process_message, 
reqavail_flag, 
calcavail_flag, 
approval_status, 
galp_id, 
input_seq, 
inputdate, 
samp_type, 
link_id, 
enterdate, 
prep_date1, 
prep_date2, 
measuredate, 
rptremarks, 
comments, 
lastdate, 
lastuser, 
lasttool, 
analysis_type, 
analysis_count, 
rpt_mdl, 
virtual_set, 
worknum, 
tic, 
run_date, 
run_type, 
analyst, 
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
s_department_instrument_run_mroc_national.hk_l_department_instrument_run, 
s_department_instrument_run_mroc_national.instrument_run_no, 
s_department_instrument_run_mroc_national.audit_seq, 
s_department_instrument_run_mroc_national.samp_tag, 
s_department_instrument_run_mroc_national.login_seq, 
s_department_instrument_run_mroc_national.list_joinid, 
s_department_instrument_run_mroc_national.snapshot_flag, 
s_department_instrument_run_mroc_national.dkey_flag, 
s_department_instrument_run_mroc_national.parm_validate_flag, 
s_department_instrument_run_mroc_national.dkey_cnt, 
s_department_instrument_run_mroc_national.pchain_id, 
s_department_instrument_run_mroc_national.calcid, 
s_department_instrument_run_mroc_national.process_step, 
s_department_instrument_run_mroc_national.process_id, 
s_department_instrument_run_mroc_national.nextprocess_id, 
s_department_instrument_run_mroc_national.process_status, 
s_department_instrument_run_mroc_national.process_message, 
s_department_instrument_run_mroc_national.reqavail_flag, 
s_department_instrument_run_mroc_national.calcavail_flag, 
s_department_instrument_run_mroc_national.approval_status, 
s_department_instrument_run_mroc_national.galp_id, 
s_department_instrument_run_mroc_national.input_seq, 
s_department_instrument_run_mroc_national.inputdate, 
s_department_instrument_run_mroc_national.samp_type, 
s_department_instrument_run_mroc_national.link_id, 
s_department_instrument_run_mroc_national.enterdate, 
s_department_instrument_run_mroc_national.prep_date1, 
s_department_instrument_run_mroc_national.prep_date2, 
s_department_instrument_run_mroc_national.measuredate, 
s_department_instrument_run_mroc_national.rptremarks, 
s_department_instrument_run_mroc_national.comments, 
s_department_instrument_run_mroc_national.lastdate, 
s_department_instrument_run_mroc_national.lastuser, 
s_department_instrument_run_mroc_national.lasttool, 
s_department_instrument_run_mroc_national.analysis_type, 
s_department_instrument_run_mroc_national.analysis_count, 
s_department_instrument_run_mroc_national.rpt_mdl, 
s_department_instrument_run_mroc_national.virtual_set, 
s_department_instrument_run_mroc_national.worknum, 
s_department_instrument_run_mroc_national.tic, 
s_department_instrument_run_mroc_national.run_date, 
s_department_instrument_run_mroc_national.run_type, 
s_department_instrument_run_mroc_national.analyst, 
s_department_instrument_run_mroc_national.dss_change_hash, 
s_department_instrument_run_mroc_national.dss_record_source, 
s_department_instrument_run_mroc_national.dss_load_date, 
s_department_instrument_run_mroc_national.dss_start_date, 
s_department_instrument_run_mroc_national.dss_version, 
s_department_instrument_run_mroc_national.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_l_department_instrument_run
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_l_department_instrument_run
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM WSDataVault_dev_incremental.raw.s_department_instrument_run_mroc_national s_department_instrument_run_mroc_national
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_instrument_run_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_instrument_run_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_instrument_run_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_instrument_run_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_instrument_run_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_instrument_run_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'End date determined by the next Satellite change record dss_start_date' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_instrument_run_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_end_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'CurrentFlag ''N'' unless next Satellite change record dss_start_date is null, indicating this is the most current record.' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_department_instrument_run_mroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_current_flag'
GO
