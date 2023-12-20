CREATE TABLE WSDataVault_dev_incremental.ref.r_seedpak_methods (
  methodref nvarchar(40) -- stage_seedpak_methods.methodref 
, description nvarchar(80) -- stage_seedpak_methods.description 
, dss_record_source nvarchar(255) -- stage_seedpak_methods.dss_record_source 
, dss_load_date datetime2 -- stage_seedpak_methods.dss_load_date 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX r_seedpak_met_a7ee0c2f_idx_A ON WSDataVault_dev_incremental.ref.r_seedpak_methods (methodref) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON);

