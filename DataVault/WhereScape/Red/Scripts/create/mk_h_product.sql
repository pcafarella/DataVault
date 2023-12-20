CREATE TABLE WSDataVault_dev_incremental.raw.h_product (
  hk_h_product nchar(64) NOT NULL 
, product_code nvarchar(100) 
, product_code_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_product ADD CONSTRAINT h_product_b5ea8c18_idx_PK PRIMARY KEY CLUSTERED (hk_h_product) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_product_b5ea8c18_idx_A ON WSDataVault_dev_incremental.raw.h_product (product_code,product_code_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);

