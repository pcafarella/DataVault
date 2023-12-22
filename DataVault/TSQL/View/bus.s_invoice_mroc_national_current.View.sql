/****** Object:  View [bus].[s_invoice_mroc_national_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_invoice_mroc_national_current](
hk_h_invoice, 
ponumber, 
invoicedate, 
invoiceref, 
invoicecomm, 
projectnum, 
description, 
status, 
lastdate, 
lasttool, 
lastuser, 
redostatus, 
mas90date, 
original_invoice_date, 
summary_invoice, 
dss_change_hash, 
dss_record_source, 
dss_load_date, 
dss_start_date, 
dss_version, 
dss_create_time)
AS
SELECT 
s_invoice_mroc_national.hk_h_invoice, 
s_invoice_mroc_national.ponumber, 
s_invoice_mroc_national.invoicedate, 
s_invoice_mroc_national.invoiceref, 
s_invoice_mroc_national.invoicecomm, 
s_invoice_mroc_national.projectnum, 
s_invoice_mroc_national.description, 
s_invoice_mroc_national.status, 
s_invoice_mroc_national.lastdate, 
s_invoice_mroc_national.lasttool, 
s_invoice_mroc_national.lastuser, 
s_invoice_mroc_national.redostatus, 
s_invoice_mroc_national.mas90date, 
s_invoice_mroc_national.original_invoice_date, 
s_invoice_mroc_national.summary_invoice, 
s_invoice_mroc_national.dss_change_hash, 
s_invoice_mroc_national.dss_record_source, 
s_invoice_mroc_national.dss_load_date, 
s_invoice_mroc_national.dss_start_date, 
s_invoice_mroc_national.dss_version, 
s_invoice_mroc_national.dss_create_time 
FROM WSDataVault_dev_incremental.raw.s_invoice_mroc_national s_invoice_mroc_national
INNER JOIN (
    SELECT 
    hk_h_invoice, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_incremental.raw.s_invoice_mroc_national
    GROUP BY hk_h_invoice) curr
ON curr.hk_h_invoice = s_invoice_mroc_national.hk_h_invoice
AND curr.dss_start_date = s_invoice_mroc_national.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_invoice_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_invoice_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_invoice_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_invoice_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_invoice_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_invoice_mroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
