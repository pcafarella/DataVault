CREATE TABLE WSDataVault_dev_incremental.raw.h_analysis_process (
  hk_h_analysis_process nchar(64) NOT NULL 
, analysis_process_code nvarchar(50) 
, analysis_process_code_bkcc nvarchar(50) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX h_analysis_pr_dfd79b03_idx_A ON WSDataVault_dev_incremental.raw.h_analysis_process (analysis_process_code,analysis_process_code_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);
ALTER TABLE WSDataVault_dev_incremental.raw.h_analysis_process ADD CONSTRAINT h_analysis_pr_dfd79b03_idx_PK PRIMARY KEY NONCLUSTERED (hk_h_analysis_process) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

