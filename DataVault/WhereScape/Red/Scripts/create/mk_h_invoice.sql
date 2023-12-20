CREATE TABLE WSDataVault_dev_incremental.raw.h_invoice (
  hk_h_invoice nchar(64) NOT NULL 
, invoice_no nvarchar(50) 
, invoice_no_bkcc nvarchar(255) 
, tenant_id nvarchar(15) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_invoice ADD CONSTRAINT h_invoice_3d330256_idx_PK PRIMARY KEY CLUSTERED (hk_h_invoice) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_invoice_3d330256_idx_A ON WSDataVault_dev_incremental.raw.h_invoice (invoice_no,invoice_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);

