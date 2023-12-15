/****** Object:  View [info].[Dim_Reporting_Group]    Script Date: 12/15/2023 2:09:16 PM ******/
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
