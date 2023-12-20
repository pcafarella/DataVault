CREATE TABLE WSDataVault_dev_incremental.stage.stage_test_national (
  hk_h_test nchar(64) NOT NULL 
, test_no nvarchar(4000) -- load_ordermast_national.samplenum 
, test_no_bkcc nvarchar(255) -- load_ordermast_national.matnum 
, tenant_id nvarchar(255) 
, price decimal(12,2) -- load_ordermast_national.price 
, surcharge decimal(12,2) -- load_ordermast_national.factor 
, pkey nvarchar(20) -- load_ordermast_national.pkey 
, plevel decimal(12,2) -- load_ordermast_national.plevel 
, pprodref nvarchar(20) -- load_ordermast_national.pprodref 
, pmatnumref nvarchar(4) -- load_ordermast_national.pmatnumref 
, class nvarchar(1) -- load_ordermast_national.class 
, cost decimal(12,2) -- load_ordermast_national.cost 
, holddate datetime2 -- load_ordermast_national.holddate 
, holddays decimal(12,2) -- load_ordermast_national.holddays 
, holdflg nvarchar(1) -- load_ordermast_national.holdflg 
, duedate datetime2 -- load_ordermast_national.duedate 
, duedays decimal(12,2) -- load_ordermast_national.duedays 
, location nvarchar(20) -- load_ordermast_national.location 
, bottles decimal(12,2) -- load_ordermast_national.bottles 
, lastdate datetime2 -- load_ordermast_national.lastdate 
, lasttool nvarchar(20) -- load_ordermast_national.lasttool 
, lastuser nvarchar(20) -- load_ordermast_national.lastuser 
, designid nvarchar(10) -- load_ordermast_national.designid 
, comp nvarchar(10) -- load_ordermast_national.comp 
, dss_change_hash_test_mroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_ordermast_national.dss_record_source 
, dss_load_date datetime2 -- load_ordermast_national.dss_load_date 
, dss_create_time datetime2 
) 
;


