Truncate table WSDataVault_dev_incremental.load.load_prep_data_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_prep_data_national
(
samplenum
,worknum
,datapoint_id
,datavalue
,lastdate
,lasttool
,lastuser
,sampletype_id
,subcontainer
,repl_id
,dss_record_source
,dss_load_date
)
Select PREP_DATA.SAMPLENUM
,PREP_DATA.WORKNUM
,PREP_DATA.DATAPOINT_ID
,PREP_DATA.DATAVALUE
,PREP_DATA.LASTDATE
,PREP_DATA.LASTTOOL
,PREP_DATA.LASTUSER
,PREP_DATA.SAMPLETYPE_ID
,PREP_DATA.SUBCONTAINER
,PREP_DATA.REPL_ID
,''
,''
From
SEEDPAK.PREP_DATA PREP_DATA
WHERE samplenum = 'HEADER' and datapoint_id IN (630);
UPDATE WSDataVault_dev_incremental.load.load_prep_data_national SET dss_record_source = 'National.SEEDPAK.PREP_DATA'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;