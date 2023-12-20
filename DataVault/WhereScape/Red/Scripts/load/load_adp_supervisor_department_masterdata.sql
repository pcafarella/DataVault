Truncate table WSDataVault_dev_incremental.load.load_adp_supervisor_department_masterdata;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_adp_supervisor_department_masterdata
(
supervisor_full_name
,supervisor_file_number
,adj_department
,dss_record_source
,dss_load_date
)
Select adp_supervisor_department.[Supervisor Full Name]
,adp_supervisor_department.[Supervisor File Number]
,adp_supervisor_department.[Adj Department]
,''
,''
From
[Analytical_MasterData].dbo.adp_supervisor_department adp_supervisor_department;
UPDATE WSDataVault_dev_incremental.load.load_adp_supervisor_department_masterdata SET dss_record_source = 'MasterData.dbo.adp_supervisor_department'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;