Truncate table WSDataVault_dev_incremental.load.load_mm_header_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_mm_header_national
(
methodid
,active
,esc_method_name
,method_name
,method_type
,description
,lastdate
,lasttool
,lastuser
,deptnum
,dss_record_source
,dss_load_date
)
Select MM_HEADER.METHODID
,MM_HEADER.ACTIVE
,MM_HEADER.ESC_METHOD_NAME
,MM_HEADER.METHOD_NAME
,MM_HEADER.METHOD_TYPE
,MM_HEADER.DESCRIPTION
,MM_HEADER.LASTDATE
,MM_HEADER.LASTTOOL
,MM_HEADER.LASTUSER
,MM_HEADER.DEPTNUM
,''
,''
From
SEEDPAK.MM_HEADER MM_HEADER;
UPDATE WSDataVault_dev_incremental.load.load_mm_header_national SET dss_record_source = 'National.SEEDPAK.MM_HEADER'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;