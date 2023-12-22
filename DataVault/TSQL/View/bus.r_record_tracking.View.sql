/****** Object:  View [bus].[r_record_tracking]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 CREATE   VIEW [bus].[r_record_tracking] AS 
SELECT [key_value]
      ,[audit_table]
      ,[audit_field]
      ,[audit_action]
      ,[old_value]
      ,[new_value]
      ,MAX([audit_user])  [audit_user]
      ,MAX([audit_date]) [audit_date]
      ,MAX([audit_tool]) [audit_tool]
      ,MAX([dss_record_source]) [dss_record_source]
      ,MAX([dss_load_date]) [dss_load_date]
      ,MAX([dss_create_time])  [dss_create_time]
  FROM [ref].[r_record_tracking]
  GROUP BY  [key_value]
      ,[audit_table]
      ,[audit_field]
      ,[audit_action]
      ,[old_value]
      ,[new_value]
GO
