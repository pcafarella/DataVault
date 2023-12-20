CREATE TABLE WSDataVault_dev_incremental.load.load_rundef_national (
  run_id nvarchar(20) -- RUNDEF.RUN_ID 
, audit_seq decimal(12,2) -- RUNDEF.AUDIT_SEQ 
, run_date datetime2 -- RUNDEF.RUN_DATE 
, run_type nvarchar(10) -- RUNDEF.RUN_TYPE 
, instrument_id nvarchar(50) -- RUNDEF.INSTRUMENT_ID 
, analyst nvarchar(30) -- RUNDEF.ANALYST 
, deptnum int -- RUNDEF.DEPTNUM 
, worknum nvarchar(20) -- RUNDEF.WORKNUM 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


