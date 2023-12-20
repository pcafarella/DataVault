CREATE TABLE WSDataVault_dev_incremental.load.load_ext_cj3activerosterforit_vault (
 
  payroll_company_code nvarchar(64) -- ext_CJ3ActiveRosterforIT.payroll_company_code 
, legal_first_name nvarchar(16) -- ext_CJ3ActiveRosterforIT.legal_first_name 
, legal_last_name nvarchar(32) -- ext_CJ3ActiveRosterforIT.legal_last_name 
, file_number nvarchar(50) -- ext_CJ3ActiveRosterforIT.file_number 
 
, home_department_code nvarchar(50) -- ext_CJ3ActiveRosterforIT.home_department_code 
 
, home_department_description nvarchar(100) -- ext_CJ3ActiveRosterforIT.home_department_description 
 
, reports_to_legal_first_name nvarchar(16) -- ext_CJ3ActiveRosterforIT.reports_to_legal_first_name 
 
, reports_to_legal_last_name nvarchar(32) -- ext_CJ3ActiveRosterforIT.reports_to_legal_last_name 
 
, reports_to_file_number nvarchar(50) -- ext_CJ3ActiveRosterforIT.reports_to_file_number 
 
, business_unit_description VARCHAR(100) NOT NULL -- ext_CJ3ActiveRosterforIT.business_unit_description 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
) 
;


