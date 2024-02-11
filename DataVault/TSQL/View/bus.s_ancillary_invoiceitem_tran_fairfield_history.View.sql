EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_current_flag'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_end_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
/****** Object:  View [bus].[s_ancillary_invoiceitem_tran_fairfield_history]    Script Date: 2/11/2024 5:13:54 PM ******/
DROP VIEW [bus].[s_ancillary_invoiceitem_tran_fairfield_history]
GO
/****** Object:  View [bus].[s_ancillary_invoiceitem_tran_fairfield_history]    Script Date: 2/11/2024 5:13:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_ancillary_invoiceitem_tran_fairfield_history](
hk_l_ancillary_invoiceitem, 
itemtype, 
itemcode, 
itemclass, 
quantity, 
price, 
taxrate, 
itemtotal, 
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
s_ancillary_invoiceitem_tran_fairfield.hk_l_ancillary_invoiceitem, 
s_ancillary_invoiceitem_tran_fairfield.itemtype, 
s_ancillary_invoiceitem_tran_fairfield.itemcode, 
s_ancillary_invoiceitem_tran_fairfield.itemclass, 
s_ancillary_invoiceitem_tran_fairfield.quantity, 
s_ancillary_invoiceitem_tran_fairfield.price, 
s_ancillary_invoiceitem_tran_fairfield.taxrate, 
s_ancillary_invoiceitem_tran_fairfield.itemtotal, 
s_ancillary_invoiceitem_tran_fairfield.dss_change_hash, 
s_ancillary_invoiceitem_tran_fairfield.dss_record_source, 
s_ancillary_invoiceitem_tran_fairfield.dss_load_date, 
s_ancillary_invoiceitem_tran_fairfield.dss_start_date, 
s_ancillary_invoiceitem_tran_fairfield.dss_version, 
s_ancillary_invoiceitem_tran_fairfield.dss_create_time, 
LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY
hk_l_ancillary_invoiceitem
ORDER BY dss_start_date), 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY
hk_l_ancillary_invoiceitem
ORDER BY dss_start_date) IS NULL THEN 'Y' ELSE 'N' END 
FROM WSDataVault_dev_element.raw.s_ancillary_invoiceitem_tran_fairfield s_ancillary_invoiceitem_tran_fairfield
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'End date determined by the next Satellite change record dss_start_date' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_end_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'CurrentFlag ''N'' unless next Satellite change record dss_start_date is null, indicating this is the most current record.' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_fairfield_history', @level2type=N'COLUMN',@level2name=N'dss_current_flag'
GO
