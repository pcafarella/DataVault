/****** Object:  View [load].[load_vw_sdg_details_national_v]    Script Date: 12/15/2023 2:09:16 PM ******/
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
