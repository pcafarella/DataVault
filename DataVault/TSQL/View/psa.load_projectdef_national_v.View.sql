/****** Object:  View [psa].[load_projectdef_national_v]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE VIEW  [psa].[load_projectdef_national_v]
  AS 

SELECT [acctnum]
      ,[projectnum]
      ,[description]
      ,[startdate]
      ,[stopdate]
      ,[ponumber]
      ,[site]
      ,[manager]
      ,[projref]
      ,[sales1code]
      ,[sales1plan]
      ,[sales2code]
      ,[sales2plan]
      ,[termcode]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[locator]
      ,[permitnum]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [psa].[load_projectdef_national] o
  WHERE dss_load_date = (SELECT MAX(dss_load_date) 
                           FROM  [psa].[load_projectdef_national] i 
                          WHERE i.[acctnum] = o.[acctnum]
						  AND i.[projectnum] = o.[projectnum] )

GO
