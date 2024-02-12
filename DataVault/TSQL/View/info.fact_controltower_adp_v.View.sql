/****** Object:  View [info].[fact_controltower_adp_v]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [info].[fact_controltower_adp_v]
GO
/****** Object:  View [info].[fact_controltower_adp_v]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE             VIEW [info].[fact_controltower_adp_v]
AS 
SELECT LEFT(business_unit,2) Lab
      ,CAST(NULL AS VARCHAR(255)) [Lab Location]
	  ,[personnel_no] [Personnel Nbr]
      ,[adp_working_department_no] [ADP Dept Nbr]
      ,[lab_working_department_no] [Lab Dept Nbr]
      ,CAST([date_worked] AS DATE) [Date Worked]
      ,[payroll_name] [Payroll Name]
      ,[pay_code] [Pay Code]
      ,[hours] [Hours]
	  ,[dss_load_date] [Load Date]
  FROM  [info].[fact_controltower_vault_adp]

  -- drop table info.fact_controltower_adp  SELECT * INTO info.fact_controltower_adp FROM info.fact_controltower_adp_v

GO
