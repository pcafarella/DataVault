CREATE TABLE WSDataVault_dev_incremental.stage.stage_seedpak_trans (
  column_name nvarchar(40) -- load_trans_national.column_name 
, from_value nvarchar(40) -- load_trans_national.from_value 
, to_value nvarchar(200) -- load_trans_national.to_value 
, application nvarchar(10) -- load_trans_national.application 
, specific nvarchar(40) -- load_trans_national.specific 
, lastdate datetime2 -- load_trans_national.lastdate 
, lastuser nvarchar(30) -- load_trans_national.lastuser 
, lasttool nvarchar(30) -- load_trans_national.lasttool 
, dss_record_source nvarchar(255) -- load_trans_national.dss_record_source 
, dss_load_date datetime2 -- load_trans_national.dss_load_date 
, dss_create_time datetime2 
) 
;


