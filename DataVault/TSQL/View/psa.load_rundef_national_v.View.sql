/****** Object:  View [psa].[load_rundef_national_v]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 CREATE      VIEW [psa].[load_rundef_national_v]
 AS

SELECT [run_id]
      ,[audit_seq]
      ,[run_date]
      ,[run_type]
      ,[instrument_id]
      ,[analyst]
      ,[deptnum]
      ,[worknum]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [psa].[load_rundef_national] o
WHERE dss_load_date = (SELECT MAX(dss_load_date) FROM   [psa].[load_rundef_national]  i WHERE i.run_id = o.run_id)
GO
