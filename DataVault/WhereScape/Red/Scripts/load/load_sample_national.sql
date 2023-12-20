Truncate table WSDataVault_dev_incremental.load.load_sample_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_sample_national
(
samplenum
,clientid
,acctnum
,projectnum
,site
,locator
,qctype
,collectby
,receivedate
,collectdate
,tat
,duedate
,priorityflag
,loginnum
,login_seq
,prelognum
,presamplenum
,expectdate
,orderdate
,description
,comments
,quotenumref
,totalprice
,invoicenum
,lastdate
,lasttool
,lastuser
,samp_function
,designid
,reportdate
,prelog_exportedon
,original_report_date
,tableid
,duedate2
,collect_timezone
,utc_collectdate
,dss_record_source
,dss_load_date
)
Select SAMPLE.SAMPLENUM
,SAMPLE.CLIENTID
,SAMPLE.ACCTNUM
,SAMPLE.PROJECTNUM
,SAMPLE.SITE
,SAMPLE.LOCATOR
,SAMPLE.QCTYPE
,SAMPLE.COLLECTBY
,SAMPLE.RECEIVEDATE
,SAMPLE.COLLECTDATE
,SAMPLE.TAT
,SAMPLE.DUEDATE
,SAMPLE.PRIORITYFLAG
,SAMPLE.LOGINNUM
,SAMPLE.LOGIN_SEQ
,SAMPLE.PRELOGNUM
,SAMPLE.PRESAMPLENUM
,SAMPLE.EXPECTDATE
,SAMPLE.ORDERDATE
,SAMPLE.DESCRIPTION
,SAMPLE.COMMENTS
,SAMPLE.QUOTENUMREF
,SAMPLE.TOTALPRICE
,SAMPLE.INVOICENUM
,SAMPLE.LASTDATE
,SAMPLE.LASTTOOL
,SAMPLE.LASTUSER
,SAMPLE.SAMP_FUNCTION
,SAMPLE.DESIGNID
,SAMPLE.REPORTDATE
,SAMPLE.PRELOG_EXPORTEDON
,SAMPLE.ORIGINAL_REPORT_DATE
,SAMPLE.TABLEID
,SAMPLE.DUEDATE2
,SAMPLE.COLLECT_TIMEZONE
,SAMPLE.UTC_COLLECTDATE
,''
,''
From
SEEDPAK.SAMPLE SAMPLE
WHERE lastdate > to_date('$Plast_lastdate_sample$','YYYY-MM-DD HH24:MI:SS') 
AND lastdate < trunc(sysdate) 
AND samplenum like 'L%' ;
UPDATE WSDataVault_dev_incremental.load.load_sample_national SET dss_record_source = 'National.SEEDPAK.SAMPLE'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;