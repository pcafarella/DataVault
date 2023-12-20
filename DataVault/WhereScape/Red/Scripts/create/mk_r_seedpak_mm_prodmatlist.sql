CREATE TABLE WSDataVault_dev_incremental.ref.r_seedpak_mm_prodmatlist (
  methodid decimal(12,2) -- stage_seedpak_mm_prodmatlist.methodid 
, prod nvarchar(20) -- stage_seedpak_mm_prodmatlist.prod 
, matnum nvarchar(4) -- stage_seedpak_mm_prodmatlist.matnum 
, lastdate datetime2 -- stage_seedpak_mm_prodmatlist.lastdate 
, lasttool nvarchar(20) -- stage_seedpak_mm_prodmatlist.lasttool 
, lastuser nvarchar(20) -- stage_seedpak_mm_prodmatlist.lastuser 
 
, dss_record_source nvarchar(255) -- stage_seedpak_mm_prodmatlist.dss_record_source 
, dss_load_date datetime2 -- stage_seedpak_mm_prodmatlist.dss_load_date 
, dss_create_time datetime2 
) 
;


