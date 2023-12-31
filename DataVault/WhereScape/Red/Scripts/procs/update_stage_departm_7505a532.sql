--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_stage_departm_7505a532
-- Template         :    wsl_sqlserver_proc_dv_stage_sha256
-- Template Version :    8.5.1.0
-- Description      :    Update the Stage Table table stage_department_instrument_run_national
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Tuesday, August 29, 2023 at 10:54:44
-- Author           :    Paul Cafarella
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_stage_departm_7505a532].update_stage_departm_7505a532
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

    SET @v_sql = N'TRUNCATE TABLE [TABLEOWNER].[stage_department_instrument_run_national]';
    EXEC @v_return_status = sp_executesql @v_sql

    --=====================================================
    -- Insert new records
    --=====================================================
    SET @v_step = 300

    BEGIN TRANSACTION

      INSERT INTO [TABLEOWNER].[stage_department_instrument_run_national]
      ( hk_l_department_instrument_run
      , hk_h_analytical_instrument
      , hk_h_sample
      , hk_h_department
      , hk_h_analysis_process
      , department_no
      , department_no_bkcc
      , department_no_tenant_id
      , sample_no
      , sample_no_bkcc
      , sample_no_tenant_id
      , instrument_no
      , instrument_no_bkcc
      , instrument_no_tenant_id
      , analysis_process_code
      , analysis_process_code_bkcc
      , analysis_process_code_tenant_id
      , process_occurence_no
      , description
      , instrument_run_no
      , audit_seq
      , samp_tag
      , login_seq
      , list_joinid
      , snapshot_flag
      , dkey_flag
      , parm_validate_flag
      , dkey_cnt
      , pchain_id
      , calcid
      , process_step
      , process_id
      , nextprocess_id
      , process_status
      , process_message
      , reqavail_flag
      , calcavail_flag
      , approval_status
      , galp_id
      , input_seq
      , inputdate
      , samp_type
      , link_id
      , enterdate
      , prep_date1
      , prep_date2
      , measuredate
      , rptremarks
      , comments
      , lastdate
      , lastuser
      , lasttool
      , analysis_type
      , analysis_count
      , rpt_mdl
      , virtual_set
      , worknum
      , tic
      , run_date
      , run_type
      , analyst
      , dss_change_hash_department_instrument_run_mroc_national
      , dss_record_source
      , dss_load_date
      , dss_create_time)
      SELECT  CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(ISNULL(instrument_id,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(ISNULL(load_sampheader_national.samplenum,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(ISNULL(deptnum,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(ISNULL(load_listheader_national.listtype,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(isnull(listmatclass,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.samp_joinid AS VARCHAR(MAX)),'null')
               ),2) AS hk_l_department_instrument_run
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(ISNULL(instrument_id,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_analytical_instrument
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(ISNULL(load_sampheader_national.samplenum,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_sample
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(ISNULL(deptnum,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_department
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(ISNULL(load_listheader_national.listtype,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(isnull(listmatclass,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_analysis_process
           , ISNULL(deptnum,'-1') AS department_no
           , 'lims80' AS department_no_bkcc
           , 'lims80' AS department_no_tenant_id
           , ISNULL(load_sampheader_national.samplenum,'-1') AS sample_no
           , 'lims80' AS sample_no_bkcc
           , 'lims80' AS sample_no_tenant_id
           , ISNULL(instrument_id,'-1') AS instrument_no
           , 'lims80' AS instrument_no_bkcc
           , 'lims80' AS instrument_no_tenant_id
           , ISNULL(load_listheader_national.listtype,'-1') AS analysis_process_code
           , isnull(listmatclass,'-1') AS analysis_process_code_bkcc
           , 'lims80' AS analysis_process_code_tenant_id
           , load_sampheader_national.samp_joinid AS process_occurence_no
           , load_sample_national.description AS description
           , ISNULL(load_rundef_national.run_id,'-1') AS instrument_run_no
           , load_sampheader_national.audit_seq AS audit_seq
           , load_sampheader_national.samp_tag AS samp_tag
           , load_sampheader_national.login_seq AS login_seq
           , load_listheader_national.list_joinid AS list_joinid
           , load_sampheader_national.snapshot_flag AS snapshot_flag
           , load_sampheader_national.dkey_flag AS dkey_flag
           , load_sampheader_national.parm_validate_flag AS parm_validate_flag
           , load_sampheader_national.dkey_cnt AS dkey_cnt
           , load_sampheader_national.pchain_id AS pchain_id
           , load_sampheader_national.calcid AS calcid
           , load_sampheader_national.process_step AS process_step
           , load_sampheader_national.process_id AS process_id
           , load_sampheader_national.nextprocess_id AS nextprocess_id
           , load_sampheader_national.process_status AS process_status
           , load_sampheader_national.process_message AS process_message
           , load_sampheader_national.reqavail_flag AS reqavail_flag
           , load_sampheader_national.calcavail_flag AS calcavail_flag
           , load_sampheader_national.approval_status AS approval_status
           , load_sampheader_national.galp_id AS galp_id
           , load_sampheader_national.input_seq AS input_seq
           , load_sampheader_national.inputdate AS inputdate
           , load_sampheader_national.samp_type AS samp_type
           , load_sampheader_national.link_id AS link_id
           , load_sampheader_national.enterdate AS enterdate
           , load_sampheader_national.prep_date1 AS prep_date1
           , load_sampheader_national.prep_date2 AS prep_date2
           , load_sampheader_national.measuredate AS measuredate
           , load_sampheader_national.rptremarks AS rptremarks
           , load_sampheader_national.comments AS comments
           , load_sampheader_national.lastdate AS lastdate
           , load_sampheader_national.lastuser AS lastuser
           , load_sampheader_national.lasttool AS lasttool
           , load_sampheader_national.analysis_type AS analysis_type
           , load_sampheader_national.analysis_count AS analysis_count
           , load_sampheader_national.rpt_mdl AS rpt_mdl
           , load_sampheader_national.virtual_set AS virtual_set
           , load_sampheader_national.worknum AS worknum
           , load_sampheader_national.tic AS tic
           , load_rundef_national.run_date AS run_date
           , load_rundef_national.run_type AS run_type
           , load_rundef_national.analyst AS analyst
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(ISNULL(load_rundef_national.run_id,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.audit_seq AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.samp_tag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.login_seq AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_listheader_national.list_joinid AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.snapshot_flag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.dkey_flag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.parm_validate_flag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.dkey_cnt AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.pchain_id AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.calcid AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.process_step AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.process_id AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.nextprocess_id AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.process_status AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.process_message AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.reqavail_flag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.calcavail_flag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.approval_status AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.galp_id AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.input_seq AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.inputdate AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.samp_type AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.link_id AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.enterdate AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.prep_date1 AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.prep_date2 AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.measuredate AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.rptremarks AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.comments AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.lastdate AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.lastuser AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.lasttool AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.analysis_type AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.analysis_count AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.rpt_mdl AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.virtual_set AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.worknum AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_sampheader_national.tic AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_rundef_national.run_date AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_rundef_national.run_type AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_rundef_national.analyst AS VARCHAR(MAX)),'null')
               ),2) AS dss_change_hash_department_instrument_run_mroc_national
           , load_rundef_national.dss_record_source AS dss_record_source
           , load_rundef_national.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_create_time
      FROM [TABLEOWNER].[load_rundef_national] load_rundef_national
RIGHT OUTER JOIN [TABLEOWNER].[load_sampheader_national] load_sampheader_national
ON load_sampheader_national.run_id = load_rundef_national.run_id
INNER JOIN [TABLEOWNER].[load_listheader_national] load_listheader_national
ON load_listheader_national.list_joinid = load_sampheader_national.list_joinid
INNER JOIN [TABLEOWNER].[load_sample_national] load_sample_national
ON load_sampheader_national.samplenum = load_sample_national.samplenum
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
    SET @p_return_msg = 'stage_department_instrument_run_national updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_stage_departm_7505a532 FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0
