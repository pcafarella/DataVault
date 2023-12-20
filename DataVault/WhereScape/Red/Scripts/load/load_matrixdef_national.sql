Truncate table WSDataVault_dev_incremental.load.load_matrixdef_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_matrixdef_national
(
matnum
,matrix
,pace_matrix
,dss_record_source
,dss_load_date
)
Select MATRIXDEF.MATNUM
,MATRIXDEF.MATRIX
,MATRIXDEF.PACE_MATRIX
,''
,''
From
SEEDPAK.MATRIXDEF MATRIXDEF;
UPDATE WSDataVault_dev_incremental.load.load_matrixdef_national SET dss_record_source = 'National.SEEDPAK.MATRIXDEF'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;