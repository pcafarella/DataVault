CREATE TABLE WSDataVault_dev_incremental.load.load_listheader_national (
  list_joinid nvarchar(20) -- LISTHEADER.LIST_JOINID 
, plevel decimal(12,2) -- LISTHEADER.PLEVEL 
, pkey nvarchar(20) -- LISTHEADER.PKEY 
, listtype nvarchar(50) -- LISTHEADER.LISTTYPE 
, list_func nvarchar(40) -- LISTHEADER.LIST_FUNC 
, listmatclass nvarchar(10) -- LISTHEADER.LISTMATCLASS 
, current_flag nvarchar(1) -- LISTHEADER.CURRENT_FLAG 
, expiredate datetime2 -- LISTHEADER.EXPIREDATE 
, pchain_name nvarchar(30) -- LISTHEADER.PCHAIN_NAME 
, designid nvarchar(10) -- LISTHEADER.DESIGNID 
, dkey_flag nvarchar(1) -- LISTHEADER.DKEY_FLAG 
, parm_validate_flag nvarchar(1) -- LISTHEADER.PARM_VALIDATE_FLAG 
, methodref nvarchar(40) -- LISTHEADER.METHODREF 
, description nvarchar(100) -- LISTHEADER.DESCRIPTION 
, lastdate datetime2 -- LISTHEADER.LASTDATE 
, lastuser nvarchar(20) -- LISTHEADER.LASTUSER 
, lasttool nvarchar(20) -- LISTHEADER.LASTTOOL 
, seq decimal(12,2) -- LISTHEADER.SEQ 
, icalcritid bigint -- LISTHEADER.ICALCRITID 
, report_definition_id decimal(12,2) -- LISTHEADER.REPORT_DEFINITION_ID 
, methodid decimal(12,2) -- LISTHEADER.METHODID 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


