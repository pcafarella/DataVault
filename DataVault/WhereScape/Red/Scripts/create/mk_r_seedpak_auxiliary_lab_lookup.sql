CREATE TABLE WSDataVault_dev_incremental.ref.r_seedpak_auxiliary_lab_lookup (
  acctnum nvarchar(20) -- stage_seedpak_auxiliary_lab_lookup.acctnum 
, tzcode nvarchar(10) -- stage_seedpak_auxiliary_lab_lookup.tzcode 
 
, product_prefix nvarchar(5) -- stage_seedpak_auxiliary_lab_lookup.product_prefix 
, date_added datetime2 -- stage_seedpak_auxiliary_lab_lookup.date_added 
, last_date datetime2 -- stage_seedpak_auxiliary_lab_lookup.last_date 
, last_user nvarchar(20) -- stage_seedpak_auxiliary_lab_lookup.last_user 
, last_tool nvarchar(20) -- stage_seedpak_auxiliary_lab_lookup.last_tool 
 
, account_prefix nvarchar(5) -- stage_seedpak_auxiliary_lab_lookup.account_prefix 
 
, dss_record_source nvarchar(255) -- stage_seedpak_auxiliary_lab_lookup.dss_record_source 
, dss_load_date datetime2 -- stage_seedpak_auxiliary_lab_lookup.dss_load_date 
, dss_create_time datetime2 
) 
;


