/****** Object:  View [psa].[load_vw_sdg_details_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [psa].[load_vw_sdg_details_national_v]
GO
/****** Object:  View [psa].[load_vw_sdg_details_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [psa].[load_vw_sdg_details_national_v]
AS

SELECT [loginnum]
      ,[sdgid]
      ,[receivedate]
      ,[acctnum]
      ,[projectnum]
      ,[site]
      ,[locator]
      ,[description]
      ,[status]
      ,[report_complete]
      ,[tsr]
      ,[first_login_seq]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [psa].[load_vw_sdg_details_national] o
  WHERE dss_load_date = (SELECT MAX(dss_load_date) 
                           FROM  [psa].[load_vw_sdg_details_national] i 
                          WHERE   i.[loginnum] = o.[loginnum] )


GO
