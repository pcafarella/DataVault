CREATE TABLE WSDataVault_dev_incremental.stage.stage_record_tracking (
  key_value nvarchar(100) -- load_lims_audit_national.key_value 
, audit_table nvarchar(30) -- load_lims_audit_national.audit_table 
, audit_field nvarchar(30) -- load_lims_audit_national.audit_field 
, audit_action nvarchar(10) -- load_lims_audit_national.audit_action 
, old_value nvarchar(100) -- load_lims_audit_national.old_value 
, new_value nvarchar(100) -- load_lims_audit_national.new_value 
, audit_user nvarchar(30) -- load_lims_audit_national.audit_user 
, audit_date datetime2 -- load_lims_audit_national.audit_date 
, audit_tool nvarchar(30) -- load_lims_audit_national.audit_tool 
, dss_record_source nvarchar(255) -- load_lims_audit_national.dss_record_source 
, dss_load_date datetime2 -- load_lims_audit_national.dss_load_date 
, dss_create_time datetime2 
) 
;


