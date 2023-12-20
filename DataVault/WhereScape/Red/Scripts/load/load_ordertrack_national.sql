Truncate table WSDataVault_dev_incremental.load.load_ordertrack_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_ordertrack_national
(
samplenum
,matnum
,prod
,deptnum
,worknum
,dstatus
,dstatusdate
,lastdate
,lasttool
,lastuser
,dss_record_source
,dss_load_date
)
Select ORDERTRACK.SAMPLENUM
,ORDERTRACK.MATNUM
,ORDERTRACK.PROD
,ORDERTRACK.DEPTNUM
,ORDERTRACK.WORKNUM
,ORDERTRACK.DSTATUS
,ORDERTRACK.DSTATUSDATE
,ORDERTRACK.LASTDATE
,ORDERTRACK.LASTTOOL
,ORDERTRACK.LASTUSER
,''
,''
From
SEEDPAK.ORDERTRACK ORDERTRACK
WHERE lastdate > to_date('$Plast_lastdate_ordertrack$','YYYY-MM-DD HH24:MI:SS')
AND lastdate < trunc(sysdate) 
and samplenum like 'L%'  
;
UPDATE WSDataVault_dev_incremental.load.load_ordertrack_national SET dss_record_source = 'National.SEEDPAK.ORDERTRACK'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;