/****** Object:  View [info].[Dim_Personnel]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [info].[Dim_Personnel]
GO
/****** Object:  View [info].[Dim_Personnel]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

CREATE                       View [info].[Dim_Personnel] AS

 SELECT	p.personnel_no,
        s.first_name, s.last_name, 
		d.department_no assigned_adp_department_no, ss.business_unit, 
		sp.personnel_no reports_to_personnel_no
 
FROM raw.h_personnel p
INNER JOIN raw.s_personnel_lroc s ON s.hk_h_personnel = p.hk_h_personnel
INNER JOIN raw.l_personnel_supervisor lps ON lps.hk_h_personnel_personnel_no = p.hk_h_personnel
INNER JOIN raw.l_personnel_department ldp ON ldp.hk_h_personnel = lps.hk_h_personnel_personnel_supervisor_no
INNER JOIN raw.h_personnel sp On sp.hk_h_personnel = lps.hk_h_personnel_personnel_supervisor_no
INNER JOIN raw.s_personnel_lroc ss ON ss.hk_h_personnel =sp.hk_h_personnel
INNER JOIN raw.h_department d ON d.hk_h_department = ldp.hk_h_department and d.tenant_id = 'adp'
 
  
 
GO
