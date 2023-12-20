CREATE TABLE WSDataVault_dev_incremental.raw.l_department_instrument_run (
  hk_l_department_instrument_run nchar(64) NOT NULL 
, hk_h_analytical_instrument nchar(64) NOT NULL 
, hk_h_sample nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, hk_h_analysis_process nchar(64) NOT NULL 
, process_occurence_no nvarchar(50) 
, description nvarchar(60) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

CREATE NONCLUSTERED INDEX l_department__b869c8ad_idx_1 ON WSDataVault_dev_incremental.raw.l_department_instrument_run (hk_h_analytical_instrument) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_department__b869c8ad_idx_2 ON WSDataVault_dev_incremental.raw.l_department_instrument_run (hk_h_sample) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_department__b869c8ad_idx_3 ON WSDataVault_dev_incremental.raw.l_department_instrument_run (hk_h_department) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_department__b869c8ad_idx_4 ON WSDataVault_dev_incremental.raw.l_department_instrument_run (hk_h_analysis_process) WITH (SORT_IN_TEMPDB = OFF);
ALTER TABLE WSDataVault_dev_incremental.raw.l_department_instrument_run ADD CONSTRAINT l_department__b869c8ad_idx_PK PRIMARY KEY NONCLUSTERED (hk_l_department_instrument_run) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

