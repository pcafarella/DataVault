CREATE TABLE WSDataVault_dev_incremental.raw.l_test_product (
  hk_l_test_product nchar(64) NOT NULL 
, hk_h_product nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.l_test_product ADD CONSTRAINT l_test_produc_6d077f35_idx_PK PRIMARY KEY CLUSTERED (hk_l_test_product) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE NONCLUSTERED INDEX l_test_produc_6d077f35_idx_1 ON WSDataVault_dev_incremental.raw.l_test_product (hk_h_product) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_test_produc_6d077f35_idx_2 ON WSDataVault_dev_incremental.raw.l_test_product (hk_h_test) WITH (SORT_IN_TEMPDB = OFF);

