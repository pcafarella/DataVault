Truncate table WSDataVault_dev_incremental.load.load_ordermast_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_ordermast_national
(
samplenum
,matnum
,prod
,pkey
,plevel
,pprodref
,pmatnumref
,class
,price
,cost
,factor
,holddate
,holddays
,holdflg
,duedate
,duedays
,location
,bottles
,lastdate
,lasttool
,lastuser
,designid
,comp
,dss_record_source
,dss_load_date
)
Select ORDERMAST.SAMPLENUM
,ORDERMAST.MATNUM
,ORDERMAST.PROD
,ORDERMAST.PKEY
,ORDERMAST.PLEVEL
,ORDERMAST.PPRODREF
,ORDERMAST.PMATNUMREF
,ORDERMAST.CLASS
,ORDERMAST.PRICE
,ORDERMAST.COST
,ORDERMAST.FACTOR
,ORDERMAST.HOLDDATE
,ORDERMAST.HOLDDAYS
,ORDERMAST.HOLDFLG
,ORDERMAST.DUEDATE
,ORDERMAST.DUEDAYS
,ORDERMAST.LOCATION
,ORDERMAST.BOTTLES
,ORDERMAST.LASTDATE
,ORDERMAST.LASTTOOL
,ORDERMAST.LASTUSER
,ORDERMAST.DESIGNID
,ORDERMAST.COMP
,''
,''
From
SEEDPAK.ORDERMAST ORDERMAST
WHERE lastdate > to_date('$Plast_lastdate_ordermast$','YYYY-MM-DD HH24:MI:SS')
AND lastdate < trunc(sysdate)   
and samplenum like 'L%';
UPDATE WSDataVault_dev_incremental.load.load_ordermast_national SET dss_record_source = 'National.SEEDPAK.ORDERMAST'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;