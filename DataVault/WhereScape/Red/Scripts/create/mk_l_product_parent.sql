CREATE TABLE WSDataVault_dev_incremental.raw.l_product_parent (
  hk_l_product_parent nchar(64) NOT NULL 
, hk_h_product_parent_product_code nchar(64) NOT NULL 
, hk_h_product_product_code nchar(64) NOT NULL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.l_product_parent ADD CONSTRAINT l_product_par_7cdea62d_idx_PK PRIMARY KEY CLUSTERED (hk_l_product_parent) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE NONCLUSTERED INDEX l_product_par_7cdea62d_idx_1 ON WSDataVault_dev_incremental.raw.l_product_parent (hk_h_product_parent_product_code) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_product_par_7cdea62d_idx_2 ON WSDataVault_dev_incremental.raw.l_product_parent (hk_h_product_product_code) WITH (SORT_IN_TEMPDB = OFF);

