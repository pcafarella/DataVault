CREATE TABLE WSDataVault_dev_incremental.stage.stage_pace_account_national (
  hk_h_pace_account nchar(64) NOT NULL 
, pace_account_no nvarchar(50) -- load_accountdef_national.pace_acct_code 
, pace_account_no_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) -- load_accountdef_national.dss_record_source 
, dss_load_date datetime2 -- load_accountdef_national.dss_load_date 
, dss_create_time datetime2 
) 
;


