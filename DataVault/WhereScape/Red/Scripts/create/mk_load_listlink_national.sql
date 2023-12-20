CREATE TABLE WSDataVault_dev_incremental.load.load_listlink_national (
  link_id nvarchar(20) -- LISTLINK.LINK_ID 
, description nvarchar(40) -- LISTLINK.DESCRIPTION 
, prod nvarchar(20) -- LISTLINK.PROD 
, matnum nvarchar(4) -- LISTLINK.MATNUM 
, list_pointer nvarchar(20) -- LISTLINK.LIST_POINTER 
, listtype nvarchar(40) -- LISTLINK.LISTTYPE 
, list_func nvarchar(40) -- LISTLINK.LIST_FUNC 
, listmatclass nvarchar(10) -- LISTLINK.LISTMATCLASS 
, parm_stored nvarchar(40) -- LISTLINK.PARM_STORED 
, pchain_name nvarchar(30) -- LISTLINK.PCHAIN_NAME 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


