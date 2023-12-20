Truncate table WSDataVault_dev_incremental.load.load_listheader_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_listheader_national
(
list_joinid
,plevel
,pkey
,listtype
,list_func
,listmatclass
,current_flag
,expiredate
,pchain_name
,designid
,dkey_flag
,parm_validate_flag
,methodref
,description
,lastdate
,lastuser
,lasttool
,seq
,icalcritid
,report_definition_id
,methodid
,dss_record_source
,dss_load_date
)
Select LISTHEADER.LIST_JOINID
,LISTHEADER.PLEVEL
,LISTHEADER.PKEY
,LISTHEADER.LISTTYPE
,LISTHEADER.LIST_FUNC
,LISTHEADER.LISTMATCLASS
,LISTHEADER.CURRENT_FLAG
,LISTHEADER.EXPIREDATE
,LISTHEADER.PCHAIN_NAME
,LISTHEADER.DESIGNID
,LISTHEADER.DKEY_FLAG
,LISTHEADER.PARM_VALIDATE_FLAG
,LISTHEADER.METHODREF
,LISTHEADER.DESCRIPTION
,LISTHEADER.LASTDATE
,LISTHEADER.LASTUSER
,LISTHEADER.LASTTOOL
,LISTHEADER.SEQ
,LISTHEADER.ICALCRITID
,LISTHEADER.REPORT_DEFINITION_ID
,LISTHEADER.METHODID
,''
,''
From
SEEDPAK.LISTHEADER LISTHEADER
WHERE lastdate > to_date('$Plast_lastdate_rundef$','YYYY-MM-DD HH24:MI:SS')  
AND lastdate < trunc(sysdate) ;
UPDATE WSDataVault_dev_incremental.load.load_listheader_national SET dss_record_source = 'National.SEEDPAK.LISTHEADER'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;