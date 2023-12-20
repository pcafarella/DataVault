CREATE TABLE WSDataVault_dev_incremental.load.load_accountdef_national (
  acctnum nvarchar(50) -- ACCOUNTDEF.ACCTNUM 
, pace_acct_code nvarchar(40) -- ACCOUNTDEF.PACE_ACCT_CODE 
, acctname nvarchar(40) -- ACCOUNTDEF.ACCTNAME 
, acctfactor decimal(12,2) -- ACCOUNTDEF.ACCTFACTOR 
, lastdate datetime2 -- ACCOUNTDEF.LASTDATE 
, lasttool nvarchar(20) -- ACCOUNTDEF.LASTTOOL 
, lastuser nvarchar(20) -- ACCOUNTDEF.LASTUSER 
, mas90code nvarchar(7) -- ACCOUNTDEF.MAS90CODE 
, date_establishd datetime2 -- ACCOUNTDEF.DATE_ESTABLISHD 
, dso decimal(12,2) -- ACCOUNTDEF.DSO 
, customertype nvarchar(4) -- ACCOUNTDEF.CUSTOMERTYPE 
, creationdate datetime2 -- ACCOUNTDEF.CREATIONDATE 
, national_acct_flag nchar(1) -- ACCOUNTDEF.NATIONAL_ACCT_FLAG 
, exclude_scinfl nvarchar(2) -- ACCOUNTDEF.EXCLUDE_SCINFL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


