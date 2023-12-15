/****** Object:  View [info].[Dim_Department]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

CREATE                       View [info].[Dim_Department] AS

 WITH adp2lims80 AS (
SELECT d1.hk_h_department hk_h_department_adp, d1.department_no department_no_adp, s1.department_name department_name_adp, d2.hk_h_department hk_h_department_lims80, d2.department_no department_no_lims80, s2.department_name department_name_lims80
FROM  raw.l_department_sameas sa
INNER JOIN raw.h_department d1 ON d1.hk_h_department =sa.hk_h_department_department_no and d1.tenant_id = 'adp'
INNER JOIN raw.s_department_lroc_vault s1 on s1.hk_h_department = d1.hk_h_department
INNER JOIN raw.h_department d2 ON d2.hk_h_department = sa.hk_h_department_sameas_department_no  and d2.tenant_id = 'lims80'
INNER JOIN raw.s_department_lroc_national s2 on s2.hk_h_department = d2.hk_h_department)
 
SELECT department_no, s.department_name, sn.department_short_name, CAST(NULL AS TINYINT) department_level, tenant_id 
FROM raw.h_department h
INNER JOIN bus.s_department_lroc_vault_current s on s.hk_h_department = h.hk_h_department
INNER JOIN adp2lims80 al on al.hk_h_department_adp = h.hk_h_department
JOIN bus.s_department_lroc_national_current sn on sn.hk_h_department = al.hk_h_department_lims80
WHERE h.tenant_id = 'adp'
UNION ALL

SELECT h.department_no, sn.department_name,  sn.department_short_name, department_level, h.tenant_id 
FROM raw.h_department h
INNER JOIN bus.s_department_lroc_national_current sn on sn.hk_h_department = h.hk_h_department 
INNER JOIN mas.department_type d on d.department_no = h.department_no
WHERE h.tenant_id = 'lims80'
 
 
GO
