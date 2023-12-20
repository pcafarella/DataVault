CREATE TABLE WSDataVault_dev_incremental.raw.h_personnel (
  hk_h_personnel nchar(64) NOT NULL -- stage_personnel.hk_h_personnel 
, personnel_no nvarchar(50) -- stage_personnel.personnel_no 
, personnel_no_bkcc nvarchar(50) -- stage_personnel.personnel_no_bkcc 
, tenant_id nvarchar(50) -- stage_personnel.tenant_id 
, dss_record_source nvarchar(255) -- stage_personnel.dss_record_source 
, dss_load_date datetime2 -- stage_personnel.dss_load_date 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_personnel ADD CONSTRAINT h_personnel_57046b09_idx_PK PRIMARY KEY NONCLUSTERED (hk_h_personnel) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_personnel_57046b09_idx_A ON WSDataVault_dev_incremental.raw.h_personnel (personnel_no,personnel_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);

