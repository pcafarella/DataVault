CREATE TABLE WSDataVault_dev_incremental.raw.l_personnel_department (
  hk_l_personnel_department nchar(64) NOT NULL 
, hk_h_department nchar(64) NOT NULL 
, hk_h_personnel nchar(64) NOT NULL 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

CREATE NONCLUSTERED INDEX l_personnel_d_f15d08c4_idx_1 ON WSDataVault_dev_incremental.raw.l_personnel_department (hk_h_department) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_personnel_d_f15d08c4_idx_2 ON WSDataVault_dev_incremental.raw.l_personnel_department (hk_h_personnel) WITH (SORT_IN_TEMPDB = OFF);
ALTER TABLE WSDataVault_dev_incremental.raw.l_personnel_department ADD CONSTRAINT l_personnel_d_f15d08c4_idx_PK PRIMARY KEY NONCLUSTERED (hk_l_personnel_department) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

