/****** Object:  View [info].[Dim_Industry]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         VIEW [info].[Dim_Industry] AS 

SELECT industry [Industry]
      ,industry_desc [Industry Desc] 
      ,'MS:'+ industry_desc  [Industry Relationship]
FROM   mas.[Industry]

GO
