CREATE TABLE WSDataVault_dev_incremental.raw.h_test (
  hk_h_test nchar(64) NOT NULL 
, test_no nvarchar(4000) 
, test_no_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_test ADD CONSTRAINT h_test_b6e8fe09_idx_PK PRIMARY KEY CLUSTERED (hk_h_test) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_test_b6e8fe09_idx_A ON WSDataVault_dev_incremental.raw.h_test (test_no,test_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);

