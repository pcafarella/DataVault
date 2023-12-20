CREATE TABLE WSDataVault_dev_incremental.load.load_projectdef_national (
  acctnum nvarchar(255) -- PROJECTDEF.ACCTNUM 
, projectnum nvarchar(50) -- PROJECTDEF.PROJECTNUM 
, description nvarchar(100) -- PROJECTDEF.DESCRIPTION 
, startdate datetime2 -- PROJECTDEF.STARTDATE 
, stopdate datetime2 -- PROJECTDEF.STOPDATE 
, ponumber nvarchar(50) -- PROJECTDEF.PONUMBER 
, site nvarchar(255) -- PROJECTDEF.SITE 
, manager nvarchar(30) -- PROJECTDEF.MANAGER 
, projref nvarchar(max) -- PROJECTDEF.PROJREF 
, sales1code nvarchar(4) -- PROJECTDEF.SALES1CODE 
, sales1plan nvarchar(4) -- PROJECTDEF.SALES1PLAN 
, sales2code nvarchar(4) -- PROJECTDEF.SALES2CODE 
, sales2plan nvarchar(4) -- PROJECTDEF.SALES2PLAN 
, termcode nvarchar(10) -- PROJECTDEF.TERMCODE 
, lastdate datetime2 -- PROJECTDEF.LASTDATE 
, lasttool nvarchar(20) -- PROJECTDEF.LASTTOOL 
, lastuser nvarchar(20) -- PROJECTDEF.LASTUSER 
, locator nvarchar(50) -- PROJECTDEF.LOCATOR 
, permitnum nvarchar(100) -- PROJECTDEF.PERMITNUM 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


