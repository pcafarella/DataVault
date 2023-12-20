CREATE TABLE WSDataVault_dev_incremental.raw.l_personnel_department_hours (
 
  hk_l_personnel_department_hours nchar(64) NOT NULL -- stage_personnel_department_hours.hk_l_personnel_department_hours 
 
, hk_h_department nchar(64) NOT NULL -- stage_personnel_department_hours.hk_h_department 
 
, hk_h_personnel nchar(64) NOT NULL -- stage_personnel_department_hours.hk_h_personnel 
, date_worked datetime2 -- stage_personnel_department_hours.date_worked 
, payroll_name nvarchar(64) -- stage_personnel_department_hours.payroll_name 
, pay_code nvarchar(32) -- stage_personnel_department_hours.pay_code 
 
, dss_record_source nvarchar(255) -- stage_personnel_department_hours.dss_record_source 
, dss_load_date datetime2 -- stage_personnel_department_hours.dss_load_date 
, dss_create_time datetime2 
) 
;

CREATE NONCLUSTERED INDEX l_personnel_d_11c68fd4_idx_1 ON WSDataVault_dev_incremental.raw.l_personnel_department_hours (hk_h_department) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_personnel_d_11c68fd4_idx_2 ON WSDataVault_dev_incremental.raw.l_personnel_department_hours (hk_h_personnel) WITH (SORT_IN_TEMPDB = OFF);
ALTER TABLE WSDataVault_dev_incremental.raw.l_personnel_department_hours ADD CONSTRAINT l_personnel_d_11c68fd4_idx_PK PRIMARY KEY NONCLUSTERED (hk_l_personnel_department_hours) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

