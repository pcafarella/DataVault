CREATE TABLE WSDataVault_dev_incremental.ref.r_seedpak_trans (
  column_name nvarchar(40) -- stage_seedpak_trans.column_name 
, from_value nvarchar(40) -- stage_seedpak_trans.from_value 
, to_value nvarchar(200) -- stage_seedpak_trans.to_value 
, application nvarchar(10) -- stage_seedpak_trans.application 
, specific nvarchar(40) -- stage_seedpak_trans.specific 
, lastdate datetime2 -- stage_seedpak_trans.lastdate 
, lastuser nvarchar(30) -- stage_seedpak_trans.lastuser 
, lasttool nvarchar(30) -- stage_seedpak_trans.lasttool 
, dss_record_source nvarchar(255) -- stage_seedpak_trans.dss_record_source 
, dss_load_date datetime2 -- stage_seedpak_trans.dss_load_date 
, dss_create_time datetime2 
) 
;


