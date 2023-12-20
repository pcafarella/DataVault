--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_stage_analysi_67f00284
-- Template         :    wsl_sqlserver_proc_dv_stage_sha256
-- Template Version :    8.5.1.0
-- Description      :    Update the Stage Table table stage_analysis_process_national
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Thursday, August 17, 2023 at 12:19:28
-- Author           :
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_stage_analysi_67f00284].update_stage_analysi_67f00284
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

    SET @v_sql = N'TRUNCATE TABLE [TABLEOWNER].[stage_analysis_process_national]';
    EXEC @v_return_status = sp_executesql @v_sql

    --=====================================================
    -- Insert new records
    --=====================================================
    SET @v_step = 300

    BEGIN TRANSACTION

      INSERT INTO [TABLEOWNER].[stage_analysis_process_national]
      ( hk_h_analysis_process
      , analysis_process_code
      , analysis_process_code_bkcc
      , tenant_id
      , dss_record_source
      , dss_load_date
      , dss_create_time)
      SELECT  CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(load_listlink_national.listtype AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_listlink_national.listmatclass AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_analysis_process
           , load_listlink_national.listtype AS analysis_process_code
           , load_listlink_national.listmatclass AS analysis_process_code_bkcc
           , 'lims80' AS tenant_id
           , load_listlink_national.dss_record_source AS dss_record_source
           , load_listlink_national.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_create_time
      FROM [TABLEOWNER].[load_listlink_national] load_listlink_national
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
    SET @p_return_msg = 'stage_analysis_process_national updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_stage_analysi_67f00284 FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0
