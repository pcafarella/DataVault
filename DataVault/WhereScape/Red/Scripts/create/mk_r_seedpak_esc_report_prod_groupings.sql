CREATE TABLE WSDataVault_dev_incremental.ref.r_seedpak_esc_report_prod_groupings (
  prod nvarchar(20) -- stage_seedpak_esc_report_prod_groupings.prod 
, matrix nvarchar(12) -- stage_seedpak_esc_report_prod_groupings.matrix 
 
, grouping_name nvarchar(40) -- stage_seedpak_esc_report_prod_groupings.grouping_name 
, group_name nvarchar(256) -- stage_seedpak_esc_report_prod_groupings.group_name 
 
, description nvarchar(256) -- stage_seedpak_esc_report_prod_groupings.description 
 
, client_description nvarchar(256) -- stage_seedpak_esc_report_prod_groupings.client_description 
 
, dss_record_source nvarchar(255) -- stage_seedpak_esc_report_prod_groupings.dss_record_source 
 
, dss_load_date datetime2 -- stage_seedpak_esc_report_prod_groupings.dss_load_date 
, dss_create_time datetime2 
) 
;


