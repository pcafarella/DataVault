Truncate table WSDataVault_dev_incremental.load.load_SSISRedTest;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_SSISRedTest
(
organization
,f3
,gl_code
,location
,descr
,indicator
,dss_record_source
,dss_load_date
)
Select ''
,''
,''
,''
,''
,''
,''
,''
From
;
UPDATE WSDataVault_dev_incremental.load.load_SSISRedTest SET dss_record_source = 'unknown source'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;