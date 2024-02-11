/****** Object:  View [load].[load_repsample_fairfield_v]    Script Date: 2/11/2024 5:13:54 PM ******/
DROP VIEW [load].[load_repsample_fairfield_v]
GO
/****** Object:  View [load].[load_repsample_fairfield_v]    Script Date: 2/11/2024 5:13:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE             View [load].[load_repsample_fairfield_v]
 AS
 

SELECT * FROM (
SELECT *, row_number() OVER (PARTITION BY wrk, UPPER(sample) ORDER BY laboratory ) as rownum
  FROM [Load].[load_repsample_fairfield]) a
  WHERE rownum  = 1
 
 
GO
