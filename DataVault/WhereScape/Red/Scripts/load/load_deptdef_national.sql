Truncate table WSDataVault_dev_incremental.load.load_deptdef_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_deptdef_national
(
deptnum
,deptabbr
,deptname
,deptacctref
,qcskip_flag
,dss_record_source
,dss_load_date
)
Select DEPTDEF.DEPTNUM
,DEPTDEF.DEPTABBR
,DEPTDEF.DEPTNAME
,DEPTDEF.DEPTACCTREF
,DEPTDEF.QCSKIP_FLAG
,''
,''
From
SEEDPAK.DEPTDEF DEPTDEF;
UPDATE WSDataVault_dev_incremental.load.load_deptdef_national SET dss_record_source = 'National.SEEDPAK.DEPTDEF'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;