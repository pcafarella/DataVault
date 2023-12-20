CREATE TABLE WSDataVault_dev_incremental.raw.l_department_test_status (
  hk_l_department_test_status nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, process_status_code nvarchar(4) 
, process_status_date datetime2 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.l_department_test_status ADD CONSTRAINT l_department__23d4fc05_idx_PK PRIMARY KEY CLUSTERED (hk_l_department_test_status) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_department__23d4fc05_idx_1 ON WSDataVault_dev_incremental.raw.l_department_test_status (hk_h_test) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_department__23d4fc05_idx_2 ON WSDataVault_dev_incremental.raw.l_department_test_status (hk_h_department) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX l_department__23d4fc05_idx_A ON WSDataVault_dev_incremental.raw.l_department_test_status (process_status_code,process_status_date,hk_h_test,hk_h_department) WITH (SORT_IN_TEMPDB = OFF);

