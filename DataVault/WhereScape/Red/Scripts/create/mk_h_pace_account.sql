CREATE TABLE WSDataVault_dev_incremental.raw.h_pace_account (
  hk_h_pace_account nchar(64) NOT NULL 
, pace_account_no nvarchar(50) 
, pace_account_no_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_pace_account ADD CONSTRAINT h_pace_accoun_4ae32278_idx_PK PRIMARY KEY CLUSTERED (hk_h_pace_account) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_pace_accoun_4ae32278_idx_A ON WSDataVault_dev_incremental.raw.h_pace_account (pace_account_no,pace_account_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);

