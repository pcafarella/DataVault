CREATE TABLE WSDataVault_dev_incremental.load.load_adp_supervisor_department_masterdata (
 
  supervisor_full_name nvarchar(50) -- adp_supervisor_department.[Supervisor Full Name] 
 
, supervisor_file_number nvarchar(50) -- adp_supervisor_department.[Supervisor File Number] 
, adj_department nvarchar(50) -- adp_supervisor_department.[Adj Department] 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


