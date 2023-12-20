CREATE TABLE $OBJECT$ (
hk_l_analysis_process_product nchar(64),
link_id nvarchar(20),
description nvarchar(40),
list_pointer nvarchar(20),
list_func nvarchar(40),
parm_stored nvarchar(40),
pchain_name nvarchar(30),
dss_change_hash nchar(64),
dss_record_source nvarchar(255),
dss_load_date datetime2,
dss_start_date datetime2,
dss_version int,
dss_create_time datetime2
);
INSERT INTO $OBJECT$ (
hk_l_analysis_process_product,
link_id,
description,
list_pointer,
list_func,
parm_stored,
pchain_name,
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
      , SUBSTRING('<NA>',1,40)
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,40)
      , SUBSTRING('<NA>',1,40)
      , SUBSTRING('<NA>',1,30)
      , CONVERT(nchar(64),REPLICATE('0', 64),2)
      , 'SYSTEM'
      , CURRENT_TIMESTAMP
      , '1900-01-01 00:00:00'
      , 1
      , CURRENT_TIMESTAMP
  WHERE NOT EXISTS ( SELECT 1
    FROM  $OBJECT$
    WHERE hk_l_analysis_process_product = CONVERT(nchar(64),REPLICATE('0', 64),2)
  );


CREATE UNIQUE NONCLUSTERED INDEX s_analysis_pr_a7451301_idx_CK ON WSDataVault_dev_incremental.raw.s_analysis_process_product_mroc_national (hk_l_analysis_process_product,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX s_analysis_pr_a7451301_idx_PK ON WSDataVault_dev_incremental.raw.s_analysis_process_product_mroc_national (hk_l_analysis_process_product,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);

