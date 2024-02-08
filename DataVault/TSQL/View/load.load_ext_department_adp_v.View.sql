/****** Object:  View [load].[load_ext_department_adp_v]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [load].[load_ext_department_adp_v]
GO
/****** Object:  View [load].[load_ext_department_adp_v]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 CREATE         View [load].[load_ext_department_adp_v]
 AS 
SELECT *
FROM (

SELECT [home_department_code]
      ,[home_department_description]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [ext].[ext_CJ3ActiveRosterforIT]
UNION 
 
SELECT [timecard_work_department]
      ,'timecard_work_department'
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [ext].[ext_CJ3TimecardHoursforIT] o
  WHERE NOT EXISTS(SELECT 1 FROM [ext].[ext_CJ3ActiveRosterforIT] i where i.home_department_code = o.[timecard_work_department])) a

GO
