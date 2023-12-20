Truncate table WSDataVault_dev_incremental.load.load_mm_prodmatlist_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_mm_prodmatlist_national
(
methodid
,prod
,matnum
,lastdate
,lasttool
,lastuser
,dss_record_source
,dss_load_date
)
Select MM_PRODMATLIST.METHODID
,MM_PRODMATLIST.PROD
,MM_PRODMATLIST.MATNUM
,MM_PRODMATLIST.LASTDATE
,MM_PRODMATLIST.LASTTOOL
,MM_PRODMATLIST.LASTUSER
,''
,''
From
SEEDPAK.MM_PRODMATLIST MM_PRODMATLIST;
UPDATE WSDataVault_dev_incremental.load.load_mm_prodmatlist_national SET dss_record_source = 'National.SEEDPAK.MM_PRODMATLIST'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;