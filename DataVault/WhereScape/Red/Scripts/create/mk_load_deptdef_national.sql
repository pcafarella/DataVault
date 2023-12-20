CREATE TABLE WSDataVault_dev_incremental.load.load_deptdef_national (
  deptnum nvarchar(50) -- DEPTDEF.DEPTNUM 
, deptabbr nvarchar(50) -- DEPTDEF.DEPTABBR 
, deptname nvarchar(100) -- DEPTDEF.DEPTNAME 
, deptacctref nvarchar(20) -- DEPTDEF.DEPTACCTREF 
, qcskip_flag nvarchar(1) -- DEPTDEF.QCSKIP_FLAG 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


