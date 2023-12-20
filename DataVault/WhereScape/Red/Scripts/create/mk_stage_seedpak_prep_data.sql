CREATE TABLE WSDataVault_dev_incremental.stage.stage_seedpak_prep_data (
  samplenum nvarchar(20) -- load_prep_data_national.samplenum 
, worknum nvarchar(20) -- load_prep_data_national.worknum 
, datapoint_id decimal(12,2) -- load_prep_data_national.datapoint_id 
, datavalue nvarchar(40) -- load_prep_data_national.datavalue 
, lastdate datetime2 -- load_prep_data_national.lastdate 
, lasttool nvarchar(20) -- load_prep_data_national.lasttool 
, lastuser nvarchar(20) -- load_prep_data_national.lastuser 
, sampletype_id decimal(12,2) -- load_prep_data_national.sampletype_id 
, subcontainer nvarchar(20) -- load_prep_data_national.subcontainer 
, repl_id decimal(12,2) -- load_prep_data_national.repl_id 
, dss_record_source nvarchar(255) -- load_prep_data_national.dss_record_source 
, dss_load_date datetime2 -- load_prep_data_national.dss_load_date 
, dss_create_time datetime2 
) 
;


