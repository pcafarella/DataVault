Truncate table WSDataVault_dev_incremental.load.load_listlink_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_listlink_national
(
link_id
,description
,prod
,matnum
,list_pointer
,listtype
,list_func
,listmatclass
,parm_stored
,pchain_name
,dss_record_source
,dss_load_date
)
Select LISTLINK.LINK_ID
,LISTLINK.DESCRIPTION
,LISTLINK.PROD
,LISTLINK.MATNUM
,LISTLINK.LIST_POINTER
,LISTLINK.LISTTYPE
,LISTLINK.LIST_FUNC
,LISTLINK.LISTMATCLASS
,LISTLINK.PARM_STORED
,LISTLINK.PCHAIN_NAME
,''
,''
From
SEEDPAK.LISTLINK LISTLINK;
UPDATE WSDataVault_dev_incremental.load.load_listlink_national SET dss_record_source = 'National.SEEDPAK.LISTLINK'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;