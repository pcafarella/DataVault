CREATE TABLE WSDataVault_dev_incremental.raw.l_customer_paceaccount (
  hk_l_customer_paceaccount nchar(64) NOT NULL 
, hk_h_pace_account nchar(64) NOT NULL 
, hk_h_customer nchar(64) NOT NULL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.l_customer_paceaccount ADD CONSTRAINT l_customer_pa_d89813cc_idx_PK PRIMARY KEY CLUSTERED (hk_l_customer_paceaccount) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE NONCLUSTERED INDEX l_customer_pa_d89813cc_idx_1 ON WSDataVault_dev_incremental.raw.l_customer_paceaccount (hk_h_pace_account) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_customer_pa_d89813cc_idx_2 ON WSDataVault_dev_incremental.raw.l_customer_paceaccount (hk_h_customer) WITH (SORT_IN_TEMPDB = OFF);

