CREATE TABLE WSDataVault_dev_incremental.load.load_prep_data_national (
  samplenum nvarchar(20) -- PREP_DATA.SAMPLENUM 
, worknum nvarchar(20) -- PREP_DATA.WORKNUM 
, datapoint_id decimal(12,2) -- PREP_DATA.DATAPOINT_ID 
, datavalue nvarchar(40) -- PREP_DATA.DATAVALUE 
, lastdate datetime2 -- PREP_DATA.LASTDATE 
, lasttool nvarchar(20) -- PREP_DATA.LASTTOOL 
, lastuser nvarchar(20) -- PREP_DATA.LASTUSER 
, sampletype_id decimal(12,2) -- PREP_DATA.SAMPLETYPE_ID 
, subcontainer nvarchar(20) -- PREP_DATA.SUBCONTAINER 
, repl_id decimal(12,2) -- PREP_DATA.REPL_ID 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


