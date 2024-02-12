/****** Object:  View [load].[load_ordermast_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
DROP VIEW [load].[load_ordermast_national_v]
GO
/****** Object:  View [load].[load_ordermast_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     VIEW [load].[load_ordermast_national_v] AS 
  
SELECT [samplenum]
      ,[matnum]
      ,[prod]
      ,[pkey]
      ,[plevel]
      ,[pprodref]
      ,[pmatnumref]
      ,[class]
      ,[price]
      ,[cost]
      ,[factor]
      ,[holddate]
      ,[holddays]
      ,[holdflg]
      ,[duedate]
      ,[duedays]
      ,[location]
      ,[bottles]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[designid]
      ,[comp]
      ,[dss_record_source]
      ,[dss_load_date]
	  --,rownum

FROM (
select *, row_number() OVER (PARTITION BY [samplenum]
      ,[matnum]
      ,[prod]
	  ORDER BY price desc, lastdate) rownum from load.load_ordermast_national) a
WHERE rownum  = 1
GO
