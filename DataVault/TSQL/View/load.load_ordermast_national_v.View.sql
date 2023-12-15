/****** Object:  View [load].[load_ordermast_national_v]    Script Date: 12/15/2023 2:09:16 PM ******/
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
