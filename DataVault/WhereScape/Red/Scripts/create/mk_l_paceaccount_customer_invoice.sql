CREATE TABLE WSDataVault_dev_incremental.raw.l_paceaccount_customer_invoice (
  hk_l_paceaccount_customer_invoice nchar(64) NOT NULL 
, hk_h_invoice nchar(64) NOT NULL 
, hk_h_pace_account nchar(64) NOT NULL 
, hk_h_customer nchar(64) NOT NULL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.l_paceaccount_customer_invoice ADD CONSTRAINT l_paceaccount_70d2cfa4_idx_PK PRIMARY KEY CLUSTERED (hk_l_paceaccount_customer_invoice) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE NONCLUSTERED INDEX l_paceaccount_70d2cfa4_idx_1 ON WSDataVault_dev_incremental.raw.l_paceaccount_customer_invoice (hk_h_invoice) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_paceaccount_70d2cfa4_idx_2 ON WSDataVault_dev_incremental.raw.l_paceaccount_customer_invoice (hk_h_pace_account) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_paceaccount_70d2cfa4_idx_3 ON WSDataVault_dev_incremental.raw.l_paceaccount_customer_invoice (hk_h_customer) WITH (SORT_IN_TEMPDB = OFF);

