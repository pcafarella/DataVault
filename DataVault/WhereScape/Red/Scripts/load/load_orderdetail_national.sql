Truncate table WSDataVault_dev_incremental.load.load_orderdetail_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_orderdetail_national
(
samplenum
,matnum
,prod
,login_seq
,loginnum
,worknum
,workdate
,workstatus
,priorityflag
,class
,deptnum
,dstatus
,dstatusdate
,dalloc
,dprice
,dcost
,dholddays
,dholddate
,dduedays
,dduedate
,dprevdeptnum
,dnextdeptnum
,lastdate
,lasttool
,lastuser
,dss_record_source
,dss_load_date
)
Select ORDERDETAIL.SAMPLENUM
,ORDERDETAIL.MATNUM
,ORDERDETAIL.PROD
,ORDERDETAIL.LOGIN_SEQ
,ORDERDETAIL.LOGINNUM
,ORDERDETAIL.WORKNUM
,ORDERDETAIL.WORKDATE
,ORDERDETAIL.WORKSTATUS
,ORDERDETAIL.PRIORITYFLAG
,ORDERDETAIL.CLASS
,ORDERDETAIL.DEPTNUM
,ORDERDETAIL.DSTATUS
,ORDERDETAIL.DSTATUSDATE
,ORDERDETAIL.DALLOC
,ORDERDETAIL.DPRICE
,ORDERDETAIL.DCOST
,ORDERDETAIL.DHOLDDAYS
,ORDERDETAIL.DHOLDDATE
,ORDERDETAIL.DDUEDAYS
,ORDERDETAIL.DDUEDATE
,ORDERDETAIL.DPREVDEPTNUM
,ORDERDETAIL.DNEXTDEPTNUM
,ORDERDETAIL.LASTDATE
,ORDERDETAIL.LASTTOOL
,ORDERDETAIL.LASTUSER
,''
,''
From
SEEDPAK.ORDERDETAIL ORDERDETAIL
WHERE lastdate > to_date('$Plast_lastdate_orderdetail$','YYYY-MM-DD HH24:MI:SS')  
AND lastdate < trunc(sysdate) 
and samplenum like 'L%';
UPDATE WSDataVault_dev_incremental.load.load_orderdetail_national SET dss_record_source = 'National.SEEDPAK.ORDERDETAIL'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;