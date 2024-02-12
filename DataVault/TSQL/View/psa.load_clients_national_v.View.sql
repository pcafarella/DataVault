/****** Object:  View [psa].[load_clients_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
DROP VIEW [psa].[load_clients_national_v]
GO
/****** Object:  View [psa].[load_clients_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    VIEW [psa].[load_clients_national_v]
AS
 
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
      ,[scinfl_percent]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [psa].[load_clients_national] o
  WHERE dss_load_date = (SELECT MAX(dss_load_date) FROM  [psa].[load_clients_national]  i WHERE i.acctnum = o.acctnum)


GO
