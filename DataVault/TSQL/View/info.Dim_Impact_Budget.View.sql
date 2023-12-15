/****** Object:  View [info].[Dim_Impact_Budget]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

 


CREATE           VIEW [info].[Dim_Impact_Budget] AS 

 

SELECT [Year]
      ,[Year Month]
      ,[Budget]
      ,[Parent Lab]
  FROM [mas].[impact_budget]

 
GO
