/****** Object:  View [psa].[load_accountdef_national_v]    Script Date: 12/15/2023 2:09:16 PM ******/
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
