/****** Object:  View [bus].[s_project_mroc_national_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_project_mroc_national_current](
hk_h_project, 
project_name, 
project_desc, 
purchase_order_no, 
site, 
manager, 
sales1code, 
sales1plan, 
sales2code, 
sales2plan, 
termcode, 
lastdate, 
lasttool, 
lastuser, 
permitnum, 
locator, 
comments, 
buyer_type, 
market_segment, 
industry_sector, 
active, 
sample_interval, 
tat, 
tsr, 
basin, 
sample_state, 
client_type, 
acct_alert, 
po_required, 
rpt_quals, 
rpt_mcl, 
ponumber, 
designid, 
source, 
terr, 
county, 
inv_with_rpt, 
webflag, 
rpt_qc, 
webinvflag, 
archive_flag, 
archive_date, 
service, 
rpt_mdl, 
min_invoice_amt, 
report_packet_id, 
historical_data_check, 
rpt_multi_runs, 
container_label_type, 
hdc_level_2, 
uploaded_data_flag, 
certification_program, 
use_repdb_config, 
combine_inv_coc, 
auto_approve_lvl2_report, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_project_mroc_national.hk_h_project, 
s_project_mroc_national.project_name, 
s_project_mroc_national.project_desc, 
s_project_mroc_national.purchase_order_no, 
s_project_mroc_national.site, 
s_project_mroc_national.manager, 
s_project_mroc_national.sales1code, 
s_project_mroc_national.sales1plan, 
s_project_mroc_national.sales2code, 
s_project_mroc_national.sales2plan, 
s_project_mroc_national.termcode, 
s_project_mroc_national.lastdate, 
s_project_mroc_national.lasttool, 
s_project_mroc_national.lastuser, 
s_project_mroc_national.permitnum, 
s_project_mroc_national.locator, 
s_project_mroc_national.comments, 
s_project_mroc_national.buyer_type, 
s_project_mroc_national.market_segment, 
s_project_mroc_national.industry_sector, 
s_project_mroc_national.active, 
s_project_mroc_national.sample_interval, 
s_project_mroc_national.tat, 
s_project_mroc_national.tsr, 
s_project_mroc_national.basin, 
s_project_mroc_national.sample_state, 
s_project_mroc_national.client_type, 
s_project_mroc_national.acct_alert, 
s_project_mroc_national.po_required, 
s_project_mroc_national.rpt_quals, 
s_project_mroc_national.rpt_mcl, 
s_project_mroc_national.ponumber, 
s_project_mroc_national.designid, 
s_project_mroc_national.source, 
s_project_mroc_national.terr, 
s_project_mroc_national.county, 
s_project_mroc_national.inv_with_rpt, 
s_project_mroc_national.webflag, 
s_project_mroc_national.rpt_qc, 
s_project_mroc_national.webinvflag, 
s_project_mroc_national.archive_flag, 
s_project_mroc_national.archive_date, 
s_project_mroc_national.service, 
s_project_mroc_national.rpt_mdl, 
s_project_mroc_national.min_invoice_amt, 
s_project_mroc_national.report_packet_id, 
s_project_mroc_national.historical_data_check, 
s_project_mroc_national.rpt_multi_runs, 
s_project_mroc_national.container_label_type, 
s_project_mroc_national.hdc_level_2, 
s_project_mroc_national.uploaded_data_flag, 
s_project_mroc_national.certification_program, 
s_project_mroc_national.use_repdb_config, 
s_project_mroc_national.combine_inv_coc, 
s_project_mroc_national.auto_approve_lvl2_report, 
s_project_mroc_national.dss_change_hash, 
s_project_mroc_national.dss_record_source, 
s_project_mroc_national.dss_load_date, 
s_project_mroc_national.dss_start_date, 
s_project_mroc_national.dss_version, 
s_project_mroc_national.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_project_mroc_national s_project_mroc_national
INNER JOIN (
    SELECT 
    hk_h_project, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_project_mroc_national
    GROUP BY hk_h_project) curr
ON curr.hk_h_project = s_project_mroc_national.hk_h_project
AND curr.dss_start_date = s_project_mroc_national.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_project_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_project_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_project_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_project_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_project_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_project_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
