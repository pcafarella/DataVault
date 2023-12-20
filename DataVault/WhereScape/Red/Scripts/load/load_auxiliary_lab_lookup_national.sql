Truncate table WSDataVault_dev_incremental.load.load_auxiliary_lab_lookup_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_auxiliary_lab_lookup_national
(
acctnum
,tzcode
,product_prefix
,date_added
,last_date
,last_user
,last_tool
,account_prefix
,dss_record_source
,dss_load_date
)
Select AUXILIARY_LAB_LOOKUP.ACCTNUM
,AUXILIARY_LAB_LOOKUP.TZCODE
,AUXILIARY_LAB_LOOKUP.PRODUCT_PREFIX
,AUXILIARY_LAB_LOOKUP.DATE_ADDED
,AUXILIARY_LAB_LOOKUP.LAST_DATE
,AUXILIARY_LAB_LOOKUP.LAST_USER
,AUXILIARY_LAB_LOOKUP.LAST_TOOL
,AUXILIARY_LAB_LOOKUP.ACCOUNT_PREFIX
,''
,''
From
SEEDPAK.AUXILIARY_LAB_LOOKUP AUXILIARY_LAB_LOOKUP;
UPDATE WSDataVault_dev_incremental.load.load_auxiliary_lab_lookup_national SET dss_record_source = 'National.SEEDPAK.AUXILIARY_LAB_LOOKUP'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;