/****** Object:  View [load].[load_projectdef_national_v]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    View [load].[load_projectdef_national_v]
 AS 
SELECT *
FROM (
SELECT  load_projectdef_national.acctnum
       ,load_projectdef_national.[projectnum]
      ,[description]
      ,load_projectdef_national.[ponumber]
      ,[site]
      ,[manager]
	  ,[projref]
      ,[sales1code]
      ,[sales1plan]
      ,[sales2code]
      ,[sales2plan]
      ,load_projectdef_national.[termcode]
      ,load_projectdef_national.[lastdate]
      ,load_projectdef_national.[lasttool]
      ,load_projectdef_national.[lastuser]
      ,[permitnum]
      ,[locator]
      ,[comments]
      , [startdate]
      ,[stopdate]
      ,[buyer_type]
      ,[market_segment]
      ,[industry_sector]
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
      ,[designid]
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
      ,[certification_program]
      ,[use_repdb_config]
      ,[combine_inv_coc]
      ,[auto_approve_lvl2_report]
      ,[load_projectdef_national].[dss_record_source]
      ,[load_projectdef_national].[dss_load_date]

, row_number() OVER (PARTITION BY UPPER(load_projectdef_national.projectnum) ORDER BY load_projectdef_national.acctnum DESC) as rownum
  FROM [Load].[load_projectdef_national]  
  LEFT OUTER JOIN load.[load_clients_national] ON load_clients_national.acctnum = load_projectdef_national.acctnum
  AND load_clients_national.projectnum = load_projectdef_national.projectnum
   ) a
  WHERE rownum  = 1
 
GO
