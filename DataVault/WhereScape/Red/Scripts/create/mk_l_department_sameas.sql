CREATE TABLE WSDataVault_dev_incremental.raw.l_department_sameas (
 
  hk_l_department_sameas nchar(64) NOT NULL -- stage_department_sameas.hk_l_department_sameas 
 
, hk_h_department_department_no nchar(64) NOT NULL -- stage_department_sameas.hk_h_department_department_no 
 
, hk_h_department_sameas_department_no nchar(64) NOT NULL -- stage_department_sameas.hk_h_department_sameas_department_no 
, dss_record_source nvarchar(255) -- stage_department_sameas.dss_record_source 
, dss_load_date datetime2 -- stage_department_sameas.dss_load_date 
, dss_create_time datetime2 
) 
;

CREATE NONCLUSTERED INDEX l_department__c7cc2b92_idx_1 ON WSDataVault_dev_incremental.raw.l_department_sameas (hk_h_department_department_no) WITH (SORT_IN_TEMPDB = OFF);
CREATE NONCLUSTERED INDEX l_department__c7cc2b92_idx_2 ON WSDataVault_dev_incremental.raw.l_department_sameas (hk_h_department_sameas_department_no) WITH (SORT_IN_TEMPDB = OFF);
ALTER TABLE WSDataVault_dev_incremental.raw.l_department_sameas ADD CONSTRAINT l_department__c7cc2b92_idx_PK PRIMARY KEY NONCLUSTERED (hk_l_department_sameas) WITH (SORT_IN_TEMPDB = OFF);

