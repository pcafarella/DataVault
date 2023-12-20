CREATE TABLE WSDataVault_dev_incremental.stage.stage_product_parent_national (
  hk_l_product_parent nchar(64) NOT NULL 
, hk_h_product_parent_product_code nchar(64) NOT NULL 
, hk_h_product_product_code nchar(64) NOT NULL 
, product_code nvarchar(50) -- load_prodmast_national.prod 
, product_code_bkcc nvarchar(255) -- load_prodmast_national.matnum 
, product_code_tenant_id nvarchar(255) 
, parent_product_code nvarchar(50) -- load_prodmast_national.pprodref 
, parent_product_code_bkcc nvarchar(255) -- load_prodmast_national.pmatnumref 
, parent_product_code_tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) -- load_prodmast_national.dss_record_source 
, dss_load_date datetime2 -- load_prodmast_national.dss_load_date 
, dss_create_time datetime2 
) 
;


