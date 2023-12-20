CREATE TABLE WSDataVault_dev_incremental.stage.stage_customer_paceaccount_national (
  hk_l_customer_paceaccount nchar(64) NOT NULL 
, hk_h_pace_account nchar(64) NOT NULL 
, hk_h_customer nchar(64) NOT NULL 
, account_no nvarchar(50) -- load_accountdef_national.acctnum 
, account_no_bkcc nvarchar(255) 
, account_no_tenant_id nvarchar(255) 
, pace_account_no nvarchar(50) -- load_accountdef_national.pace_acct_code 
, pace_account_no_bkcc nvarchar(255) 
, pace_account_no_tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) -- load_accountdef_national.dss_record_source 
, dss_load_date datetime2 -- load_accountdef_national.dss_load_date 
, dss_create_time datetime2 
) 
;


