CREATE TABLE WSDataVault_dev_incremental.load.load_mm_prodmatlist_national (
  methodid decimal(12,2) -- MM_PRODMATLIST.METHODID 
, prod nvarchar(20) -- MM_PRODMATLIST.PROD 
, matnum nvarchar(4) -- MM_PRODMATLIST.MATNUM 
, lastdate datetime2 -- MM_PRODMATLIST.LASTDATE 
, lasttool nvarchar(20) -- MM_PRODMATLIST.LASTTOOL 
, lastuser nvarchar(20) -- MM_PRODMATLIST.LASTUSER 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


