CREATE TABLE WSDataVault_dev_incremental.load.load_prodmast_national (
  matnum nvarchar(50) -- PRODMAST.MATNUM 
, prod nvarchar(100) -- PRODMAST.PROD 
, class nvarchar(1) -- PRODMAST.CLASS 
, pprodref nvarchar(50) -- PRODMAST.PPRODREF 
, pmatnumref nvarchar(255) -- PRODMAST.PMATNUMREF 
, description nvarchar(255) -- PRODMAST.DESCRIPTION 
, methodref nvarchar(100) -- PRODMAST.METHODREF 
, holddays decimal(12,2) -- PRODMAST.HOLDDAYS 
, holdflg nvarchar(1) -- PRODMAST.HOLDFLG 
, duedays decimal(12,2) -- PRODMAST.DUEDAYS 
, factorflg nvarchar(1) -- PRODMAST.FACTORFLG 
, containertype nvarchar(20) -- PRODMAST.CONTAINERTYPE 
, bottles decimal(12,2) -- PRODMAST.BOTTLES 
, lastdate datetime2 -- PRODMAST.LASTDATE 
, lasttool nvarchar(20) -- PRODMAST.LASTTOOL 
, lastuser nvarchar(20) -- PRODMAST.LASTUSER 
, costcenter nvarchar(4) -- PRODMAST.COSTCENTER 
, phasecode smallint -- PRODMAST.PHASECODE 
, auto_anrev_flag nvarchar(1) -- PRODMAST.AUTO_ANREV_FLAG 
, expiredate datetime2 -- PRODMAST.EXPIREDATE 
, dss_record_source nvarchar(255) 
, dss_load_date datetime 
) 
;


