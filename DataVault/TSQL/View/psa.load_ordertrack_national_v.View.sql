/****** Object:  View [psa].[load_ordertrack_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
DROP VIEW [psa].[load_ordertrack_national_v]
GO
/****** Object:  View [psa].[load_ordertrack_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW  [psa].[load_ordertrack_national_v]
AS

SELECT [samplenum]
      ,[matnum]
      ,[prod]
      ,[deptnum]
      ,[worknum]
      ,[dstatus]
      ,[dstatusdate]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [psa].[load_ordertrack_national] o
  WHERE dss_load_date = (SELECT MAX(dss_load_date) 
                           FROM  [psa].[load_ordertrack_national] i 
                          WHERE i.[samplenum] = o.[samplenum]
						  AND i.[prod] = o.[prod]
						  AND i.matnum = o.matnum
						  AND i.deptnum = o.deptnum
                                           )



GO
