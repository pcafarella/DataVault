/****** Object:  View [store].[load_prodmast_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
DROP VIEW [store].[load_prodmast_national_v]
GO
/****** Object:  View [store].[load_prodmast_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE       View [store].[load_prodmast_national_v]
 AS 
SELECT * FROM (
SELECT [load_prodmast_national].*,  row_number() OVER (PARTITION BY UPPER([load_prodmast_national].prod), UPPER([load_prodmast_national].matnum) , UPPER (Class), pprodref, pmatnumref   ORDER BY lasttool DESC) as rownum
  FROM [Load].[load_prodmast_national]
 ) a
  WHERE rownum  = 1
GO
