CREATE TABLE WSDataVault_dev_incremental.raw.l_test_sample (
  hk_l_test_sample nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, hk_h_sample nchar(64) NOT NULL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.l_test_sample ADD CONSTRAINT l_test_sample_6acb62a4_idx_PK PRIMARY KEY CLUSTERED (hk_l_test_sample) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE NONCLUSTERED INDEX l_test_sample_6acb62a4_idx_1 ON WSDataVault_dev_incremental.raw.l_test_sample (hk_h_test) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_test_sample_6acb62a4_idx_2 ON WSDataVault_dev_incremental.raw.l_test_sample (hk_h_sample) WITH (SORT_IN_TEMPDB = OFF);

