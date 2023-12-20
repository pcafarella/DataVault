CREATE TABLE WSDataVault_dev_incremental.raw.h_department (
  hk_h_department nchar(64) NOT NULL 
, department_no nvarchar(50) 
, department_no_bkcc nvarchar(50) 
, tenant_id nvarchar(50) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_department ADD CONSTRAINT h_department_9397c789_idx_PK PRIMARY KEY CLUSTERED (hk_h_department) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_department_9397c789_idx_A ON WSDataVault_dev_incremental.raw.h_department (department_no,department_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON);

