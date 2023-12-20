CREATE TABLE WSDataVault_dev_incremental.raw.s_analytical_instrument_mroc_national (
 
  hk_h_analytical_instrument nchar(64) NOT NULL -- stage_analytical_instrument_national.hk_h_analytical_instrument 
 
, certification_req nvarchar(1) -- stage_analytical_instrument_national.certification_req 
 
, service_status nvarchar(1) -- stage_analytical_instrument_national.service_status 
 
, instrument_type nvarchar(20) -- stage_analytical_instrument_national.instrument_type 
 
, instrument_model nvarchar(80) -- stage_analytical_instrument_national.instrument_model 
 
, serial_number nvarchar(80) -- stage_analytical_instrument_national.serial_number 
, description nvarchar(240) -- stage_analytical_instrument_national.description 
, location nvarchar(80) -- stage_analytical_instrument_national.location 
, calib_days decimal(12,2) -- stage_analytical_instrument_national.calib_days 
, calib_desc nvarchar(240) -- stage_analytical_instrument_national.calib_desc 
, last_calib datetime2 -- stage_analytical_instrument_national.last_calib 
, next_calib datetime2 -- stage_analytical_instrument_national.next_calib 
 
, service_days decimal(12,2) -- stage_analytical_instrument_national.service_days 
 
, service_desc nvarchar(240) -- stage_analytical_instrument_national.service_desc 
, last_service datetime2 -- stage_analytical_instrument_national.last_service 
, next_service datetime2 -- stage_analytical_instrument_national.next_service 
, capacity decimal(12,2) -- stage_analytical_instrument_national.capacity 
 
, capacity_samp_test nvarchar(1) -- stage_analytical_instrument_national.capacity_samp_test 
 
, instrument_cost decimal(12,2) -- stage_analytical_instrument_national.instrument_cost 
, lasttool nvarchar(20) -- stage_analytical_instrument_national.lasttool 
, lastuser nvarchar(20) -- stage_analytical_instrument_national.lastuser 
, lastdate datetime2 -- stage_analytical_instrument_national.lastdate 
, computername nvarchar(20) -- stage_analytical_instrument_national.computername 
, datapath nvarchar(240) -- stage_analytical_instrument_national.datapath 
 
, raw_data_mode nvarchar(1) -- stage_analytical_instrument_national.raw_data_mode 
 
, analysis_location_code nvarchar(20) -- stage_analytical_instrument_national.analysis_location_code 
, tzcode nvarchar(10) -- stage_analytical_instrument_national.tzcode 
 
, dss_change_hash nchar(64) NOT NULL -- stage_analytical_instrument_national.dss_change_hash_analytical_instrument_mroc_national 
 
, dss_record_source nvarchar(255) -- stage_analytical_instrument_national.dss_record_source 
, dss_load_date datetime2 -- stage_analytical_instrument_national.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_analytical__29815bbb_idx_CK ON WSDataVault_dev_incremental.raw.s_analytical_instrument_mroc_national (hk_h_analytical_instrument,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_analytical__29815bbb_idx_PK ON WSDataVault_dev_incremental.raw.s_analytical_instrument_mroc_national (hk_h_analytical_instrument,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

