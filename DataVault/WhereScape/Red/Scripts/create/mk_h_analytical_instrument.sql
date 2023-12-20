CREATE TABLE WSDataVault_dev_incremental.raw.h_analytical_instrument (
  hk_h_analytical_instrument nchar(64) NOT NULL 
, instrument_no nvarchar(50) 
, instrument_no_bkcc nvarchar(50) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX h_analytical__f5290e77_idx_A ON WSDataVault_dev_incremental.raw.h_analytical_instrument (instrument_no,instrument_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
ALTER TABLE WSDataVault_dev_incremental.raw.h_analytical_instrument ADD CONSTRAINT h_analytical__f5290e77_idx_PK PRIMARY KEY NONCLUSTERED (hk_h_analytical_instrument) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

