/****** Object:  StoredProcedure [psa].[load_national_to_persist]    Script Date: 2/8/2024 9:19:56 AM ******/
DROP PROCEDURE [psa].[load_national_to_persist]
GO
/****** Object:  StoredProcedure [psa].[load_national_to_persist]    Script Date: 2/8/2024 9:19:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE       PROC [psa].[load_national_to_persist]
AS
-- exec  psa.load_national_to_persist

   
  INSERT INTO [psa].[load_ordermast_national]
           ([samplenum]
           ,[matnum]
           ,[prod]
           ,[pkey]
           ,[plevel]
           ,[pprodref]
           ,[pmatnumref]
           ,[class]
           ,[price]
           ,[cost]
           ,[factor]
           ,[holddate]
           ,[holddays]
           ,[holdflg]
           ,[duedate]
           ,[duedays]
           ,[location]
           ,[bottles]
           ,[lastdate]
           ,[lasttool]
           ,[lastuser]
           ,[designid]
           ,[comp]
           ,[dss_record_source]
           ,[dss_load_date])
SELECT [samplenum]
      ,[matnum]
      ,[prod]
      ,[pkey]
      ,[plevel]
      ,[pprodref]
      ,[pmatnumref]
      ,[class]
      ,[price]
      ,[cost]
      ,[factor]
      ,[holddate]
      ,[holddays]
      ,[holdflg]
      ,[duedate]
      ,[duedays]
      ,[location]
      ,[bottles]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[designid]
      ,[comp]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [Load].[load_ordermast_national] o 
  --join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_ordermast'
  --where lastdate > dss_parameter_value

INSERT INTO [psa].[load_orderdetail_national]
           ([matnum]
           ,[prod]
           ,[login_seq]
           ,[loginnum]
           ,[worknum]
           ,[workdate]
           ,[workstatus]
           ,[priorityflag]
           ,[class]
           ,[samplenum]
           ,[deptnum]
           ,[dstatus]
           ,[dstatusdate]
           ,[dalloc]
           ,[dprice]
           ,[dcost]
           ,[dholddays]
           ,[dholddate]
           ,[dduedays]
           ,[dduedate]
           ,[dprevdeptnum]
           ,[dnextdeptnum]
           ,[lastdate]
           ,[lasttool]
           ,[lastuser]
           ,[dss_record_source]
           ,[dss_load_date])

SELECT [matnum]
      ,[prod]
      ,[login_seq]
      ,[loginnum]
      ,[worknum]
      ,[workdate]
      ,[workstatus]
      ,[priorityflag]
      ,[class]
      ,[samplenum]
      ,[deptnum]
      ,[dstatus]
      ,[dstatusdate]
      ,[dalloc]
      ,[dprice]
      ,[dcost]
      ,[dholddays]
      ,[dholddate]
      ,[dduedays]
      ,[dduedate]
      ,[dprevdeptnum]
      ,[dnextdeptnum]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [load].[load_orderdetail_national] o
  --  join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_orderdetail'
  --where lastdate > dss_parameter_value


 

INSERT INTO [psa].[load_ordertrack_national]
           ([samplenum]
           ,[matnum]
           ,[prod]
           ,[deptnum]
           ,[worknum]
           ,[dstatus]
           ,[dstatusdate]
           ,[lastdate]
           ,[lasttool]
           ,[lastuser]
           ,[dss_record_source]
           ,[dss_load_date])
 

SELECT [samplenum]
      ,[matnum]
      ,[prod]
      ,[deptnum]
      ,[worknum]
      ,[dstatus]
      ,[dstatusdate]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [load].[load_ordertrack_national]
  --  join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_ordertrack'
  --where lastdate > dss_parameter_value



INSERT INTO [psa].[load_invoicedef_national]
           ([invoicenum]
           ,[invoicedate]
           ,[acctnum]
           ,[invoiceref]
           ,[invoicecomm]
           ,[projectnum]
           ,[description]
           ,[status]
           ,[lastdate]
           ,[lasttool]
           ,[lastuser]
           ,[loginnum]
           ,[ponumber]
           ,[redostatus]
           ,[mas90date]
           ,[original_invoice_date]
           ,[summary_invoice]
           ,[dss_record_source]
           ,[dss_load_date])


SELECT [invoicenum]
      ,[invoicedate]
      ,[acctnum]
      ,[invoiceref]
      ,[invoicecomm]
      ,[projectnum]
      ,[description]
      ,[status]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[loginnum]
      ,[ponumber]
      ,LEFT([redostatus], 10)
      ,[mas90date]
      ,[original_invoice_date]
      ,[summary_invoice]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [Load].[load_invoicedef_national]
  --  join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_invoicedef'
  --where lastdate > dss_parameter_value

   


  INSERT INTO [psa].[load_clients_national]
           ([acctnum]
           ,[projectnum]
           ,[active]
           ,[sample_interval]
           ,[tat]
           ,[tsr]
           ,[basin]
           ,[sample_state]
           ,[client_type]
           ,[acct_alert]
           ,[po_required]
           ,[rpt_quals]
           ,[rpt_mcl]
           ,[ponumber]
           ,[termcode]
           ,[designid]
           ,[comments]
           ,[source]
           ,[terr]
           ,[county]
           ,[inv_with_rpt]
           ,[webflag]
           ,[rpt_qc]
           ,[webinvflag]
           ,[archive_flag]
           ,[archive_date]
           ,[service]
           ,[rpt_mdl]
           ,[min_invoice_amt]
           ,[report_packet_id]
           ,[historical_data_check]
           ,[rpt_multi_runs]
           ,[container_label_type]
           ,[hdc_level_2]
           ,[uploaded_data_flag]
           ,[lastdate]
           ,[lastuser]
           ,[lasttool]
           ,[certification_program]
           ,[use_repdb_config]
           ,[buyer_type]
           ,[market_segment]
           ,[industry_sector]
           ,[combine_inv_coc]
           ,[auto_approve_lvl2_report]
           ,[dss_record_source]
           ,[dss_load_date])

SELECT [acctnum]
      ,[projectnum]
      ,[active]
      ,[sample_interval]
      ,[tat]
      ,[tsr]
      ,[basin]
      ,[sample_state]
      ,[client_type]
      ,[acct_alert]
      ,[po_required]
      ,[rpt_quals]
      ,[rpt_mcl]
      ,[ponumber]
      ,[termcode]
      ,[designid]
      ,[comments]
      ,[source]
      ,[terr]
      ,[county]
      ,[inv_with_rpt]
      ,[webflag]
      ,[rpt_qc]
      ,[webinvflag]
      ,[archive_flag]
      ,[archive_date]
      ,[service]
      ,[rpt_mdl]
      ,[min_invoice_amt]
      ,[report_packet_id]
      ,[historical_data_check]
      ,[rpt_multi_runs]
      ,[container_label_type]
      ,[hdc_level_2]
      ,[uploaded_data_flag]
      ,[lastdate]
      ,[lastuser]
      ,[lasttool]
      ,[certification_program]
      ,[use_repdb_config]
      ,[buyer_type]
      ,[market_segment]
      ,[industry_sector]
      ,[combine_inv_coc]
      ,[auto_approve_lvl2_report]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [Load].[load_clients_national]
  --  join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_clients'
  --where lastdate > dss_parameter_value


  INSERT INTO [psa].[load_lims_audit_national]
           ([key_value]
           ,[audit_table]
           ,[audit_field]
           ,[audit_action]
           ,[old_value]
           ,[new_value]
           ,[audit_user]
           ,[audit_date]
           ,[audit_tool]
           ,[dss_record_source]
           ,[dss_load_date])
 

SELECT [key_value]
      ,[audit_table]
      ,[audit_field]
      ,[audit_action]
      ,[old_value]
      ,[new_value]
      ,[audit_user]
      ,[audit_date]
      ,[audit_tool]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [load].[load_lims_audit_national]
  --join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_audit'
  --where audit_date > dss_parameter_value

 

INSERT INTO [psa].[load_rundef_national]
           ([run_id]
           ,[audit_seq]
           ,[run_date]
           ,[run_type]
           ,[instrument_id]
           ,[analyst]
           ,[deptnum]
           ,[worknum]
           ,[dss_record_source]
           ,[dss_load_date])
 
 
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
  FROM [load].[load_rundef_national]
  --join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_rundef'
  --where run_date > dss_parameter_value

 

INSERT INTO [psa].[load_sampheader_national]
           ([samp_joinid]
           ,[audit_seq]
           ,[samplenum]
           ,[samp_tag]
           ,[loginnum]
           ,[login_seq]
           ,[list_joinid]
           ,[snapshot_flag]
           ,[dkey_flag]
           ,[parm_validate_flag]
           ,[dkey_cnt]
           ,[pchain_id]
           ,[calcid]
           ,[process_step]
           ,[process_id]
           ,[nextprocess_id]
           ,[process_status]
           ,[process_message]
           ,[reqavail_flag]
           ,[calcavail_flag]
           ,[approval_status]
           ,[galp_id]
           ,[input_seq]
           ,[inputdate]
           ,[samp_type]
           ,[run_id]
           ,[link_id]
           ,[enterdate]
           ,[prep_date1]
           ,[prep_date2]
           ,[measuredate]
           ,[rptremarks]
           ,[comments]
           ,[lastdate]
           ,[lastuser]
           ,[lasttool]
           ,[analysis_type]
           ,[analysis_count]
           ,[rpt_mdl]
           ,[virtual_set]
           ,[worknum]
           ,[tic]
           ,[dss_record_source]
           ,[dss_load_date])
 

SELECT [samp_joinid]
      ,[audit_seq]
      ,[samplenum]
      ,[samp_tag]
      ,[loginnum]
      ,[login_seq]
      ,[list_joinid]
      ,[snapshot_flag]
      ,[dkey_flag]
      ,[parm_validate_flag]
      ,[dkey_cnt]
      ,[pchain_id]
      ,[calcid]
      ,[process_step]
      ,[process_id]
      ,[nextprocess_id]
      ,[process_status]
      ,[process_message]
      ,[reqavail_flag]
      ,[calcavail_flag]
      ,[approval_status]
      ,[galp_id]
      ,[input_seq]
      ,[inputdate]
      ,[samp_type]
      ,[run_id]
      ,[link_id]
      ,[enterdate]
      ,[prep_date1]
      ,[prep_date2]
      ,[measuredate]
      ,[rptremarks]
      ,[comments]
      ,[lastdate]
      ,[lastuser]
      ,[lasttool]
      ,[analysis_type]
      ,[analysis_count]
      ,[rpt_mdl]
      ,[virtual_set]
      ,[worknum]
      ,[tic]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [load].[load_sampheader_national]
  --  join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_sampheader'
  --where lastdate > dss_parameter_value

 

INSERT INTO [psa].[load_sample_national]
           ([samplenum]
           ,[clientid]
           ,[acctnum]
           ,[projectnum]
           ,[site]
           ,[locator]
           ,[qctype]
           ,[collectby]
           ,[receivedate]
           ,[collectdate]
           ,[tat]
           ,[duedate]
           ,[priorityflag]
           ,[loginnum]
           ,[login_seq]
           ,[prelognum]
           ,[presamplenum]
           ,[expectdate]
           ,[orderdate]
           ,[description]
           ,[comments]
           ,[quotenumref]
           ,[totalprice]
           ,[invoicenum]
           ,[lastdate]
           ,[lasttool]
           ,[lastuser]
           ,[samp_function]
           ,[designid]
           ,[reportdate]
           ,[prelog_exportedon]
           ,[original_report_date]
           ,[tableid]
           ,[duedate2]
           ,[collect_timezone]
           ,[utc_collectdate]
           ,[dss_record_source]
           ,[dss_load_date])
 

SELECT [samplenum]
      ,[clientid]
      ,[acctnum]
      ,[projectnum]
      ,[site]
      ,[locator]
      ,[qctype]
      ,[collectby]
      ,[receivedate]
      ,[collectdate]
      ,[tat]
      ,[duedate]
      ,[priorityflag]
      ,[loginnum]
      ,[login_seq]
      ,[prelognum]
      ,[presamplenum]
      ,[expectdate]
      ,[orderdate]
      ,[description]
      ,[comments]
      ,[quotenumref]
      ,[totalprice]
      ,[invoicenum]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[samp_function]
      ,[designid]
      ,[reportdate]
      ,[prelog_exportedon]
      ,[original_report_date]
      ,[tableid]
      ,[duedate2]
      ,[collect_timezone]
      ,[utc_collectdate]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [Load].[load_sample_national]
  --  join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_sample'
  --where lastdate > dss_parameter_value

INSERT INTO [psa].[load_listheader_national]
           ([list_joinid]
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
           ,[dss_load_date])
 
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
  FROM [Load].[load_listheader_national]
  --  join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_rundef'
  --where lastdate > dss_parameter_value
 


 
INSERT INTO [psa].[load_projectdef_national]
           ([acctnum]
           ,[projectnum]
           ,[description]
           ,[startdate]
           ,[stopdate]
           ,[ponumber]
           ,[site]
           ,[manager]
           ,[projref]
           ,[sales1code]
           ,[sales1plan]
           ,[sales2code]
           ,[sales2plan]
           ,[termcode]
           ,[lastdate]
           ,[lasttool]
           ,[lastuser]
           ,[locator]
           ,[permitnum]
           ,[dss_record_source]
           ,[dss_load_date])
SELECT [acctnum]
      ,[projectnum]
      ,[description]
      ,[startdate]
      ,[stopdate]
      ,[ponumber]
      ,[site]
      ,[manager]
      ,[projref]
      ,[sales1code]
      ,[sales1plan]
      ,[sales2code]
      ,[sales2plan]
      ,[termcode]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[locator]
      ,[permitnum]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [load].[load_projectdef_national]
  --   join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_projectdef'
  --where lastdate > dss_parameter_value
 

INSERT INTO [psa].[load_vw_sdg_details_national]
           ([loginnum]
           ,[sdgid]
           ,[receivedate]
           ,[acctnum]
           ,[projectnum]
           ,[site]
           ,[locator]
           ,[description]
           ,[status]
           ,[report_complete]
           ,[tsr]
           ,[first_login_seq]
           ,[dss_record_source]
           ,[dss_load_date])
 SELECT [loginnum]
      ,[sdgid]
      ,[receivedate]
      ,[acctnum]
      ,[projectnum]
      ,[site]
      ,[locator]
      ,[description]
      ,[status]
      ,[report_complete]
      ,[tsr]
      ,[first_login_seq]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [load].[load_vw_sdg_details_national]
  --    join [dbo].[dss_parameter] p on dss_parameter_name  = 'last_lastdate_sample'
  --where receivedate > dss_parameter_value


  
 
INSERT INTO [psa].[load_prodmast_national]
           ([matnum]
           ,[prod]
           ,[class]
           ,[pprodref]
           ,[pmatnumref]
           ,[description]
           ,[methodref]
           ,[holddays]
           ,[holdflg]
           ,[duedays]
           ,[factorflg]
           ,[containertype]
           ,[bottles]
           ,[lastdate]
           ,[lasttool]
           ,[lastuser]
           ,[costcenter]
           ,[phasecode]
           ,[auto_anrev_flag]
           ,[expiredate]
           ,[dss_record_source]
           ,[dss_load_date])

SELECT [matnum]
      ,[prod]
      ,[class]
      ,[pprodref]
      ,[pmatnumref]
      ,[description]
      ,[methodref]
      ,[holddays]
      ,[holdflg]
      ,[duedays]
      ,[factorflg]
      ,[containertype]
      ,[bottles]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[costcenter]
      ,[phasecode]
      ,[auto_anrev_flag]
      ,[expiredate]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [load].[load_prodmast_national]



  RETURN
GO
