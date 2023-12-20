CREATE TABLE $OBJECT$ (
hk_l_analysis_process_product nchar(64),
hk_h_product nchar(64),
hk_h_analysis_process nchar(64),
dss_record_source nvarchar(255),
dss_load_date datetime2,
dss_create_time datetime2
);
INSERT INTO $OBJECT$ (
hk_l_analysis_process_product,
hk_h_product,
hk_h_analysis_process,
dss_record_source,
dss_load_date,
dss_create_time
)
  SELECT
      CONVERT(nchar(64),REPLICATE('0', 64),2)
      , CONVERT(nchar(64),REPLICATE('0', 64),2)
      , CONVERT(nchar(64),REPLICATE('0', 64),2)
      , 'SYSTEM'
      , CURRENT_TIMESTAMP
      , CURRENT_TIMESTAMP
  WHERE NOT EXISTS ( SELECT 1
    FROM  $OBJECT$
    WHERE hk_l_analysis_process_product = CONVERT(nchar(64),REPLICATE('0', 64),2)
  );


CREATE NONCLUSTERED INDEX l_analysis_pr_c65ca82f_idx_1 ON WSDataVault_dev_incremental.raw.l_analysis_process_product (hk_h_product) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_analysis_pr_c65ca82f_idx_2 ON WSDataVault_dev_incremental.raw.l_analysis_process_product (hk_h_analysis_process) WITH (SORT_IN_TEMPDB = OFF);
ALTER TABLE WSDataVault_dev_incremental.raw.l_analysis_process_product ADD CONSTRAINT l_analysis_pr_c65ca82f_idx_PK PRIMARY KEY NONCLUSTERED (hk_l_analysis_process_product) WITH (SORT_IN_TEMPDB = OFF);

