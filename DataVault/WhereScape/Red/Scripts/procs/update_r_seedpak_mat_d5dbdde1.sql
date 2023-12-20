--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_r_seedpak_mat_d5dbdde1
-- Template         :    wsl_sqlserver_proc_stage
-- Template Version :    8.1.1.0
-- Description      :    Update the EDW 3NF table r_seedpak_matrixdef
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Monday, March 27, 2023 at 10:07:06
-- Author           :    Paul Cafarella
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_r_seedpak_mat_d5dbdde1].update_r_seedpak_mat_d5dbdde1
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
  , @v_merged_count          INTEGER       -- no of records merged
  , @v_insert_count          INTEGER       -- no of records inserted
  , @v_update_count          INTEGER       -- no of records updated
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
  SET @v_update_count = 0
  SET @v_current_datetime = GETDATE()

  BEGIN TRY

    --=====================================================
    -- Delete existing records
    --=====================================================
    SET @v_step = 200

    SET @v_sql = N'TRUNCATE TABLE [TABLEOWNER].[r_seedpak_matrixdef]';
    EXEC @v_return_status = sp_executesql @v_sql

    --=====================================================
    -- Insert new records
    --=====================================================
    SET @v_step = 300

    BEGIN TRANSACTION

      INSERT INTO [TABLEOWNER].[r_seedpak_matrixdef]
      ( matnum
      , matrix
      , pace_matrix
      , dss_record_source
      , dss_load_date
      , dss_create_time
      )
      SELECT  stage_seedpak_matrixdef.matnum AS matnum
           , stage_seedpak_matrixdef.matrix AS matrix
           , stage_seedpak_matrixdef.pace_matrix AS pace_matrix
           , stage_seedpak_matrixdef.dss_record_source AS dss_record_source
           , stage_seedpak_matrixdef.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_create_time
      FROM [TABLEOWNER].[stage_seedpak_matrixdef] stage_seedpak_matrixdef
      ;

      SELECT @v_insert_count = @@ROWCOUNT

    COMMIT

    --=====================================================
    -- All Done report the results
    --=====================================================
    SET @v_step = 400

    SET @p_status = 1
    SET @p_return_msg = 'r_seedpak_matrixdef updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' records inserted.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_r_seedpak_mat_d5dbdde1 FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0

