/****** Object:  View [info].[Dim_Market]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 


CREATE         VIEW [info].[Dim_Market] AS 

SELECT market [Market]
      ,market_segment [Market Segment] 
      ,'MS:'+ market_segment  [Market Relationship]
FROM   mas.[Market]


GO
