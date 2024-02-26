/****** Object:  StoredProcedure [raw].[usp_truncate_adp]    Script Date: 2/26/2024 11:37:11 AM ******/
DROP PROCEDURE [raw].[usp_truncate_adp]
GO
/****** Object:  StoredProcedure [raw].[usp_truncate_adp]    Script Date: 2/26/2024 11:37:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [raw].[usp_truncate_adp] AS

TRUNCATE TABLE raw.h_personnel
TRUNCATE TABLE raw.l_personnel_department
TRUNCATE TABLE raw.l_personnel_department_hours
TRUNCATE TABLE raw.l_personnel_supervisor
TRUNCATE TABLE raw.s_personnel_department_hours_tran
TRUNCATE TABLE raw.s_personnel_department_lroc_vault
TRUNCATE TABLE raw.s_personnel_lroc
TRUNCATE TABLE raw.s_personnel_supervisor_mroc
TRUNCATE TABLE raw.s_department_lroc_vault
GO
