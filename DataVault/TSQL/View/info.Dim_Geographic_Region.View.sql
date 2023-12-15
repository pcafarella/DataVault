/****** Object:  View [info].[Dim_Geographic_Region]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE           VIEW [info].[Dim_Geographic_Region] AS 

SELECT region_name [Geographic Region]
      ,state_abbrev [State] 
      ,'GR:'+ region_name [Geographic Region_Relationship]
FROM mas.state
GO
