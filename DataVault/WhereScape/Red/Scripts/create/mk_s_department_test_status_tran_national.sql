CREATE TABLE $OBJECT$ (
hk_l_department_test_status nchar(64),
process_status_batch_no nvarchar(20),
dstatusdate datetime2,
lasttool nvarchar(20),
lastuser nvarchar(20),
dss_change_hash nchar(64),
dss_record_source nvarchar(255),
dss_load_date datetime2,
dss_start_date datetime2,
dss_version int,
dss_create_time datetime2
);
INSERT INTO $OBJECT$ (
hk_l_department_test_status,
process_status_batch_no,
dstatusdate,
lasttool,
lastuser,
dss_change_hash,
dss_record_source,
dss_load_date,
dss_start_date,
dss_version,
dss_create_time
)
  SELECT
      CONVERT(nchar(64),REPLICATE('0', 64),2)
      , SUBSTRING('<NA>',1,20)
      , '1900-01-01 00:00:00'
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,20)
      , CONVERT(nchar(64),REPLICATE('0', 64),2)
      , 'SYSTEM'
      , CURRENT_TIMESTAMP
      , '1900-01-01 00:00:00'
      , 1
      , CURRENT_TIMESTAMP
  WHERE NOT EXISTS ( SELECT 1
    FROM  $OBJECT$
    WHERE hk_l_department_test_status = CONVERT(nchar(64),REPLICATE('0', 64),2)
  );


CREATE UNIQUE NONCLUSTERED INDEX s_department__7b46ede5_idx_CK ON WSDataVault_dev_incremental.raw.s_department_test_status_tran_national (hk_l_department_test_status,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON);
CREATE UNIQUE NONCLUSTERED INDEX s_department__7b46ede5_idx_PK ON WSDataVault_dev_incremental.raw.s_department_test_status_tran_national (hk_l_department_test_status,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON);

