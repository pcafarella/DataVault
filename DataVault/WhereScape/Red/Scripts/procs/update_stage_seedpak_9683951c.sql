--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_stage_seedpak_9683951c
-- Template         :    wsl_sqlserver_proc_dv_stage
-- Template Version :    8.5.1.0
-- Description      :    Update the Stage Table table stage_seedpak_auxiliary_lab_lookup
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Monday, December 18, 2023 at 10:45:41
-- Author           :    Paul Cafarella
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_stage_seedpak_9683951c].update_stage_seedpak_9683951c
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

    SET @v_sql = N'TRUNCATE TABLE [TABLEOWNER].[stage_seedpak_auxiliary_lab_lookup]';
    EXEC @v_return_status = sp_executesql @v_sql

    --=====================================================
    -- Insert new records
    --=====================================================
    SET @v_step = 300

    BEGIN TRANSACTION

      INSERT INTO [TABLEOWNER].[stage_seedpak_auxiliary_lab_lookup]
      ( acctnum
      , tzcode
      , product_prefix
      , date_added
      , last_date
      , last_user
      , last_tool
      , account_prefix
      , dss_record_source
      , dss_load_date
      , dss_create_time)
      SELECT  load_auxiliary_lab_lookup_national.acctnum AS acctnum
           , load_auxiliary_lab_lookup_national.tzcode AS tzcode
           , load_auxiliary_lab_lookup_national.product_prefix AS product_prefix
           , load_auxiliary_lab_lookup_national.date_added AS date_added
           , load_auxiliary_lab_lookup_national.last_date AS last_date
           , load_auxiliary_lab_lookup_national.last_user AS last_user
           , load_auxiliary_lab_lookup_national.last_tool AS last_tool
           , load_auxiliary_lab_lookup_national.account_prefix AS account_prefix
           , load_auxiliary_lab_lookup_national.dss_record_source AS dss_record_source
           , load_auxiliary_lab_lookup_national.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_create_time
      FROM [TABLEOWNER].[load_auxiliary_lab_lookup_national] load_auxiliary_lab_lookup_national
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
    SET @p_return_msg = 'stage_seedpak_auxiliary_lab_lookup updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_stage_seedpak_9683951c FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0