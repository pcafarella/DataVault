CREATE TABLE WSDataVault_dev_incremental.stage.stage_product_national (
  hk_h_product nchar(64) NOT NULL 
, product_code nvarchar(100) -- load_prodmast_national.prod 
, product_code_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, method nvarchar(100) -- load_prodmast_national.methodref 
, matrix nvarchar(50) -- load_prodmast_national.matnum 
, listtype nvarchar(50) -- load_listlink_national.listtype 
, description nvarchar(255) -- load_prodmast_national.description 
, class nvarchar(1) -- load_prodmast_national.class 
, holddays decimal(12,2) -- load_prodmast_national.holddays 
, holdflg nvarchar(1) -- load_prodmast_national.holdflg 
, duedays decimal(12,2) -- load_prodmast_national.duedays 
, factorflg nvarchar(1) -- load_prodmast_national.factorflg 
, containertype nvarchar(20) -- load_prodmast_national.containertype 
, bottles decimal(12,2) -- load_prodmast_national.bottles 
, lastdate datetime2 -- load_prodmast_national.lastdate 
, lasttool nvarchar(20) -- load_prodmast_national.lasttool 
, lastuser nvarchar(20) -- load_prodmast_national.lastuser 
, costcenter nvarchar(4) -- load_prodmast_national.costcenter 
, phasecode smallint -- load_prodmast_national.phasecode 
, auto_anrev_flag nvarchar(1) -- load_prodmast_national.auto_anrev_flag 
, dss_change_hash_product_mroc_national nchar(64) NOT NULL 
, dss_record_source nvarchar(255) -- load_listlink_national.dss_record_source 
, dss_load_date datetime2 -- load_listlink_national.dss_load_date 
, dss_create_time datetime2 
) 
;


