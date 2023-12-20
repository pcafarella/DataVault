CREATE TABLE WSDataVault_dev_incremental.stage.stage_seedpak_mm_header (
  methodid decimal(12,2) -- load_mm_header_national.methodid 
, active nchar(1) -- load_mm_header_national.active 
, esc_method_name nvarchar(40) -- load_mm_header_national.esc_method_name 
, method_name nvarchar(40) -- load_mm_header_national.method_name 
, method_type nchar(1) -- load_mm_header_national.method_type 
, description nvarchar(100) -- load_mm_header_national.description 
, lastdate datetime2 -- load_mm_header_national.lastdate 
, lasttool nvarchar(20) -- load_mm_header_national.lasttool 
, lastuser nvarchar(20) -- load_mm_header_national.lastuser 
, deptnum decimal(12,2) -- load_mm_header_national.deptnum 
, dss_record_source nvarchar(255) -- load_mm_header_national.dss_record_source 
, dss_load_date datetime2 -- load_mm_header_national.dss_load_date 
, dss_create_time datetime2 
) 
;


