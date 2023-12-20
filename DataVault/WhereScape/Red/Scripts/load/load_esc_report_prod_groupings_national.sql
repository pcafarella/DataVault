Truncate table WSDataVault_dev_incremental.load.load_esc_report_prod_groupings_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_esc_report_prod_groupings_national
(
grouping_name
,group_name
,prod
,matrix
,description
,client_description
,dss_record_source
,dss_load_date
)
Select ESC_REPORT_PROD_GROUPINGS.GROUPING_NAME
,ESC_REPORT_PROD_GROUPINGS.GROUP_NAME
,ESC_REPORT_PROD_GROUPINGS.PROD
,ESC_REPORT_PROD_GROUPINGS.MATRIX
,ESC_REPORT_PROD_GROUPINGS.DESCRIPTION
,ESC_REPORT_PROD_GROUPINGS.CLIENT_DESCRIPTION
,''
,''
From
SEEDPAK.ESC_REPORT_PROD_GROUPINGS ESC_REPORT_PROD_GROUPINGS;
UPDATE WSDataVault_dev_incremental.load.load_esc_report_prod_groupings_national SET dss_record_source = 'National.SEEDPAK.ESC_REPORT_PROD_GROUPINGS'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;