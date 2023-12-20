CREATE TABLE WSDataVault_dev_incremental.stage.stage_seedpak_auxiliary_lab_lookup (
  acctnum nvarchar(20) -- load_auxiliary_lab_lookup_national.acctnum 
, tzcode nvarchar(10) -- load_auxiliary_lab_lookup_national.tzcode 
 
, product_prefix nvarchar(5) -- load_auxiliary_lab_lookup_national.product_prefix 
, date_added datetime2 -- load_auxiliary_lab_lookup_national.date_added 
, last_date datetime2 -- load_auxiliary_lab_lookup_national.last_date 
, last_user nvarchar(20) -- load_auxiliary_lab_lookup_national.last_user 
, last_tool nvarchar(20) -- load_auxiliary_lab_lookup_national.last_tool 
 
, account_prefix nvarchar(5) -- load_auxiliary_lab_lookup_national.account_prefix 
 
, dss_record_source nvarchar(255) -- load_auxiliary_lab_lookup_national.dss_record_source 
, dss_load_date datetime2 -- load_auxiliary_lab_lookup_national.dss_load_date 
, dss_create_time datetime2 
) 
;


