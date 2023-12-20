CREATE TABLE WSDataVault_dev_incremental.load.load_esc_report_prod_groupings_national (
  grouping_name nvarchar(40) -- ESC_REPORT_PROD_GROUPINGS.GROUPING_NAME 
, group_name nvarchar(256) -- ESC_REPORT_PROD_GROUPINGS.GROUP_NAME 
, prod nvarchar(20) -- ESC_REPORT_PROD_GROUPINGS.PROD 
, matrix nvarchar(12) -- ESC_REPORT_PROD_GROUPINGS.MATRIX 
, description nvarchar(256) -- ESC_REPORT_PROD_GROUPINGS.DESCRIPTION 
 
, client_description nvarchar(256) -- ESC_REPORT_PROD_GROUPINGS.CLIENT_DESCRIPTION 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


