--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_l_personnel_s_59a518da
-- Template         :    wsl_sqlserver_proc_dv_perm_sha256
-- Template Version :    8.5.1.0
-- Description      :    Update the Link table l_personnel_supervisor
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Wednesday, September 13, 2023 at 16:48:38
-- Author           :
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_l_personnel_s_59a518da].update_l_personnel_s_59a518da
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
    -- Insert new records
    --=====================================================

    SET @v_step = 200


    BEGIN TRANSACTION


    INSERT INTO [TABLEOWNER].[l_personnel_supervisor]
      ( hk_l_personnel_supervisor
      , hk_h_personnel_personnel_no
      , hk_h_personnel_personnel_supervisor_no
      , dss_record_source
      , dss_load_date
      , dss_create_time)
    SELECT --DISTINCT
stage_personnel_supervisor.hk_l_personnel_supervisor AS hk_l_personnel_supervisor
           , stage_personnel_supervisor.hk_h_personnel_personnel_no AS hk_h_personnel_personnel_no
           , stage_personnel_supervisor.hk_h_personnel_personnel_supervisor_no AS hk_h_personnel_personnel_supervisor_no
           , stage_personnel_supervisor.dss_record_source AS dss_record_source
           , stage_personnel_supervisor.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_create_time
    FROM [TABLEOWNER].[stage_personnel_supervisor] stage_personnel_supervisor
        ;


    SELECT @v_insert_count = @@ROWCOUNT

    COMMIT

    --=====================================================
    -- All Done report the results
    --=====================================================
    SET @v_step = 300

    -- WsWrkTask(job,task,seq,insert,update,replace,delete,discard,reject,error)
    EXEC [METABASE].WsWrkTask @p_job_id, @p_task_id, @p_sequence,
     @v_insert_count,0,0,0,0,0,0

    SET @p_status = 1
    SET @p_return_msg = 'l_personnel_supervisor updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_l_personnel_s_59a518da FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0
