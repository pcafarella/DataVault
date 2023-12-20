CREATE TABLE WSDataVault_dev_incremental.stage.stage_seedpak_mm_prodmatlist (
  methodid decimal(12,2) -- load_mm_prodmatlist_national.methodid 
, prod nvarchar(20) -- load_mm_prodmatlist_national.prod 
, matnum nvarchar(4) -- load_mm_prodmatlist_national.matnum 
, lastdate datetime2 -- load_mm_prodmatlist_national.lastdate 
, lasttool nvarchar(20) -- load_mm_prodmatlist_national.lasttool 
, lastuser nvarchar(20) -- load_mm_prodmatlist_national.lastuser 
 
, dss_record_source nvarchar(255) -- load_mm_prodmatlist_national.dss_record_source 
, dss_load_date datetime2 -- load_mm_prodmatlist_national.dss_load_date 
, dss_create_time datetime2 
) 
;


