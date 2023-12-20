Truncate table WSDataVault_dev_incremental.load.load_instrumentdef_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_instrumentdef_national
(
instrument
,certification_req
,service_status
,instrument_type
,instrument_model
,serial_number
,description
,location
,calib_days
,calib_desc
,last_calib
,next_calib
,service_days
,service_desc
,last_service
,next_service
,capacity
,capacity_samp_test
,instrument_cost
,lasttool
,lastuser
,lastdate
,deptnum
,computername
,datapath
,raw_data_mode
,analysis_location_code
,tzcode
,dss_record_source
,dss_load_date
)
Select INSTRUMENTDEF.INSTRUMENT
,INSTRUMENTDEF.CERTIFICATION_REQ
,INSTRUMENTDEF.SERVICE_STATUS
,INSTRUMENTDEF.INSTRUMENT_TYPE
,INSTRUMENTDEF.INSTRUMENT_MODEL
,INSTRUMENTDEF.SERIAL_NUMBER
,INSTRUMENTDEF.DESCRIPTION
,INSTRUMENTDEF.LOCATION
,INSTRUMENTDEF.CALIB_DAYS
,INSTRUMENTDEF.CALIB_DESC
,INSTRUMENTDEF.LAST_CALIB
,INSTRUMENTDEF.NEXT_CALIB
,INSTRUMENTDEF.SERVICE_DAYS
,INSTRUMENTDEF.SERVICE_DESC
,INSTRUMENTDEF.LAST_SERVICE
,INSTRUMENTDEF.NEXT_SERVICE
,INSTRUMENTDEF.CAPACITY
,INSTRUMENTDEF.CAPACITY_SAMP_TEST
,INSTRUMENTDEF.INSTRUMENT_COST
,INSTRUMENTDEF.LASTTOOL
,INSTRUMENTDEF.LASTUSER
,INSTRUMENTDEF.LASTDATE
,INSTRUMENTDEF.DEPTNUM
,INSTRUMENTDEF.COMPUTERNAME
,INSTRUMENTDEF.DATAPATH
,INSTRUMENTDEF.RAW_DATA_MODE
,INSTRUMENTDEF.ANALYSIS_LOCATION_CODE
,INSTRUMENTDEF.TZCODE
,''
,''
From
SEEDPAK.INSTRUMENTDEF INSTRUMENTDEF;
UPDATE WSDataVault_dev_incremental.load.load_instrumentdef_national SET dss_record_source = 'National.SEEDPAK.INSTRUMENTDEF'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;