/****** Object:  View [info].[Dim_State]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE           View [info].[Dim_State] AS
 
 SELECT [Location], [State] ,'ST:'+ [state] [State Relationship]
 FROM (
SELECT CASE WHEN [location_reference] = '(blank)' THEN 'Blank Location' ELSE  [location_reference] END [Location]
      ,isnull([state_abbrev],'Blank State') [State]
  FROM mas.location) a
GO
