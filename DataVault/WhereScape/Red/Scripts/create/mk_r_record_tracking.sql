CREATE TABLE WSDataVault_dev_incremental.ref.r_record_tracking (
  key_value nvarchar(100) -- stage_record_tracking.key_value 
, audit_table nvarchar(30) -- stage_record_tracking.audit_table 
, audit_field nvarchar(30) -- stage_record_tracking.audit_field 
, audit_action nvarchar(10) -- stage_record_tracking.audit_action 
, old_value nvarchar(100) -- stage_record_tracking.old_value 
, new_value nvarchar(100) -- stage_record_tracking.new_value 
, audit_user nvarchar(30) -- stage_record_tracking.audit_user 
, audit_date datetime2 -- stage_record_tracking.audit_date 
, audit_tool nvarchar(30) -- stage_record_tracking.audit_tool 
, dss_record_source nvarchar(255) -- stage_record_tracking.dss_record_source 
, dss_load_date datetime2 -- stage_record_tracking.dss_load_date 
, dss_create_time datetime2 
) 
;

CREATE NONCLUSTERED INDEX r_record_trac_5f556118_idx_x ON WSDataVault_dev_incremental.ref.r_record_tracking (audit_action,audit_table,key_value) WITH (SORT_IN_TEMPDB = OFF);

