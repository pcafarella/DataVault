CREATE TABLE WSDataVault_dev_incremental.raw.l_workorder_test (
  hk_l_workorder_test nchar(64) NOT NULL 
, hk_h_test nchar(64) NOT NULL 
, hk_h_work_order nchar(64) NOT NULL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.l_workorder_test ADD CONSTRAINT l_workorder_t_c0a6c4e7_idx_PK PRIMARY KEY CLUSTERED (hk_l_workorder_test) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE NONCLUSTERED INDEX l_workorder_t_c0a6c4e7_idx_1 ON WSDataVault_dev_incremental.raw.l_workorder_test (hk_h_test) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_workorder_t_c0a6c4e7_idx_2 ON WSDataVault_dev_incremental.raw.l_workorder_test (hk_h_work_order) WITH (SORT_IN_TEMPDB = OFF);

