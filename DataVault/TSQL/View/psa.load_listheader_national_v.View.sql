/****** Object:  View [psa].[load_listheader_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [psa].[load_listheader_national_v]
GO
/****** Object:  View [psa].[load_listheader_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [psa].[load_listheader_national_v]
 AS

SELECT [list_joinid]
      ,[plevel]
      ,[pkey]
      ,[listtype]
      ,[list_func]
      ,[listmatclass]
      ,[current_flag]
      ,[expiredate]
      ,[pchain_name]
      ,[designid]
      ,[dkey_flag]
      ,[parm_validate_flag]
      ,[methodref]
      ,[description]
      ,[lastdate]
      ,[lastuser]
      ,[lasttool]
      ,[seq]
      ,[icalcritid]
      ,[report_definition_id]
      ,[methodid]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [psa].[load_listheader_national]  o
  WHERE dss_load_date = (SELECT MAX(dss_load_date) FROM  [psa].[load_listheader_national] i WHERE i.[list_joinid] = o.[list_joinid])

   
GO
