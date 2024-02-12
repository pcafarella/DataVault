/****** Object:  View [load].[load_vw_sdg_details_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
DROP VIEW [load].[load_vw_sdg_details_national_v]
GO
/****** Object:  View [load].[load_vw_sdg_details_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

  CREATE    VIEW  [load].[load_vw_sdg_details_national_v] AS
 
   select * FROM (
   select  * , row_number() OVER (PARTITION BY UPPER(loginnum)  ORDER BY sdgid DESC) as rownum
   from  [load].load_vw_sdg_details_national ) a
      WHERE rownum = 1
GO
