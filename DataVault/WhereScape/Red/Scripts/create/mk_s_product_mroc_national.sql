CREATE TABLE $OBJECT$ (
hk_h_product nchar(64),
method nvarchar(100),
matrix nvarchar(50),
listtype nvarchar(50),
description nvarchar(255),
class nvarchar(1),
holddays decimal(12,2),
holdflg nvarchar(1),
duedays decimal(12,2),
factorflg nvarchar(1),
containertype nvarchar(20),
bottles decimal(12,2),
lastdate datetime2,
lasttool nvarchar(20),
lastuser nvarchar(20),
costcenter nvarchar(4),
phasecode smallint,
auto_anrev_flag nvarchar(1),
dss_change_hash nchar(64),
dss_record_source nvarchar(255),
dss_load_date datetime2,
dss_start_date datetime2,
dss_version int,
dss_create_time datetime2
);
INSERT INTO $OBJECT$ (
hk_h_product,
method,
matrix,
listtype,
description,
class,
holddays,
holdflg,
duedays,
factorflg,
containertype,
bottles,
lastdate,
lasttool,
lastuser,
costcenter,
phasecode,
auto_anrev_flag,
dss_change_hash,
dss_record_source,
dss_load_date,
dss_start_date,
dss_version,
dss_create_time
)
  SELECT
      CONVERT(nchar(64),REPLICATE('0', 64),2)
      , SUBSTRING('<NA>',1,100)
      , SUBSTRING('<NA>',1,50)
      , SUBSTRING('<NA>',1,50)
      , SUBSTRING('<NA>',1,255)
      , SUBSTRING('<NA>',1,1)
      , CONVERT(decimal(12,2), 0)
      , SUBSTRING('<NA>',1,1)
      , CONVERT(decimal(12,2), 0)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,20)
      , CONVERT(decimal(12,2), 0)
      , '1900-01-01 00:00:00'
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,4)
      , CONVERT(smallint, 0)
      , SUBSTRING('<NA>',1,1)
      , CONVERT(nchar(64),REPLICATE('0', 64),2)
      , 'SYSTEM'
      , CURRENT_TIMESTAMP
      , '1900-01-01 00:00:00'
      , 1
      , CURRENT_TIMESTAMP
  WHERE NOT EXISTS ( SELECT 1
    FROM  $OBJECT$
    WHERE hk_h_product = CONVERT(nchar(64),REPLICATE('0', 64),2)
  );


CREATE UNIQUE CLUSTERED INDEX s_product_mroc_24d6adc_idx_PK ON WSDataVault_dev_incremental.raw.s_product_mroc_national (hk_h_product,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX s_product_mroc_24d6adc_idx_CK ON WSDataVault_dev_incremental.raw.s_product_mroc_national (hk_h_product,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

