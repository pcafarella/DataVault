CREATE TABLE WSDataVault_dev_incremental.raw.s_personnel_lroc (
  hk_h_personnel nchar(64) NOT NULL -- stage_personnel.hk_h_personnel 
, first_name nvarchar(16) -- stage_personnel.first_name 
, last_name nvarchar(32) -- stage_personnel.last_name 
 
, dss_change_hash nchar(64) NOT NULL -- stage_personnel.dss_change_hash_personnel_lroc 
, dss_record_source nvarchar(255) -- stage_personnel.dss_record_source 
, dss_load_date datetime2 -- stage_personnel.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
, business_unit varchar(100) -- stage_personnel.business_unit 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX s_personnel_l_c81425e5_idx_CK ON WSDataVault_dev_incremental.raw.s_personnel_lroc (hk_h_personnel,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_personnel_l_c81425e5_idx_PK ON WSDataVault_dev_incremental.raw.s_personnel_lroc (hk_h_personnel,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

