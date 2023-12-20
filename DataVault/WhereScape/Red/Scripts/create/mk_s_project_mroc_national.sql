CREATE TABLE $OBJECT$ (
hk_h_project nchar(64),
project_name nvarchar(max),
project_desc nvarchar(max),
purchase_order_no nvarchar(50),
site nvarchar(255),
manager nvarchar(30),
sales1code nvarchar(4),
sales1plan nvarchar(4),
sales2code nvarchar(4),
sales2plan nvarchar(4),
termcode nvarchar(10),
lastdate datetime2,
lasttool nvarchar(20),
lastuser nvarchar(20),
permitnum nvarchar(100),
locator nvarchar(50),
comments nvarchar(max),
buyer_type nvarchar(20),
market_segment nvarchar(20),
industry_sector nvarchar(20),
active nvarchar(1),
sample_interval decimal(12,2),
tat decimal(12,2),
tsr nvarchar(4),
basin tinyint,
sample_state nvarchar(2),
client_type nvarchar(1),
acct_alert nvarchar(1),
po_required nvarchar(1),
rpt_quals nvarchar(1),
rpt_mcl nvarchar(1),
ponumber nvarchar(40),
designid nvarchar(10),
source nvarchar(4),
terr nvarchar(2),
county nvarchar(50),
inv_with_rpt nvarchar(1),
webflag nvarchar(1),
rpt_qc nvarchar(1),
webinvflag nvarchar(1),
archive_flag nvarchar(1),
archive_date datetime2,
service nvarchar(4),
rpt_mdl nvarchar(1),
min_invoice_amt decimal(12,2),
report_packet_id decimal(12,2),
historical_data_check nchar(1),
rpt_multi_runs nchar(1),
container_label_type nvarchar(20),
hdc_level_2 nchar(1),
uploaded_data_flag nvarchar(20),
certification_program nvarchar(30),
use_repdb_config nvarchar(1),
combine_inv_coc nvarchar(1),
auto_approve_lvl2_report nchar(1),
dss_change_hash nchar(64),
dss_record_source nvarchar(255),
dss_load_date datetime2,
dss_start_date datetime2,
dss_version int,
dss_create_time datetime2
);
INSERT INTO $OBJECT$ (
hk_h_project,
project_name,
project_desc,
purchase_order_no,
site,
manager,
sales1code,
sales1plan,
sales2code,
sales2plan,
termcode,
lastdate,
lasttool,
lastuser,
permitnum,
locator,
comments,
buyer_type,
market_segment,
industry_sector,
active,
sample_interval,
tat,
tsr,
basin,
sample_state,
client_type,
acct_alert,
po_required,
rpt_quals,
rpt_mcl,
ponumber,
designid,
source,
terr,
county,
inv_with_rpt,
webflag,
rpt_qc,
webinvflag,
archive_flag,
archive_date,
service,
rpt_mdl,
min_invoice_amt,
report_packet_id,
historical_data_check,
rpt_multi_runs,
container_label_type,
hdc_level_2,
uploaded_data_flag,
certification_program,
use_repdb_config,
combine_inv_coc,
auto_approve_lvl2_report,
dss_change_hash,
dss_record_source,
dss_load_date,
dss_start_date,
dss_version,
dss_create_time
)
  SELECT
      CONVERT(nchar(64),REPLICATE('0', 64),2)
      , SUBSTRING('<NA>',1,2147483647)
      , SUBSTRING('<NA>',1,2147483647)
      , SUBSTRING('<NA>',1,50)
      , SUBSTRING('<NA>',1,255)
      , SUBSTRING('<NA>',1,30)
      , SUBSTRING('<NA>',1,4)
      , SUBSTRING('<NA>',1,4)
      , SUBSTRING('<NA>',1,4)
      , SUBSTRING('<NA>',1,4)
      , SUBSTRING('<NA>',1,10)
      , '1900-01-01 00:00:00'
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,100)
      , SUBSTRING('<NA>',1,50)
      , SUBSTRING('<NA>',1,2147483647)
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,1)
      , CONVERT(decimal(12,2), 0)
      , CONVERT(decimal(12,2), 0)
      , SUBSTRING('<NA>',1,4)
      , CONVERT(tinyint, 0)
      , SUBSTRING('<NA>',1,2)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,40)
      , SUBSTRING('<NA>',1,10)
      , SUBSTRING('<NA>',1,4)
      , SUBSTRING('<NA>',1,2)
      , SUBSTRING('<NA>',1,50)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , '1900-01-01 00:00:00'
      , SUBSTRING('<NA>',1,4)
      , SUBSTRING('<NA>',1,1)
      , CONVERT(decimal(12,2), 0)
      , CONVERT(decimal(12,2), 0)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,20)
      , SUBSTRING('<NA>',1,30)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , SUBSTRING('<NA>',1,1)
      , CONVERT(nchar(64),REPLICATE('0', 64),2)
      , 'SYSTEM'
      , CURRENT_TIMESTAMP
      , '1900-01-01 00:00:00'
      , 1
      , CURRENT_TIMESTAMP
  WHERE NOT EXISTS ( SELECT 1
    FROM  $OBJECT$
    WHERE hk_h_project = CONVERT(nchar(64),REPLICATE('0', 64),2)
  );


CREATE UNIQUE CLUSTERED INDEX s_project_mro_931ad786_idx_PK ON WSDataVault_dev_incremental.raw.s_project_mroc_national (hk_h_project,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX s_project_mro_931ad786_idx_CK ON WSDataVault_dev_incremental.raw.s_project_mroc_national (hk_h_project,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

