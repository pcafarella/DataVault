CREATE TABLE WSDataVault_dev_incremental.load.load_mm_header_national (
  methodid decimal(12,2) -- MM_HEADER.METHODID 
, active nchar(1) -- MM_HEADER.ACTIVE 
, esc_method_name nvarchar(40) -- MM_HEADER.ESC_METHOD_NAME 
, method_name nvarchar(40) -- MM_HEADER.METHOD_NAME 
, method_type nchar(1) -- MM_HEADER.METHOD_TYPE 
, description nvarchar(100) -- MM_HEADER.DESCRIPTION 
, lastdate datetime2 -- MM_HEADER.LASTDATE 
, lasttool nvarchar(20) -- MM_HEADER.LASTTOOL 
, lastuser nvarchar(20) -- MM_HEADER.LASTUSER 
, deptnum decimal(12,2) -- MM_HEADER.DEPTNUM 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


