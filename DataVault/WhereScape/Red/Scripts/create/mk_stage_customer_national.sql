CREATE TABLE WSDataVault_dev_incremental.stage.stage_customer_national (
  hk_h_customer nchar(64) NOT NULL 
, account_no nvarchar(50) -- load_accountdef_national.acctnum 
, account_no_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, acctname nvarchar(40) -- load_accountdef_national.acctname 
, acctfactor decimal(12,2) -- load_accountdef_national.acctfactor 
, lastdate datetime2 -- load_accountdef_national.lastdate 
, lasttool nvarchar(20) -- load_accountdef_national.lasttool 
, lastuser nvarchar(20) -- load_accountdef_national.lastuser 
, mas90code nvarchar(7) -- load_accountdef_national.mas90code 
, date_establishd datetime2 -- load_accountdef_national.date_establishd 
, dso decimal(12,2) -- load_accountdef_national.dso 
, customertype nvarchar(4) -- load_accountdef_national.customertype 
, creationdate datetime2 -- load_accountdef_national.creationdate 
, national_acct_flag nchar(1) -- load_accountdef_national.national_acct_flag 
, active nvarchar(1) -- load_clients_national.active 
, sample_state nvarchar(2) -- load_clients_national.sample_state 
, buyer_type nvarchar(20) -- load_clients_national.buyer_type 
, market_segment nvarchar(20) -- load_clients_national.market_segment 
, industry_sector nvarchar(20) -- load_clients_national.industry_sector 
, pace_excludeinflation nvarchar(2) -- load_accountdef_national.exclude_scinfl 
, dss_change_hash_customer_mroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_clients_national.dss_record_source 
, dss_load_date datetime2 -- load_clients_national.dss_load_date 
, dss_create_time datetime2 
) 
;


