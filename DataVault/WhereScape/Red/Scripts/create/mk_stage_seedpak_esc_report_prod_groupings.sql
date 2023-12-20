CREATE TABLE WSDataVault_dev_incremental.stage.stage_seedpak_esc_report_prod_groupings (
  prod nvarchar(20) -- load_esc_report_prod_groupings_national.prod 
, matrix nvarchar(12) -- load_esc_report_prod_groupings_national.matrix 
 
, grouping_name nvarchar(40) -- load_esc_report_prod_groupings_national.grouping_name 
, group_name nvarchar(256) -- load_esc_report_prod_groupings_national.group_name 
 
, description nvarchar(256) -- load_esc_report_prod_groupings_national.description 
 
, client_description nvarchar(256) -- load_esc_report_prod_groupings_national.client_description 
 
, dss_record_source nvarchar(255) -- load_esc_report_prod_groupings_national.dss_record_source 
 
, dss_load_date datetime2 -- load_esc_report_prod_groupings_national.dss_load_date 
, dss_create_time datetime2 
) 
;


