/****** Object:  StoredProcedure [raw].[usp_truncate_adp]    Script Date: 12/15/2023 2:05:50 PM ******/
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
