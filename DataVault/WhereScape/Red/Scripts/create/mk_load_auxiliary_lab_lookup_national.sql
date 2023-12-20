CREATE TABLE WSDataVault_dev_incremental.load.load_auxiliary_lab_lookup_national (
  acctnum nvarchar(20) -- AUXILIARY_LAB_LOOKUP.ACCTNUM 
, tzcode nvarchar(10) -- AUXILIARY_LAB_LOOKUP.TZCODE 
, product_prefix nvarchar(5) -- AUXILIARY_LAB_LOOKUP.PRODUCT_PREFIX 
, date_added datetime2 -- AUXILIARY_LAB_LOOKUP.DATE_ADDED 
, last_date datetime2 -- AUXILIARY_LAB_LOOKUP.LAST_DATE 
, last_user nvarchar(20) -- AUXILIARY_LAB_LOOKUP.LAST_USER 
, last_tool nvarchar(20) -- AUXILIARY_LAB_LOOKUP.LAST_TOOL 
, account_prefix nvarchar(5) -- AUXILIARY_LAB_LOOKUP.ACCOUNT_PREFIX 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


