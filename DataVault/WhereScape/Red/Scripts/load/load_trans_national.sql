Truncate table WSDataVault_dev_incremental.load.load_trans_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_trans_national
(
column_name
,from_value
,to_value
,application
,specific
,lastdate
,lastuser
,lasttool
,dss_record_source
,dss_load_date
)
Select TRANS.COLUMN_NAME
,TRANS.FROM_VALUE
,TRANS.TO_VALUE
,TRANS.APPLICATION
,TRANS.SPECIFIC
,TRANS.LASTDATE
,TRANS.LASTUSER
,TRANS.LASTTOOL
,''
,''
From
SEEDPAK.TRANS TRANS;
UPDATE WSDataVault_dev_incremental.load.load_trans_national SET dss_record_source = 'National.SEEDPAK.TRANS'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;