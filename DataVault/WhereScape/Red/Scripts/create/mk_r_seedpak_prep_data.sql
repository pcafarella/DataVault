CREATE TABLE WSDataVault_dev_incremental.ref.r_seedpak_prep_data (
  samplenum nvarchar(20) -- stage_seedpak_prep_data.samplenum 
, worknum nvarchar(20) -- stage_seedpak_prep_data.worknum 
, datapoint_id decimal(12,2) -- stage_seedpak_prep_data.datapoint_id 
, datavalue nvarchar(40) -- stage_seedpak_prep_data.datavalue 
, lastdate datetime2 -- stage_seedpak_prep_data.lastdate 
, lasttool nvarchar(20) -- stage_seedpak_prep_data.lasttool 
, lastuser nvarchar(20) -- stage_seedpak_prep_data.lastuser 
, sampletype_id decimal(12,2) -- stage_seedpak_prep_data.sampletype_id 
, subcontainer nvarchar(20) -- stage_seedpak_prep_data.subcontainer 
, repl_id decimal(12,2) -- stage_seedpak_prep_data.repl_id 
, dss_record_source nvarchar(255) -- stage_seedpak_prep_data.dss_record_source 
, dss_load_date datetime2 -- stage_seedpak_prep_data.dss_load_date 
, dss_create_time datetime2 
) 
;


