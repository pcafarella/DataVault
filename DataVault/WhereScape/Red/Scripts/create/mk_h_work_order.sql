CREATE TABLE WSDataVault_dev_incremental.raw.h_work_order (
  hk_h_work_order nchar(64) NOT NULL 
, work_order_no nvarchar(50) 
, work_order_no_bkcc nvarchar(255) 
, tenant_id nvarchar(255) 
, dss_record_source nvarchar(255) 
, dss_load_date datetime2 
, dss_create_time datetime2 
) 
;

ALTER TABLE WSDataVault_dev_incremental.raw.h_work_order ADD CONSTRAINT h_work_order_3fc7e4d7_idx_PK PRIMARY KEY CLUSTERED (hk_h_work_order) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX h_work_order_3fc7e4d7_idx_A ON WSDataVault_dev_incremental.raw.h_work_order (work_order_no,work_order_no_bkcc,tenant_id) WITH (SORT_IN_TEMPDB = OFF);

