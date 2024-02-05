/****** Object:  StoredProcedure [info].[usp_fact_controltower_vault_adp]    Script Date: 2/5/2024 10:41:23 AM ******/
DROP PROCEDURE [info].[usp_fact_controltower_vault_adp]
GO
/****** Object:  StoredProcedure [info].[usp_fact_controltower_vault_adp]    Script Date: 2/5/2024 10:41:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
 
CREATE                     PROCEDURE [info].[usp_fact_controltower_vault_adp] @work_order_no varchar(50) = NULL
AS 

-- exec info.[usp_fact_controltower_vault_adp]  'L1667998'
-- select top 1000 * from info.[usp_fact_controltower_adp] where [sample_no] LIKE    'L1667998-10'  and product_code_base like 'ALLph%'  order by  [Sample_no], Analysis_process_code,  department_level, CAST([Department_no] as int) 
-- select top 1000 * from info.fact_controltower  where [sample nbr] LIKE 'L1639494-01'

if object_id('info.fact_controltower_vault_adp') IS NOT NULL  DROP TABLE info.fact_controltower_vault_adp

;WITH adp2lims80 AS (
SELECT d1.hk_h_department hk_h_department_adp, d1.department_no department_no_adp, s1.department_name department_name_adp, d2.hk_h_department hk_h_department_lims80, d2.department_no department_no_lims80, s2.department_name department_name_lims80
FROM  raw.l_department_sameas sa
INNER JOIN raw.h_department d1 ON d1.hk_h_department =sa.hk_h_department_department_no and d1.tenant_id = 'adp'
INNER JOIN bus.s_department_lroc_vault_current s1 on s1.hk_h_department = d1.hk_h_department
INNER JOIN raw.h_department d2 ON d2.hk_h_department = sa.hk_h_department_sameas_department_no  and d2.tenant_id = 'lims80'
INNER JOIN bus.s_department_lroc_national_current s2 on s2.hk_h_department = d2.hk_h_department)
  
SELECT	p.personnel_no,  
        wd.department_no adp_working_department_no, 
		alw.department_no_lims80 lab_working_department_no, 
		pdh.date_worked, 
		pdh.payroll_name, 
		pdh.pay_code, 
		hs.hours,
		hs.business_unit,
		hs.dss_load_date
INTO info.fact_controltower_vault_adp
FROM raw.h_personnel p
INNER JOIN raw.l_personnel_department_hours pdh ON pdh.hk_h_personnel  = p.hk_h_personnel                                   
INNER JOIN bus.s_personnel_department_hours_tran_current hs ON hs.hk_l_personnel_department_hours = pdh.hk_l_personnel_department_hours 
INNER JOIN raw.h_department wd on wd.hk_h_department = pdh.hk_h_department 
LEFT JOIN adp2lims80 alw on alw.hk_h_department_adp = wd.hk_h_department
 
 RETURN
GO
