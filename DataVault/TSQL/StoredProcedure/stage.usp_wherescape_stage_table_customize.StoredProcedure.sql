/****** Object:  StoredProcedure [stage].[usp_wherescape_stage_table_customize]    Script Date: 2/26/2024 11:24:52 AM ******/
DROP PROCEDURE [stage].[usp_wherescape_stage_table_customize]
GO
/****** Object:  StoredProcedure [stage].[usp_wherescape_stage_table_customize]    Script Date: 2/26/2024 11:24:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 

/****** Object:  StoredProcedure [Load].[usp_wherescape_stage_table_customize]    Script Date: 9/22/2022 2:03:54 PM ******/
 --exec  [stage].[usp_wherescape_stage_table_customize] 

 
CREATE           PROCEDURE  [stage].[usp_wherescape_stage_table_customize] 
AS 

UPDATE dbo.ws_stage_tab
SET st_where = 'FROM load.[load_prodmast_national_v] load_prodmast_national'
where st_table_name = 'stage_product_national'

UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [TABLEOWNER].[load_accountdef_national] load_accountdef_national
				LEFT OUTER JOIN [load].[load_clients_national_v] load_clients_national
				ON load_clients_national.acctnum = load_accountdef_national.acctnum WHERE projectnum is null'
where st_table_name = 'stage_customer_national'


UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_clients_national_v] load_clients_national
RIGHT OUTER JOIN [load].[load_projectdef_national_v] load_projectdef_national
ON load_projectdef_national.acctnum = load_clients_national.acctnum
AND load_projectdef_national.projectnum = load_clients_national.projectnum where load_projectdef_national.projectnum is not null'
where st_table_name = 'stage_project_national'

UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_ordermast_national_v] load_ordermast_national
				LEFT OUTER JOIN [TABLEOWNER].[load_sample_national] load_sample_national
				ON load_sample_national.samplenum = load_ordermast_national.samplenum'
where st_table_name = 'stage_test_invoice_national'

UPDATE dbo.ws_stage_tab
SET st_where ='FROM load.[load_ordermast_national_v] load_ordermast_national'
where st_table_name = 'stage_test_national'

UPDATE dbo.ws_stage_tab
SET st_where ='FROM load.[load_ordermast_national_v] load_ordermast_national'
where st_table_name = 'stage_test_product_national'

UPDATE dbo.ws_stage_tab
SET st_where ='FROM load.[load_ordermast_national_v] load_ordermast_national'
where st_table_name = 'stage_test_sample_national'

UPDATE dbo.ws_stage_tab
SET st_where ='FROM load.[load_vw_sdg_details_national_v] load_vw_sdg_details_national'
where st_table_name = 'stage_work_order_national'

UPDATE dbo.ws_stage_tab
SET st_where ='FROM [load].[load_ordermast_national_v] load_ordermast_national
				INNER JOIN [TABLEOWNER].[load_sample_national] load_sample_national
				ON load_sample_national.samplenum = load_ordermast_national.samplenum'
where st_table_name = 'stage_workorder_test_national'

UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_dmart_customers_paceport_v] load_dmart_customers_paceport'
where st_table_name = 'stage_customer_paceport'

UPDATE dbo.ws_stage_tab
SET st_where = 'FROM load.[load_dmart_analysis_codes_paceport_v] load_dmart_analysis_codes_paceport'
where st_table_name = 'stage_product_paceport'

UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_dmart_profiles_paceport_v] load_dmart_profiles_paceport'
where st_table_name = 'stage_project_paceport'

UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_repsample_madisonville_v] load_repsample_madisonville'
where st_table_name = 'stage_sample_madisonville'
 
 UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_repsample_peoria_v] load_repsample_peoria'
where st_table_name = 'stage_sample_peoria'

 UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_repsample_eastlongmeadow_v] load_repsample_eastlongmeadow'
where st_table_name = 'stage_sample_eastlongmeadow'

 
 UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_project_peoria_v] load_project_peoria'
where st_table_name = 'stage_project_peoria'

 UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_project_eastlongmeadow_v] load_project_eastlongmeadow'
where st_table_name = 'stage_project_eastlongmeadow'

 
 UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_client_peoria_v] load_client_peoria'
where st_table_name = 'stage_customer_peoria'

 UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_wrk_peoria_v] load_wrk_peoria'
where st_table_name = 'stage_wrk_peoria'

 
 UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_repsample_bakersfield_v] load_repsample_bakersfield'
where st_table_name = 'stage_sample_bakersfield'

 UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_repsample_redding_v] load_repsample_redding'
where st_table_name = 'stage_sample_redding'

 UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_client_redding_v] load_client_redding'
where st_table_name = 'stage_pace_account_redding'

  UPDATE dbo.ws_stage_tab
SET st_where = 'FROM [load].[load_client_bakersfield_v] load_client_bakersfield'
where st_table_name = 'stage_pace_account_bakersfield'

RETURN
GO
