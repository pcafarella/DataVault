Truncate table WSDataVault_dev_incremental.load.load_clients_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_clients_national
(
acctnum
,projectnum
,active
,sample_interval
,tat
,tsr
,basin
,sample_state
,client_type
,acct_alert
,po_required
,rpt_quals
,rpt_mcl
,ponumber
,termcode
,designid
,comments
,source
,terr
,county
,inv_with_rpt
,webflag
,rpt_qc
,webinvflag
,archive_flag
,archive_date
,service
,rpt_mdl
,min_invoice_amt
,report_packet_id
,historical_data_check
,rpt_multi_runs
,container_label_type
,hdc_level_2
,uploaded_data_flag
,lastdate
,lastuser
,lasttool
,certification_program
,use_repdb_config
,buyer_type
,market_segment
,industry_sector
,combine_inv_coc
,auto_approve_lvl2_report
,scinfl_percent
,dss_record_source
,dss_load_date
)
Select CLIENTS.ACCTNUM
,CLIENTS.PROJECTNUM
,CLIENTS.ACTIVE
,CLIENTS.SAMPLE_INTERVAL
,CLIENTS.TAT
,CLIENTS.TSR
,CLIENTS.BASIN
,CLIENTS.SAMPLE_STATE
,CLIENTS.CLIENT_TYPE
,CLIENTS.ACCT_ALERT
,CLIENTS.PO_REQUIRED
,CLIENTS.RPT_QUALS
,CLIENTS.RPT_MCL
,CLIENTS.PONUMBER
,CLIENTS.TERMCODE
,CLIENTS.DESIGNID
,CLIENTS.COMMENTS
,CLIENTS.SOURCE
,CLIENTS.TERR
,CLIENTS.COUNTY
,CLIENTS.INV_WITH_RPT
,CLIENTS.WEBFLAG
,CLIENTS.RPT_QC
,CLIENTS.WEBINVFLAG
,CLIENTS.ARCHIVE_FLAG
,CLIENTS.ARCHIVE_DATE
,CLIENTS.SERVICE
,CLIENTS.RPT_MDL
,CLIENTS.MIN_INVOICE_AMT
,CLIENTS.REPORT_PACKET_ID
,CLIENTS.HISTORICAL_DATA_CHECK
,CLIENTS.RPT_MULTI_RUNS
,CLIENTS.CONTAINER_LABEL_TYPE
,CLIENTS.HDC_LEVEL_2
,CLIENTS.UPLOADED_DATA_FLAG
,CLIENTS.LASTDATE
,CLIENTS.LASTUSER
,CLIENTS.LASTTOOL
,CLIENTS.CERTIFICATION_PROGRAM
,CLIENTS.USE_REPDB_CONFIG
,CLIENTS.BUYER_TYPE
,CLIENTS.MARKET_SEGMENT
,CLIENTS.INDUSTRY_SECTOR
,CLIENTS.COMBINE_INV_COC
,CLIENTS.AUTO_APPROVE_LVL2_REPORT
,CLIENTS.SCINFL_PERCENT
,''
,''
From
SEEDPAK.CLIENTS CLIENTS
WHERE lastdate > to_date('$Plast_lastdate_clients$','YYYY-MM-DD HH24:MI:SS')  
;
UPDATE WSDataVault_dev_incremental.load.load_clients_national SET dss_record_source = 'National.SEEDPAK.CLIENTS'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;