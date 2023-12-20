Truncate table WSDataVault_dev_incremental.load.load_methods_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_methods_national
(
methodref
,description
,dss_record_source
,dss_load_date
)
Select METHODS.METHODREF
,METHODS.DESCRIPTION
,''
,''
From
SEEDPAK.METHODS METHODS;
UPDATE WSDataVault_dev_incremental.load.load_methods_national SET dss_record_source = 'National.SEEDPAK.METHODS'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;