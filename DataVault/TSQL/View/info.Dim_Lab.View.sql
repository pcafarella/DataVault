/****** Object:  View [info].[Dim_Lab]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE             View [info].[Dim_Lab] AS

  
SELECT [Lab Text], [Parent Lab], [Lab Name], [Lab Location], [Lab], [Operating Lab Name]  ,'L:'+[lab name] [Lab Name Relationship]
FROM (
SELECT [lab_no] [Lab Text]
      ,ISNULL([parent_lab_no],'') [Parent Lab]
      ,ISNULL([parent_lab_name],'Blank Lab') [Lab Name]
      ,ISNULL([parent_lab_city_name]+ ', '+ [parent_lab_state_abbrev],'') [Lab Location]
	  , CASE ISNUMERIC(lab_no) WHEN 1 THEN CAST(lab_no AS INT) ELSE null END Lab    
	  ,operating_lab_name [Operating Lab Name]
  FROM mas.[lab]) a

GO
