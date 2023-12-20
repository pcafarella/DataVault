CREATE TABLE WSDataVault_dev_incremental.raw.h_project (
  hk_h_project nchar(64) NOT NULL 
, project_no nvarchar(50) 
, project_no_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_project ADD CONSTRAINT h_project_b5ed0a42_idx_PK PRIMARY KEY CLUSTERED (hk_h_project) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_project_b5ed0a42_idx_A ON WSDataVault_dev_incremental.raw.h_project (project_no,project_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);

