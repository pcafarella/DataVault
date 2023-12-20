CREATE TABLE WSDataVault_dev_incremental.stage.stage_project_national (
  hk_h_project nchar(64) NOT NULL 
, project_no nvarchar(50) -- load_projectdef_national.projectnum 
, project_no_bkcc nvarchar(255) -- load_projectdef_national.acctnum 
, tenant_id nvarchar(255) 
, project_name nvarchar(255) -- load_projectdef_national.description 
, project_desc nvarchar(max) -- load_projectdef_national.projref 
, purchase_order_no nvarchar(50) -- load_projectdef_national.ponumber 
, site nvarchar(255) -- load_projectdef_national.site 
, manager nvarchar(30) -- load_projectdef_national.manager 
, sales1code nvarchar(4) -- load_projectdef_national.sales1code 
, sales1plan nvarchar(4) -- load_projectdef_national.sales1plan 
, sales2code nvarchar(4) -- load_projectdef_national.sales2code 
, sales2plan nvarchar(4) -- load_projectdef_national.sales2plan 
, termcode nvarchar(10) -- load_projectdef_national.termcode 
, lastdate datetime2 -- load_projectdef_national.lastdate 
, lasttool nvarchar(20) -- load_projectdef_national.lasttool 
, lastuser nvarchar(20) -- load_projectdef_national.lastuser 
, permitnum nvarchar(100) -- load_projectdef_national.permitnum 
, locator nvarchar(50) -- load_projectdef_national.locator 
, comments nvarchar(max) -- load_clients_national.comments 
, buyer_type nvarchar(20) -- load_clients_national.buyer_type 
, market_segment nvarchar(20) -- load_clients_national.market_segment 
, industry_sector nvarchar(20) -- load_clients_national.industry_sector 
, active nvarchar(1) -- load_clients_national.active 
, sample_interval decimal(12,2) -- load_clients_national.sample_interval 
, tat decimal(12,2) -- load_clients_national.tat 
, tsr nvarchar(4) -- load_clients_national.tsr 
, basin tinyint -- load_clients_national.basin 
, sample_state nvarchar(2) -- load_clients_national.sample_state 
, client_type nvarchar(1) -- load_clients_national.client_type 
, acct_alert nvarchar(1) -- load_clients_national.acct_alert 
, po_required nvarchar(1) -- load_clients_national.po_required 
, rpt_quals nvarchar(1) -- load_clients_national.rpt_quals 
, rpt_mcl nvarchar(1) -- load_clients_national.rpt_mcl 
, ponumber nvarchar(40) -- load_clients_national.ponumber 
, designid nvarchar(10) -- load_clients_national.designid 
, source nvarchar(4) -- load_clients_national.source 
, terr nvarchar(2) -- load_clients_national.terr 
, county nvarchar(50) -- load_clients_national.county 
, inv_with_rpt nvarchar(1) -- load_clients_national.inv_with_rpt 
, webflag nvarchar(1) -- load_clients_national.webflag 
, rpt_qc nvarchar(1) -- load_clients_national.rpt_qc 
, webinvflag nvarchar(1) -- load_clients_national.webinvflag 
, archive_flag nvarchar(1) -- load_clients_national.archive_flag 
, archive_date datetime2 -- load_clients_national.archive_date 
, service nvarchar(4) -- load_clients_national.service 
, rpt_mdl nvarchar(1) -- load_clients_national.rpt_mdl 
, min_invoice_amt decimal(12,2) -- load_clients_national.min_invoice_amt 
, report_packet_id decimal(12,2) -- load_clients_national.report_packet_id 
, historical_data_check nchar(1) -- load_clients_national.historical_data_check 
, rpt_multi_runs nchar(1) -- load_clients_national.rpt_multi_runs 
 
, container_label_type nvarchar(20) -- load_clients_national.container_label_type 
, hdc_level_2 nchar(1) -- load_clients_national.hdc_level_2 
, uploaded_data_flag nvarchar(20) -- load_clients_national.uploaded_data_flag 
 
, certification_program nvarchar(30) -- load_clients_national.certification_program 
, use_repdb_config nvarchar(1) -- load_clients_national.use_repdb_config 
, combine_inv_coc nvarchar(1) -- load_clients_national.combine_inv_coc 
 
, auto_approve_lvl2_report nchar(1) -- load_clients_national.auto_approve_lvl2_report 
, dss_change_hash_project_mroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_clients_national.dss_record_source 
, dss_load_date datetime2 -- load_clients_national.dss_load_date 
, dss_create_time datetime2 
) 
;


