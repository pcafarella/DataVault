CREATE TABLE WSDataVault_dev_incremental.stage.stage_analytical_instrument_national (
  hk_h_analytical_instrument nchar(64) NOT NULL 
, instrument_no nvarchar(50) -- load_instrumentdef_national.instrument 
, instrument_no_bkcc nvarchar(50) 
, tenant_id nvarchar(255) 
, certification_req nvarchar(1) -- load_instrumentdef_national.certification_req 
, service_status nvarchar(1) -- load_instrumentdef_national.service_status 
, instrument_type nvarchar(20) -- load_instrumentdef_national.instrument_type 
, instrument_model nvarchar(80) -- load_instrumentdef_national.instrument_model 
, serial_number nvarchar(80) -- load_instrumentdef_national.serial_number 
, description nvarchar(240) -- load_instrumentdef_national.description 
, location nvarchar(80) -- load_instrumentdef_national.location 
, calib_days decimal(12,2) -- load_instrumentdef_national.calib_days 
, calib_desc nvarchar(240) -- load_instrumentdef_national.calib_desc 
, last_calib datetime2 -- load_instrumentdef_national.last_calib 
, next_calib datetime2 -- load_instrumentdef_national.next_calib 
, service_days decimal(12,2) -- load_instrumentdef_national.service_days 
, service_desc nvarchar(240) -- load_instrumentdef_national.service_desc 
, last_service datetime2 -- load_instrumentdef_national.last_service 
, next_service datetime2 -- load_instrumentdef_national.next_service 
, capacity decimal(12,2) -- load_instrumentdef_national.capacity 
 
, capacity_samp_test nvarchar(1) -- load_instrumentdef_national.capacity_samp_test 
, instrument_cost decimal(12,2) -- load_instrumentdef_national.instrument_cost 
, lasttool nvarchar(20) -- load_instrumentdef_national.lasttool 
, lastuser nvarchar(20) -- load_instrumentdef_national.lastuser 
, lastdate datetime2 -- load_instrumentdef_national.lastdate 
, computername nvarchar(20) -- load_instrumentdef_national.computername 
, datapath nvarchar(240) -- load_instrumentdef_national.datapath 
, raw_data_mode nvarchar(1) -- load_instrumentdef_national.raw_data_mode 
 
, analysis_location_code nvarchar(20) -- load_instrumentdef_national.analysis_location_code 
, tzcode nvarchar(10) -- load_instrumentdef_national.tzcode 
, dss_change_hash_analytical_instrument_mroc_national nchar(64) NOT NULL 
 
, dss_record_source nvarchar(255) -- load_instrumentdef_national.dss_record_source 
, dss_load_date datetime2 -- load_instrumentdef_national.dss_load_date 
, dss_create_time datetime2 
) 
;


