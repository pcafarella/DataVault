CREATE TABLE WSDataVault_dev_incremental.raw.h_sample (
  hk_h_sample nchar(64) NOT NULL 
, sample_no nvarchar(50) 
, sample_no_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_sample ADD CONSTRAINT h_sample_9eb1ad61_idx_PK PRIMARY KEY CLUSTERED (hk_h_sample) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_sample_9eb1ad61_idx_A ON WSDataVault_dev_incremental.raw.h_sample (sample_no,sample_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);

