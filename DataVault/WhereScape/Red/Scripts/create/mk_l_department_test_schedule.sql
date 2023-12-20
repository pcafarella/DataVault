CREATE TABLE WSDataVault_dev_incremental.raw.l_department_test_schedule (
  hk_l_department_test_schedule nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

CREATE NONCLUSTERED INDEX l_department_t_a5305ea_idx_1 ON WSDataVault_dev_incremental.raw.l_department_test_schedule (hk_h_test) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_department_t_a5305ea_idx_2 ON WSDataVault_dev_incremental.raw.l_department_test_schedule (hk_h_department) WITH (SORT_IN_TEMPDB = OFF);
ALTER TABLE WSDataVault_dev_incremental.raw.l_department_test_schedule ADD CONSTRAINT l_department_t_a5305ea_idx_PK PRIMARY KEY NONCLUSTERED (hk_l_department_test_schedule) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

