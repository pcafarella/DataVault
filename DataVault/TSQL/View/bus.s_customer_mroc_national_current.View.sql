/****** Object:  View [bus].[s_customer_mroc_national_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_customer_mroc_national_current](
hk_h_customer, 
acctname, 
acctfactor, 
lastdate, 
lasttool, 
lastuser, 
mas90code, 
date_establishd, 
dso, 
customertype, 
creationdate, 
national_acct_flag, 
active, 
sample_state, 
buyer_type, 
market_segment, 
industry_sector, 
pace_excludeinflation, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_customer_mroc_national.hk_h_customer, 
s_customer_mroc_national.acctname, 
s_customer_mroc_national.acctfactor, 
s_customer_mroc_national.lastdate, 
s_customer_mroc_national.lasttool, 
s_customer_mroc_national.lastuser, 
s_customer_mroc_national.mas90code, 
s_customer_mroc_national.date_establishd, 
s_customer_mroc_national.dso, 
s_customer_mroc_national.customertype, 
s_customer_mroc_national.creationdate, 
s_customer_mroc_national.national_acct_flag, 
s_customer_mroc_national.active, 
s_customer_mroc_national.sample_state, 
s_customer_mroc_national.buyer_type, 
s_customer_mroc_national.market_segment, 
s_customer_mroc_national.industry_sector, 
s_customer_mroc_national.pace_excludeinflation, 
s_customer_mroc_national.dss_change_hash, 
s_customer_mroc_national.dss_record_source, 
s_customer_mroc_national.dss_load_date, 
s_customer_mroc_national.dss_start_date, 
s_customer_mroc_national.dss_version, 
s_customer_mroc_national.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_customer_mroc_national s_customer_mroc_national
INNER JOIN (
    SELECT 
    hk_h_customer, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_customer_mroc_national
    GROUP BY hk_h_customer) curr
ON curr.hk_h_customer = s_customer_mroc_national.hk_h_customer
AND curr.dss_start_date = s_customer_mroc_national.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_customer_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_customer_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_customer_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_customer_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_customer_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_customer_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
