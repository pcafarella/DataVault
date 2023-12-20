CREATE TABLE WSDataVault_dev_incremental.raw.h_customer (
  hk_h_customer nchar(64) NOT NULL 
, account_no nvarchar(50) 
, account_no_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_customer ADD CONSTRAINT h_customer_675ca5d5_idx_PK PRIMARY KEY CLUSTERED (hk_h_customer) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_customer_675ca5d5_idx_A ON WSDataVault_dev_incremental.raw.h_customer (account_no,account_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);

