--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_s_department__7b46ede5
-- Template         :    wsl_sqlserver_proc_dv_perm
-- Template Version :    8.5.1.0
-- Description      :    Update the Satellite table s_department_test_status_tran_national
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Thursday, July 13, 2023 at 16:44:00
-- Author           :
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_s_department__7b46ede5].update_s_department__7b46ede5
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


    INSERT INTO [TABLEOWNER].[s_department_test_status_tran_national]
      ( hk_l_department_test_status
      , process_status_batch_no
      , dstatusdate
      , lasttool
      , lastuser
      , dss_change_hash
      , dss_record_source
      , dss_load_date
      , dss_start_date
      , dss_version
      , dss_create_time)
    SELECT DISTINCT stage_department_test_status_national.hk_l_department_test_status AS hk_l_department_test_status
           , stage_department_test_status_national.process_status_batch_no AS process_status_batch_no
           , stage_department_test_status_national.dstatusdate AS dstatusdate
           , stage_department_test_status_national.lasttool AS lasttool
           , stage_department_test_status_national.lastuser AS lastuser
           , stage_department_test_status_national.dss_change_hash_department_test_status_tran_national AS dss_change_hash
           , stage_department_test_status_national.dss_record_source AS dss_record_source
           , stage_department_test_status_national.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_start_date
           , ISNULL(current_rows.dss_version,0) + 1 AS dss_version
           , @v_current_datetime AS dss_create_time
    FROM [TABLEOWNER].[stage_department_test_status_national] stage_department_test_status_national
    LEFT OUTER JOIN (
            SELECT s_department_test_status_tran_national.hk_l_department_test_status
                 , MAX(s_department_test_status_tran_national.dss_start_date) AS dss_start_date
                 , MAX(s_department_test_status_tran_national.dss_version) AS dss_version
            FROM   [TABLEOWNER].[s_department_test_status_tran_national] s_department_test_status_tran_national
            GROUP BY s_department_test_status_tran_national.hk_l_department_test_status
            ) AS current_rows
      ON  stage_department_test_status_national.hk_l_department_test_status = current_rows.hk_l_department_test_status
    WHERE NOT EXISTS (
        SELECT 1
        FROM   [TABLEOWNER].[s_department_test_status_tran_national] s_department_test_status_tran_national
        WHERE  stage_department_test_status_national.hk_l_department_test_status = s_department_test_status_tran_national.hk_l_department_test_status
        AND    stage_department_test_status_national.dss_change_hash_department_test_status_tran_national = s_department_test_status_tran_national.dss_change_hash
        AND    current_rows.dss_start_date = s_department_test_status_tran_national.dss_start_date
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
    SET @p_return_msg = 's_department_test_status_tran_national updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_s_department__7b46ede5 FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0
