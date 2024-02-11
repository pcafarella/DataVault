EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
/****** Object:  View [bus].[s_ancillary_invoiceitem_tran_willamsport_current]    Script Date: 2/11/2024 5:13:54 PM ******/
DROP VIEW [bus].[s_ancillary_invoiceitem_tran_willamsport_current]
GO
/****** Object:  View [bus].[s_ancillary_invoiceitem_tran_willamsport_current]    Script Date: 2/11/2024 5:13:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [bus].[s_ancillary_invoiceitem_tran_willamsport_current](
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
dss_create_time)
AS
SELECT 
s_ancillary_invoiceitem_tran_willamsport.hk_l_ancillary_invoiceitem, 
s_ancillary_invoiceitem_tran_willamsport.itemtype, 
s_ancillary_invoiceitem_tran_willamsport.itemcode, 
s_ancillary_invoiceitem_tran_willamsport.itemclass, 
s_ancillary_invoiceitem_tran_willamsport.quantity, 
s_ancillary_invoiceitem_tran_willamsport.price, 
s_ancillary_invoiceitem_tran_willamsport.taxrate, 
s_ancillary_invoiceitem_tran_willamsport.itemtotal, 
s_ancillary_invoiceitem_tran_willamsport.dss_change_hash, 
s_ancillary_invoiceitem_tran_willamsport.dss_record_source, 
s_ancillary_invoiceitem_tran_willamsport.dss_load_date, 
s_ancillary_invoiceitem_tran_willamsport.dss_start_date, 
s_ancillary_invoiceitem_tran_willamsport.dss_version, 
s_ancillary_invoiceitem_tran_willamsport.dss_create_time 
FROM WSDataVault_dev_element.raw.s_ancillary_invoiceitem_tran_willamsport s_ancillary_invoiceitem_tran_willamsport
INNER JOIN (
    SELECT 
    hk_l_ancillary_invoiceitem, 
    MAX(dss_start_date) AS dss_start_date
    FROM WSDataVault_dev_element.raw.s_ancillary_invoiceitem_tran_willamsport
    GROUP BY hk_l_ancillary_invoiceitem) curr
ON curr.hk_l_ancillary_invoiceitem = s_ancillary_invoiceitem_tran_willamsport.hk_l_ancillary_invoiceitem
AND curr.dss_start_date = s_ancillary_invoiceitem_tran_willamsport.dss_start_date
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_ancillary_invoiceitem_tran_willamsport_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
