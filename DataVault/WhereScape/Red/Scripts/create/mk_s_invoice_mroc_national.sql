CREATE TABLE WSDataVault_dev_incremental.raw.s_invoice_mroc_national (
  hk_h_invoice nchar(64) NOT NULL -- stage_invoice_national.hk_h_invoice 
, ponumber nvarchar(50) -- stage_invoice_national.ponumber 
, invoicedate datetime2 -- stage_invoice_national.invoicedate 
, invoiceref nvarchar(10) -- stage_invoice_national.invoiceref 
, invoicecomm nvarchar(240) -- stage_invoice_national.invoicecomm 
, projectnum nvarchar(255) -- stage_invoice_national.projectnum 
, description nvarchar(40) -- stage_invoice_national.description 
, status nvarchar(10) -- stage_invoice_national.status 
, lastdate datetime2 -- stage_invoice_national.lastdate 
, lasttool nvarchar(20) -- stage_invoice_national.lasttool 
, lastuser nvarchar(20) -- stage_invoice_national.lastuser 
, redostatus nvarchar(10) -- stage_invoice_national.redostatus 
, mas90date datetime2 -- stage_invoice_national.mas90date 
 
, original_invoice_date datetime2 -- stage_invoice_national.original_invoice_date 
, summary_invoice nvarchar(30) -- stage_invoice_national.summary_invoice 
 
, dss_change_hash nchar(64) NOT NULL -- stage_invoice_national.dss_change_hash_invoice_mroc_national 
, dss_record_source nvarchar(255) -- stage_invoice_national.dss_record_source 
, dss_load_date datetime2 -- stage_invoice_national.dss_load_date 
, dss_start_date datetime2 
, dss_version int 
, dss_create_time datetime2 
) 
;

CREATE UNIQUE CLUSTERED INDEX s_invoice_mro_11b31c9a_idx_PK ON WSDataVault_dev_incremental.raw.s_invoice_mroc_national (hk_h_invoice,dss_start_date) WITH (SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY=ON);
CREATE UNIQUE NONCLUSTERED INDEX s_invoice_mro_11b31c9a_idx_CK ON WSDataVault_dev_incremental.raw.s_invoice_mroc_national (hk_h_invoice,dss_change_hash,dss_start_date) WITH (SORT_IN_TEMPDB = OFF);

