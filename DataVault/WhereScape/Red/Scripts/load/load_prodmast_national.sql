Truncate table WSDataVault_dev_incremental.load.load_prodmast_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_prodmast_national
(
matnum
,prod
,class
,pprodref
,pmatnumref
,description
,methodref
,holddays
,holdflg
,duedays
,factorflg
,containertype
,bottles
,lastdate
,lasttool
,lastuser
,costcenter
,phasecode
,auto_anrev_flag
,expiredate
,dss_record_source
,dss_load_date
)
Select PRODMAST.MATNUM
,PRODMAST.PROD
,PRODMAST.CLASS
,PRODMAST.PPRODREF
,PRODMAST.PMATNUMREF
,PRODMAST.DESCRIPTION
,PRODMAST.METHODREF
,PRODMAST.HOLDDAYS
,PRODMAST.HOLDFLG
,PRODMAST.DUEDAYS
,PRODMAST.FACTORFLG
,PRODMAST.CONTAINERTYPE
,PRODMAST.BOTTLES
,PRODMAST.LASTDATE
,PRODMAST.LASTTOOL
,PRODMAST.LASTUSER
,PRODMAST.COSTCENTER
,PRODMAST.PHASECODE
,PRODMAST.AUTO_ANREV_FLAG
,PRODMAST.EXPIREDATE
,''
,''
From
SEEDPAK.PRODMAST PRODMAST;
UPDATE WSDataVault_dev_incremental.load.load_prodmast_national SET dss_record_source = 'National.SEEDPAK.PRODMAST'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;