CREATE TABLE WSDataVault_dev_incremental.load.load_trans_national (
  column_name nvarchar(40) -- TRANS.COLUMN_NAME 
, from_value nvarchar(40) -- TRANS.FROM_VALUE 
, to_value nvarchar(200) -- TRANS.TO_VALUE 
, application nvarchar(10) -- TRANS.APPLICATION 
, specific nvarchar(40) -- TRANS.SPECIFIC 
, lastdate datetime2 -- TRANS.LASTDATE 
, lastuser nvarchar(30) -- TRANS.LASTUSER 
, lasttool nvarchar(30) -- TRANS.LASTTOOL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


