CREATE TABLE WSDataVault_dev_incremental.load.load_ordermast_national (
  samplenum nvarchar(4000) -- ORDERMAST.SAMPLENUM 
, matnum nvarchar(255) -- ORDERMAST.MATNUM 
, prod nvarchar(20) -- ORDERMAST.PROD 
, pkey nvarchar(20) -- ORDERMAST.PKEY 
, plevel decimal(12,2) -- ORDERMAST.PLEVEL 
, pprodref nvarchar(20) -- ORDERMAST.PPRODREF 
, pmatnumref nvarchar(10) -- ORDERMAST.PMATNUMREF 
, class nvarchar(1) -- ORDERMAST.CLASS 
, price decimal(12,2) -- ORDERMAST.PRICE 
, cost decimal(12,2) -- ORDERMAST.COST 
, factor decimal(12,2) -- ORDERMAST.FACTOR 
, holddate datetime2 -- ORDERMAST.HOLDDATE 
, holddays decimal(12,2) -- ORDERMAST.HOLDDAYS 
, holdflg nvarchar(1) -- ORDERMAST.HOLDFLG 
, duedate datetime2 -- ORDERMAST.DUEDATE 
, duedays decimal(12,2) -- ORDERMAST.DUEDAYS 
, location nvarchar(20) -- ORDERMAST.LOCATION 
, bottles decimal(12,2) -- ORDERMAST.BOTTLES 
, lastdate datetime2 -- ORDERMAST.LASTDATE 
, lasttool nvarchar(20) -- ORDERMAST.LASTTOOL 
, lastuser nvarchar(20) -- ORDERMAST.LASTUSER 
, designid nvarchar(10) -- ORDERMAST.DESIGNID 
, comp nvarchar(10) -- ORDERMAST.COMP 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


