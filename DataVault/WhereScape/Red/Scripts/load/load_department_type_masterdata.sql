Truncate table WSDataVault_dev_incremental.load.load_department_type_masterdata;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_department_type_masterdata
(
department_no
,department_name
,department_short_name
,department_type
,tenant_id
,department_level
,dss_record_source
,dss_load_date
)
Select department_type.department_no
,department_type.department_name
,department_type.department_short_name
,department_type.department_type
,department_type.tenant_id
,department_type.department_level
,''
,''
From
[Analytical_MasterData].dbo.department_type department_type;
UPDATE WSDataVault_dev_incremental.load.load_department_type_masterdata SET dss_record_source = 'MasterData.dbo.department_type'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;