/****** Object:  View [psa].[load_invoicedef_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [psa].[load_invoicedef_national_v]
GO
/****** Object:  View [psa].[load_invoicedef_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [psa].[load_invoicedef_national_v]
AS

SELECT [invoicenum]
      ,[invoicedate]
      ,[acctnum]
      ,[invoiceref]
      ,[invoicecomm]
      ,[projectnum]
      ,[description]
      ,[status]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[loginnum]
      ,[ponumber]
      ,[redostatus]
      ,[mas90date]
      ,[original_invoice_date]
      ,[summary_invoice]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [psa].[load_invoicedef_national]  o
  WHERE dss_load_date = (SELECT MAX(dss_load_date) FROM  [psa].[load_invoicedef_national] i WHERE i.[invoicenum] = o.[invoicenum])



GO
