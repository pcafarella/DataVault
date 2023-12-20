CREATE TABLE WSDataVault_dev_incremental.raw.s_test_hroc_national (
  hk_h_test nchar(64) NOT NULL -- stage_test_national.hk_h_test 
, price decimal(12,2) -- stage_test_national.price 
, surcharge decimal(12,2) -- stage_test_national.surcharge 
, pkey nvarchar(20) -- stage_test_national.pkey 
, plevel decimal(12,2) -- stage_test_national.plevel 
, pprodref nvarchar(20) -- stage_test_national.pprodref 
, pmatnumref nvarchar(4) -- stage_test_national.pmatnumref 
, class nvarchar(1) -- stage_test_national.class 
, cost decimal(12,2) -- stage_test_national.cost 
, holddate datetime2 -- stage_test_national.holddate 
, holddays decimal(12,2) -- stage_test_national.holddays 
, holdflg nvarchar(1) -- stage_test_national.holdflg 
, duedate datetime2 -- stage_test_national.duedate 
, duedays decimal(12,2) -- stage_test_national.duedays 
, location nvarchar(20) -- stage_test_national.location 
, bottles decimal(12,2) -- stage_test_national.bottles 
, lastdate datetime2 -- stage_test_national.lastdate 
, lasttool nvarchar(20) -- stage_test_national.lasttool 
, lastuser nvarchar(20) -- stage_test_national.lastuser 
, designid nvarchar(10) -- stage_test_national.designid 
, comp nvarchar(10) -- stage_test_national.comp 
 
, dss_change_hash nchar(64) NOT NULL -- stage_test_national.dss_change_hash_test_hroc_national 
, dss_record_source nvarchar(255) -- stage_test_national.dss_record_source 
, dss_load_date datetime2 -- stage_test_national.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE CLUSTERED INDEX s_test_hroc_n_fb84a2d2_idx_PK ON WSDataVault_dev_incremental.raw.s_test_hroc_national (hk_h_test,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX s_test_hroc_n_fb84a2d2_idx_CK ON WSDataVault_dev_incremental.raw.s_test_hroc_national (hk_h_test,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

