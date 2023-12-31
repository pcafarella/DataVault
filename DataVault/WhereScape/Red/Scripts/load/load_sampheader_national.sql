Truncate table WSDataVault_dev_incremental.load.load_sampheader_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_sampheader_national
(
samp_joinid
,audit_seq
,samplenum
,samp_tag
,loginnum
,login_seq
,list_joinid
,snapshot_flag
,dkey_flag
,parm_validate_flag
,dkey_cnt
,pchain_id
,calcid
,process_step
,process_id
,nextprocess_id
,process_status
,process_message
,reqavail_flag
,calcavail_flag
,approval_status
,galp_id
,input_seq
,inputdate
,samp_type
,run_id
,link_id
,enterdate
,prep_date1
,prep_date2
,measuredate
,rptremarks
,comments
,lastdate
,lastuser
,lasttool
,analysis_type
,analysis_count
,rpt_mdl
,virtual_set
,worknum
,tic
,dss_record_source
,dss_load_date
)
Select SAMPHEADER.SAMP_JOINID
,SAMPHEADER.AUDIT_SEQ
,SAMPHEADER.SAMPLENUM
,SAMPHEADER.SAMP_TAG
,SAMPHEADER.LOGINNUM
,SAMPHEADER.LOGIN_SEQ
,SAMPHEADER.LIST_JOINID
,SAMPHEADER.SNAPSHOT_FLAG
,SAMPHEADER.DKEY_FLAG
,SAMPHEADER.PARM_VALIDATE_FLAG
,SAMPHEADER.DKEY_CNT
,SAMPHEADER.PCHAIN_ID
,SAMPHEADER.CALCID
,SAMPHEADER.PROCESS_STEP
,SAMPHEADER.PROCESS_ID
,SAMPHEADER.NEXTPROCESS_ID
,SAMPHEADER.PROCESS_STATUS
,SAMPHEADER.PROCESS_MESSAGE
,SAMPHEADER.REQAVAIL_FLAG
,SAMPHEADER.CALCAVAIL_FLAG
,SAMPHEADER.APPROVAL_STATUS
,SAMPHEADER.GALP_ID
,SAMPHEADER.INPUT_SEQ
,SAMPHEADER.INPUTDATE
,SAMPHEADER.SAMP_TYPE
,SAMPHEADER.RUN_ID
,SAMPHEADER.LINK_ID
,SAMPHEADER.ENTERDATE
,SAMPHEADER.PREP_DATE1
,SAMPHEADER.PREP_DATE2
,SAMPHEADER.MEASUREDATE
,SAMPHEADER.RPTREMARKS
,SAMPHEADER.COMMENTS
,SAMPHEADER.LASTDATE
,SAMPHEADER.LASTUSER
,SAMPHEADER.LASTTOOL
,SAMPHEADER.ANALYSIS_TYPE
,SAMPHEADER.ANALYSIS_COUNT
,SAMPHEADER.RPT_MDL
,SAMPHEADER.VIRTUAL_SET
,SAMPHEADER.WORKNUM
,SAMPHEADER.TIC
,''
,''
From
SEEDPAK.SAMPHEADER SAMPHEADER
WHERE lastdate > to_date('$Plast_lastdate_sampheader$','YYYY-MM-DD HH24:MI:SS')  
AND lastdate < trunc(sysdate) ;
UPDATE WSDataVault_dev_incremental.load.load_sampheader_national SET dss_record_source = 'National.SEEDPAK.SAMPHEADER'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;