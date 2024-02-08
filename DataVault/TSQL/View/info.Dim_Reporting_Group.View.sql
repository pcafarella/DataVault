/****** Object:  View [info].[Dim_Reporting_Group]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [info].[Dim_Reporting_Group]
GO
/****** Object:  View [info].[Dim_Reporting_Group]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE                     VIEW [info].[Dim_Reporting_Group] AS 
SELECT  [list_type]+' '+
		[list_matclass] [Analysis Process]
		,[adjusted_department] [Reporting Department]
		,[reporting_group] [Reporting Group]
		,department_no [Lab Department_no]
 
FROM  [mas].[lab_reporting_group]
LEFT JOIN raw.s_department_lroc_national sd on sd.department_name = CASE WHEN LEFT(adjusted_department,LEN('BIOMONITORING')) = 'BIOMONITORING' THEN 'BIOMONITORING' ELSE adjusted_department END
LEFT JOIN raw.h_department d on d.hk_h_department = sd.hk_h_department

GO
