CREATE TABLE WSDataVault_dev_incremental.load.load_vw_sdg_details_national (
  loginnum nvarchar(50) -- VW_SDG_DETAILS.LOGINNUM 
, sdgid nvarchar(50) -- VW_SDG_DETAILS.SDGID 
, receivedate datetime2 -- VW_SDG_DETAILS.RECEIVEDATE 
, acctnum nvarchar(50) -- VW_SDG_DETAILS.ACCTNUM 
, projectnum nvarchar(255) -- VW_SDG_DETAILS.PROJECTNUM 
, site nvarchar(50) -- VW_SDG_DETAILS.SITE 
, locator nvarchar(20) -- VW_SDG_DETAILS.LOCATOR 
, description nvarchar(60) -- VW_SDG_DETAILS.DESCRIPTION 
, status nvarchar(50) -- VW_SDG_DETAILS.STATUS 
, report_complete nchar(50) -- VW_SDG_DETAILS.REPORT_COMPLETE 
, tsr nvarchar(4) -- VW_SDG_DETAILS.TSR 
, first_login_seq decimal(12,2) -- VW_SDG_DETAILS.FIRST_LOGIN_SEQ 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


