CREATE TABLE WSDataVault_dev_incremental.load.load_instrumentdef_national (
  instrument nvarchar(50) -- INSTRUMENTDEF.INSTRUMENT 
, certification_req nvarchar(1) -- INSTRUMENTDEF.CERTIFICATION_REQ 
, service_status nvarchar(1) -- INSTRUMENTDEF.SERVICE_STATUS 
, instrument_type nvarchar(20) -- INSTRUMENTDEF.INSTRUMENT_TYPE 
, instrument_model nvarchar(80) -- INSTRUMENTDEF.INSTRUMENT_MODEL 
, serial_number nvarchar(80) -- INSTRUMENTDEF.SERIAL_NUMBER 
, description nvarchar(240) -- INSTRUMENTDEF.DESCRIPTION 
, location nvarchar(80) -- INSTRUMENTDEF.LOCATION 
, calib_days decimal(12,2) -- INSTRUMENTDEF.CALIB_DAYS 
, calib_desc nvarchar(240) -- INSTRUMENTDEF.CALIB_DESC 
, last_calib datetime2 -- INSTRUMENTDEF.LAST_CALIB 
, next_calib datetime2 -- INSTRUMENTDEF.NEXT_CALIB 
, service_days decimal(12,2) -- INSTRUMENTDEF.SERVICE_DAYS 
, service_desc nvarchar(240) -- INSTRUMENTDEF.SERVICE_DESC 
, last_service datetime2 -- INSTRUMENTDEF.LAST_SERVICE 
, next_service datetime2 -- INSTRUMENTDEF.NEXT_SERVICE 
, capacity decimal(12,2) -- INSTRUMENTDEF.CAPACITY 
, capacity_samp_test nvarchar(50) -- INSTRUMENTDEF.CAPACITY_SAMP_TEST 
, instrument_cost decimal(12,2) -- INSTRUMENTDEF.INSTRUMENT_COST 
, lasttool nvarchar(20) -- INSTRUMENTDEF.LASTTOOL 
, lastuser nvarchar(20) -- INSTRUMENTDEF.LASTUSER 
, lastdate datetime -- INSTRUMENTDEF.LASTDATE 
, deptnum decimal(12,2) -- INSTRUMENTDEF.DEPTNUM 
, computername nvarchar(20) -- INSTRUMENTDEF.COMPUTERNAME 
, datapath nvarchar(240) -- INSTRUMENTDEF.DATAPATH 
, raw_data_mode nvarchar(1) -- INSTRUMENTDEF.RAW_DATA_MODE 
, analysis_location_code nvarchar(20) -- INSTRUMENTDEF.ANALYSIS_LOCATION_CODE 
, tzcode nvarchar(10) -- INSTRUMENTDEF.TZCODE 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


