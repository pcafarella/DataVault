--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_stage_project_56ea3339
-- Template         :    wsl_sqlserver_proc_dv_stage_sha256
-- Template Version :    8.5.1.0
-- Description      :    Update the Stage Table table stage_project_national
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Sunday, July 23, 2023 at 17:59:56
-- Author           :    Paul Cafarella
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_stage_project_56ea3339].update_stage_project_56ea3339
  @p_sequence         INTEGER
, @p_job_name         VARCHAR(256)
, @p_task_name        VARCHAR(256)
, @p_job_id           INTEGER
, @p_task_id          INTEGER
, @p_return_msg       VARCHAR(1024) OUTPUT
, @p_status           INTEGER       OUTPUT

AS
  SET XACT_ABORT OFF  -- Turn off auto abort on errors
  SET NOCOUNT ON      -- Turn off row count messages

  --=====================================================
  -- Control variables used in most programs
  --=====================================================
  DECLARE
    @v_msgtext               VARCHAR(1024) -- Text for audit_trail
  , @v_sql                   NVARCHAR(255) -- Text for SQL statements
  , @v_step                  INTEGER       -- return code
  , @v_insert_count          INTEGER       -- no of records inserted
  , @v_return_status         INTEGER       -- Update result status
  , @v_current_datetime      DATETIME      -- Used for date insert

  --=====================================================
  -- General Variables
  --=====================================================


  --=====================================================
  -- MAIN
  --=====================================================
  SET @v_step = 100

  SET @v_insert_count = 0
  SET @v_current_datetime = GETDATE()

  BEGIN TRY

    --=====================================================
    -- Delete existing records
    --=====================================================
    SET @v_step = 200

    SET @v_sql = N'TRUNCATE TABLE [TABLEOWNER].[stage_project_national]';
    EXEC @v_return_status = sp_executesql @v_sql

    --=====================================================
    -- Insert new records
    --=====================================================
    SET @v_step = 300

    BEGIN TRANSACTION

      INSERT INTO [TABLEOWNER].[stage_project_national]
      ( hk_h_project
      , project_no
      , project_no_bkcc
      , tenant_id
      , project_name
      , project_desc
      , purchase_order_no
      , site
      , manager
      , sales1code
      , sales1plan
      , sales2code
      , sales2plan
      , termcode
      , lastdate
      , lasttool
      , lastuser
      , permitnum
      , locator
      , comments
      , buyer_type
      , market_segment
      , industry_sector
      , active
      , sample_interval
      , tat
      , tsr
      , basin
      , sample_state
      , client_type
      , acct_alert
      , po_required
      , rpt_quals
      , rpt_mcl
      , ponumber
      , designid
      , source
      , terr
      , county
      , inv_with_rpt
      , webflag
      , rpt_qc
      , webinvflag
      , archive_flag
      , archive_date
      , service
      , rpt_mdl
      , min_invoice_amt
      , report_packet_id
      , historical_data_check
      , rpt_multi_runs
      , container_label_type
      , hdc_level_2
      , uploaded_data_flag
      , certification_program
      , use_repdb_config
      , combine_inv_coc
      , auto_approve_lvl2_report
      , dss_change_hash_project_mroc_national
      , dss_record_source
      , dss_load_date
      , dss_create_time)
      SELECT  CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(COALESCE(load_projectdef_national.projectnum,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(COALESCE(load_projectdef_national.acctnum,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_project
           , COALESCE(load_projectdef_national.projectnum,'-1') AS project_no
           , COALESCE(load_projectdef_national.acctnum,'-1') AS project_no_bkcc
           , 'lims80' AS tenant_id
           , load_projectdef_national.description AS project_name
           , load_projectdef_national.projref AS project_desc
           , load_projectdef_national.ponumber AS purchase_order_no
           , load_projectdef_national.site AS site
           , load_projectdef_national.manager AS manager
           , load_projectdef_national.sales1code AS sales1code
           , load_projectdef_national.sales1plan AS sales1plan
           , load_projectdef_national.sales2code AS sales2code
           , load_projectdef_national.sales2plan AS sales2plan
           , load_projectdef_national.termcode AS termcode
           , load_projectdef_national.lastdate AS lastdate
           , load_projectdef_national.lasttool AS lasttool
           , load_projectdef_national.lastuser AS lastuser
           , load_projectdef_national.permitnum AS permitnum
           , load_projectdef_national.locator AS locator
           , load_clients_national.comments AS comments
           , load_clients_national.buyer_type AS buyer_type
           , load_clients_national.market_segment AS market_segment
           , load_clients_national.industry_sector AS industry_sector
           , load_clients_national.active AS active
           , load_clients_national.sample_interval AS sample_interval
           , load_clients_national.tat AS tat
           , load_clients_national.tsr AS tsr
           , load_clients_national.basin AS basin
           , load_clients_national.sample_state AS sample_state
           , load_clients_national.client_type AS client_type
           , load_clients_national.acct_alert AS acct_alert
           , load_clients_national.po_required AS po_required
           , load_clients_national.rpt_quals AS rpt_quals
           , load_clients_national.rpt_mcl AS rpt_mcl
           , load_clients_national.ponumber AS ponumber
           , load_clients_national.designid AS designid
           , load_clients_national.source AS source
           , load_clients_national.terr AS terr
           , load_clients_national.county AS county
           , load_clients_national.inv_with_rpt AS inv_with_rpt
           , load_clients_national.webflag AS webflag
           , load_clients_national.rpt_qc AS rpt_qc
           , load_clients_national.webinvflag AS webinvflag
           , load_clients_national.archive_flag AS archive_flag
           , load_clients_national.archive_date AS archive_date
           , load_clients_national.service AS service
           , load_clients_national.rpt_mdl AS rpt_mdl
           , load_clients_national.min_invoice_amt AS min_invoice_amt
           , load_clients_national.report_packet_id AS report_packet_id
           , load_clients_national.historical_data_check AS historical_data_check
           , load_clients_national.rpt_multi_runs AS rpt_multi_runs
           , load_clients_national.container_label_type AS container_label_type
           , load_clients_national.hdc_level_2 AS hdc_level_2
           , load_clients_national.uploaded_data_flag AS uploaded_data_flag
           , load_clients_national.certification_program AS certification_program
           , load_clients_national.use_repdb_config AS use_repdb_config
           , load_clients_national.combine_inv_coc AS combine_inv_coc
           , load_clients_national.auto_approve_lvl2_report AS auto_approve_lvl2_report
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(load_projectdef_national.description AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.projref AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.ponumber AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.site AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.manager AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.sales1code AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.sales1plan AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.sales2code AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.sales2plan AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.termcode AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.lastdate AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.lasttool AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.lastuser AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.permitnum AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_projectdef_national.locator AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.comments AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.buyer_type AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.market_segment AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.industry_sector AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.active AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.sample_interval AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.tat AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.tsr AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.basin AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.sample_state AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.client_type AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.acct_alert AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.po_required AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.rpt_quals AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.rpt_mcl AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.ponumber AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.designid AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.source AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.terr AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.county AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.inv_with_rpt AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.webflag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.rpt_qc AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.webinvflag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.archive_flag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.archive_date AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.service AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.rpt_mdl AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.min_invoice_amt AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.report_packet_id AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.historical_data_check AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.rpt_multi_runs AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.container_label_type AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.hdc_level_2 AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.uploaded_data_flag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.certification_program AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.use_repdb_config AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.combine_inv_coc AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.auto_approve_lvl2_report AS VARCHAR(MAX)),'null')
               ),2) AS dss_change_hash_project_mroc_national
           , load_clients_national.dss_record_source AS dss_record_source
           , load_clients_national.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_create_time
      FROM [load].[load_clients_national_v] load_clients_national
RIGHT OUTER JOIN [load].[load_projectdef_national_v] load_projectdef_national
ON load_projectdef_national.acctnum = load_clients_national.acctnum
AND load_projectdef_national.projectnum = load_clients_national.projectnum where load_projectdef_national.projectnum is not null
      ;

      SELECT @v_insert_count = @@ROWCOUNT

    COMMIT

    --=====================================================
    -- All Done report the results
    --=====================================================
    SET @v_step = 400

    -- WsWrkTask(job,task,seq,insert,update,replace,delete,discard,reject,error)
    EXEC [METABASE].WsWrkTask @p_job_id, @p_task_id, @p_sequence,
     @v_insert_count,0,0,0,0,0,0

    SET @p_status = 1
    SET @p_return_msg = 'stage_project_national updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_stage_project_56ea3339 FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0
