/****** Object:  View [load].[load_clients_national_v]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE       View [load].[load_clients_national_v]
 AS 
SELECT *
FROM (

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
	  ,row_number() OVER (PARTITION BY UPPER(load_clients_national.acctnum), UPPER(load_clients_national.projectnum)  ORDER BY load_clients_national.tsr DESC) as rownum
  FROM [Load].[load_clients_national]) a
  WHERE rownum = 1
  --and [acctnum] =  'WMPHEPOINE'
  --and  projectnum =  'WMPHEPOINE-00012'

GO
