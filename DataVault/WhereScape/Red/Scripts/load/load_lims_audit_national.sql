Truncate table WSDataVault_dev_incremental.load.load_lims_audit_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_lims_audit_national
(
key_value
,audit_table
,audit_field
,audit_action
,old_value
,new_value
,audit_user
,audit_date
,audit_tool
,dss_record_source
,dss_load_date
)
Select LIMS_AUDIT.KEY_VALUE
,LIMS_AUDIT.AUDIT_TABLE
,LIMS_AUDIT.AUDIT_FIELD
,LIMS_AUDIT.AUDIT_ACTION
,LIMS_AUDIT.OLD_VALUE
,LIMS_AUDIT.NEW_VALUE
,LIMS_AUDIT.AUDIT_USER
,LIMS_AUDIT.AUDIT_DATE
,LIMS_AUDIT.AUDIT_TOOL
,''
,''
From
SEEDPAK.LIMS_AUDIT LIMS_AUDIT
WHERE audit_date > to_date('$Plast_lastdate_audit$','YYYY-MM-DD HH24:MI:SS') 
AND LIMS_AUDIT.AUDIT_DATE < trunc(sysdate)  ;
UPDATE WSDataVault_dev_incremental.load.load_lims_audit_national SET dss_record_source = 'National.SEEDPAK.LIMS_AUDIT'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;