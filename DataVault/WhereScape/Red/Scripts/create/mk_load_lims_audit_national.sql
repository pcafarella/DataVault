CREATE TABLE WSDataVault_dev_incremental.load.load_lims_audit_national (
  key_value nvarchar(100) -- LIMS_AUDIT.KEY_VALUE 
, audit_table nvarchar(30) -- LIMS_AUDIT.AUDIT_TABLE 
, audit_field nvarchar(30) -- LIMS_AUDIT.AUDIT_FIELD 
, audit_action nvarchar(10) -- LIMS_AUDIT.AUDIT_ACTION 
, old_value nvarchar(100) -- LIMS_AUDIT.OLD_VALUE 
, new_value nvarchar(100) -- LIMS_AUDIT.NEW_VALUE 
, audit_user nvarchar(30) -- LIMS_AUDIT.AUDIT_USER 
, audit_date datetime2 -- LIMS_AUDIT.AUDIT_DATE 
, audit_tool nvarchar(30) -- LIMS_AUDIT.AUDIT_TOOL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


