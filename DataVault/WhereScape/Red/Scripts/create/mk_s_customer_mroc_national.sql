CREATE TABLE WSDataVault_dev_incremental.raw.s_customer_mroc_national (
  hk_h_customer nchar(64) NOT NULL -- stage_customer_national.hk_h_customer 
, acctname nvarchar(40) -- stage_customer_national.acctname 
, acctfactor decimal(12,2) -- stage_customer_national.acctfactor 
, lastdate datetime2 -- stage_customer_national.lastdate 
, lasttool nvarchar(20) -- stage_customer_national.lasttool 
, lastuser nvarchar(20) -- stage_customer_national.lastuser 
, mas90code nvarchar(7) -- stage_customer_national.mas90code 
, date_establishd datetime2 -- stage_customer_national.date_establishd 
, dso decimal(12,2) -- stage_customer_national.dso 
, customertype nvarchar(4) -- stage_customer_national.customertype 
, creationdate datetime2 -- stage_customer_national.creationdate 
, national_acct_flag nchar(1) -- stage_customer_national.national_acct_flag 
, active nvarchar(1) -- stage_customer_national.active 
, sample_state nvarchar(2) -- stage_customer_national.sample_state 
, buyer_type nvarchar(20) -- stage_customer_national.buyer_type 
, market_segment nvarchar(20) -- stage_customer_national.market_segment 
, industry_sector nvarchar(20) -- stage_customer_national.industry_sector 
 
, pace_excludeinflation nvarchar(2) -- stage_customer_national.pace_excludeinflation 
 
, dss_change_hash nchar(64) NOT NULL -- stage_customer_national.dss_change_hash_customer_mroc_national 
, dss_record_source nvarchar(255) -- stage_customer_national.dss_record_source 
, dss_load_date datetime2 -- stage_customer_national.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE CLUSTERED INDEX s_customer_mr_ac8cc3a3_idx_PK ON WSDataVault_dev_incremental.raw.s_customer_mroc_national (hk_h_customer,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX s_customer_mr_ac8cc3a3_idx_CK ON WSDataVault_dev_incremental.raw.s_customer_mroc_national (hk_h_customer,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

