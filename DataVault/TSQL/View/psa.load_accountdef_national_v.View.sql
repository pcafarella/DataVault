/****** Object:  View [psa].[load_accountdef_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
DROP VIEW [psa].[load_accountdef_national_v]
GO
/****** Object:  View [psa].[load_accountdef_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view  [psa].[load_accountdef_national_v]
AS
SELECT [acctnum]
      ,[pace_acct_code]
      ,[acctname]
      ,[acctfactor]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[mas90code]
      ,[date_establishd]
      ,[dso]
      ,[customertype]
      ,[creationdate]
      ,[national_acct_flag]
      ,[exclude_scinfl]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [psa].[load_accountdef_national] o
  WHERE dss_load_date = (SELECT MAX(dss_load_date) FROM  [psa].[load_accountdef_national] i WHERE i.acctnum = o.acctnum)

GO
