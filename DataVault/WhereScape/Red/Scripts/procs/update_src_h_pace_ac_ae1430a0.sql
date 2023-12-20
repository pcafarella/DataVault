--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_src_h_pace_ac_ae1430a0
-- Template         :    wsl_sqlserver_proc_dv_perm
-- Template Version :    8.5.1.0
-- Description      :    Update the Hub table h_pace_account
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Wednesday, March 08, 2023 at 10:46:08
-- Author           :
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_src_h_pace_ac_ae1430a0].update_src_h_pace_ac_ae1430a0
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


    INSERT INTO [TABLEOWNER].[h_pace_account]
      ( hk_h_pace_account
      , pace_account_no
      , pace_account_no_bkcc
      , tenant_id
      , dss_record_source
      , dss_load_date
      , dss_create_time)
    SELECT DISTINCT stage_pace_account_paceport.hk_h_pace_account AS hk_h_pace_account
           , stage_pace_account_paceport.pace_account_no AS pace_account_no
           , stage_pace_account_paceport.pace_account_no_bkcc AS pace_account_no_bkcc
           , stage_pace_account_paceport.tenant_id AS tenant_id
           , stage_pace_account_paceport.dss_record_source AS dss_record_source
           , stage_pace_account_paceport.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_create_time
    FROM [TABLEOWNER].[stage_pace_account_paceport] stage_pace_account_paceport
    WHERE NOT EXISTS (
        SELECT 1
        FROM   [TABLEOWNER].[h_pace_account] h_pace_account
        WHERE  stage_pace_account_paceport.pace_account_no = h_pace_account.pace_account_no
        AND    stage_pace_account_paceport.pace_account_no_bkcc = h_pace_account.pace_account_no_bkcc
        AND    stage_pace_account_paceport.tenant_id = h_pace_account.tenant_id
        )
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
    SET @p_return_msg = 'h_pace_account updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_src_h_pace_ac_ae1430a0 FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0
