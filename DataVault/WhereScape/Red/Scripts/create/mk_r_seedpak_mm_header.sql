CREATE TABLE WSDataVault_dev_incremental.ref.r_seedpak_mm_header (
  methodid decimal(12,2) -- stage_seedpak_mm_header.methodid 
, active nchar(1) -- stage_seedpak_mm_header.active 
, esc_method_name nvarchar(40) -- stage_seedpak_mm_header.esc_method_name 
, method_name nvarchar(40) -- stage_seedpak_mm_header.method_name 
, method_type nchar(1) -- stage_seedpak_mm_header.method_type 
, description nvarchar(100) -- stage_seedpak_mm_header.description 
, lastdate datetime2 -- stage_seedpak_mm_header.lastdate 
, lasttool nvarchar(20) -- stage_seedpak_mm_header.lasttool 
, lastuser nvarchar(20) -- stage_seedpak_mm_header.lastuser 
, deptnum decimal(12,2) -- stage_seedpak_mm_header.deptnum 
, dss_record_source nvarchar(255) -- stage_seedpak_mm_header.dss_record_source 
, dss_load_date datetime2 -- stage_seedpak_mm_header.dss_load_date 
, dss_create_time datetime2 
) 
;


