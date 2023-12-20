Truncate table WSDataVault_dev_incremental.load.load_rundef_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_rundef_national
(
run_id
,audit_seq
,run_date
,run_type
,instrument_id
,analyst
,deptnum
,worknum
,dss_record_source
,dss_load_date
)
Select RUNDEF.RUN_ID
,RUNDEF.AUDIT_SEQ
,RUNDEF.RUN_DATE
,RUNDEF.RUN_TYPE
,RUNDEF.INSTRUMENT_ID
,RUNDEF.ANALYST
,RUNDEF.DEPTNUM
,RUNDEF.WORKNUM
,''
,''
From
SEEDPAK.RUNDEF RUNDEF
WHERE run_date > sysdate-60 
--to_date('$Plast_lastdate_rundef$','YYYY-MM-DD HH24:MI:SS')  
;
UPDATE WSDataVault_dev_incremental.load.load_rundef_national SET dss_record_source = 'National.SEEDPAK.RUNDEF'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;