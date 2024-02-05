/****** Object:  StoredProcedure [load].[usp_wherescape_load_table_customize]    Script Date: 1/30/2024 2:45:18 PM ******/
DROP PROCEDURE [load].[usp_wherescape_load_table_customize]
GO
/****** Object:  StoredProcedure [load].[usp_wherescape_load_table_customize]    Script Date: 1/30/2024 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 

/****** Object:  StoredProcedure [Load].[usp_wherescape_load_table_customize]    Script Date: 9/22/2022 2:03:54 PM ******/
 --exec  [Load].[usp_wherescape_load_table_customize] 

CREATE         PROCEDURE  [load].[usp_wherescape_load_table_customize] 
AS 

UPDATE  [dbo].[ws_load_tab]
SET lt_file_delimiter = '|~'
WHERE lt_file_delimiter = ''

UPDATE  [dbo].[ws_load_tab]
SET lt_where_clause = '', lt_load_statement = ''

UPDATE  [dbo].[ws_load_tab]
SET lt_where_clause = '
WHERE EXISTS (SELECT 1 
FROM seedpak.sample s 
JOIN seedpak.invoicedef i on i.invoicenum = s.invoicenum
WHERE s.samplenum = sample.samplenum
AND original_invoice_date >=  to_date(''2021-01-01'',''YYYY-MM-DD'')) 
and sample.samp_function like ''L%'' '
WHERE lt_table_name = 'load_sample_national'


UPDATE  [dbo].[ws_load_tab]
SET lt_where_clause = '', lt_load_statement = 
  'SELECT ordermast.samplenum
      ,ordermast.matnum
      ,ordermast.prod
      ,pkey
      ,plevel
      ,pprodref
      ,pmatnumref
      ,class
      ,price
      ,cost
      ,factor
      ,holddate
      ,holddays
      ,holdflg
      ,ordermast.duedate
      ,ordermast.duedays
      ,location
      ,bottles
      ,ordermast.lastdate
      ,ordermast.lasttool
      ,ordermast.lastuser
      ,ordermast.designid
      ,ordermast.comp
      ,''load override 2019 by invoicedate''
      ,SYSDATE
FROM seedpak.ordermast  
join seedpak.sample on sample.samplenum = ordermast.samplenum
join seedpak.invoicedef on invoicedef.invoicenum = sample.invoicenum
where invoicedef.invoicedate >= to_date(''2021-01-01'',''YYYY-MM-DD'')'
WHERE lt_table_name = 'load_ordermast_national'


UPDATE  [dbo].[ws_load_tab]
SET lt_where_clause = 'WHERE ctab_id LIKE (''lims__'') and substr(ctab_id,-2) NOT IN (''17'',''90'')'
WHERE (lt_table_name like '%paceport%')
and lt_table_name IN (
'load_dmart_acodes_paceport',
'load_dmart_analysis_codes_paceport',
'load_dmart_choice_lists_paceport',
'load_dmart_matrix_paceport',
'load_dmart_procedures_paceport')

UPDATE  [dbo].[ws_load_tab]
SET lt_where_clause = 'WHERE system_id LIKE (''lims__'') and substr(system_id,-2) NOT IN (''17'',''90'')'
WHERE (lt_table_name like '%paceport%')
and lt_table_name NOT IN (
'load_dmart_acodes_paceport',
'load_dmart_analysis_codes_paceport',
'load_dmart_choice_lists_paceport',
'load_dmart_matrix_paceport',
'load_dmart_procedures_paceport',
'load_dmart_aux_data_paceport')

UPDATE  [dbo].[ws_load_tab]
SET lt_where_clause = 'WHERE system_id LIKE (''lims__'') and substr(system_id,-2) NOT IN (''17'',''90'') AND aux_data_type = ''R'' AND aux_field IN (1,2) AND aux_data_format = ''MRKT'''
WHERE lt_table_name ='load_dmart_aux_data_paceport' 

UPDATE  [dbo].[ws_load_tab]
SET lt_where_clause = 'WHERE system_id LIKE (''lims__'') and substr(system_id,-2) NOT IN (''17'',''90'')'
WHERE (lt_table_name like '%paceport%')
and lt_table_name NOT IN (
'load_dmart_acodes_paceport',
'load_dmart_analysis_codes_paceport',
'load_dmart_choice_lists_paceport',
'load_dmart_matrix_paceport',
'load_dmart_procedures_paceport',
'load_dmart_aux_data_paceport')


UPDATE  [dbo].[ws_load_tab]
SET lt_where_clause = CAST(lt_where_clause AS VARCHAR(MAX)) +  
' AND charge_date >= to_date(''2020-01-01'',''YYYY-MM-DD'') '
WHERE lt_table_name  =  'load_dmart_accumulated_charges_paceport'


UPDATE  [dbo].[ws_load_tab]
SET lt_where_clause = CAST(lt_where_clause AS VARCHAR(MAX)) +
' and order_date  >= to_date(''2020-01-01'',''YYYY-MM-DD'') '
WHERE lt_table_name  =  'load_dmart_sample_acodes_paceport'


 

RETURN
GO
