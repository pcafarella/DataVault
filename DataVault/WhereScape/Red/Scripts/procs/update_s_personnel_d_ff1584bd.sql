--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_s_personnel_d_ff1584bd
-- Template         :    wsl_sqlserver_proc_dv_perm_sha256
-- Template Version :    8.5.1.0
-- Description      :    Update the Satellite table s_personnel_department_hours_tran
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Tuesday, October 31, 2023 at 13:09:23
-- Author           :
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_s_personnel_d_ff1584bd].update_s_personnel_d_ff1584bd
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


    INSERT INTO [TABLEOWNER].[s_personnel_department_hours_tran]
      ( hk_l_personnel_department_hours
      , reports_to_file_number
      , hours
      , business_unit
      , dss_change_hash
      , dss_record_source
      , dss_load_date
      , dss_start_date
      , dss_version
      , dss_create_time)
    SELECT --DISTINCT
stage_personnel_department_hours.hk_l_personnel_department_hours AS hk_l_personnel_department_hours
           , stage_personnel_department_hours.reports_to_file_number AS reports_to_file_number
           , stage_personnel_department_hours.hours AS hours
           , stage_personnel_department_hours.business_unit AS business_unit
           , stage_personnel_department_hours.dss_change_hash_personnel_department_hours_tran AS dss_change_hash
           , stage_personnel_department_hours.dss_record_source AS dss_record_source
           , stage_personnel_department_hours.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_start_date
           , ISNULL(current_rows.dss_version,0) + 1 AS dss_version
           , @v_current_datetime AS dss_create_time
    FROM [TABLEOWNER].[stage_personnel_department_hours] stage_personnel_department_hours
    LEFT OUTER JOIN (
            SELECT s_personnel_department_hours_tran.hk_l_personnel_department_hours
                 , MAX(s_personnel_department_hours_tran.dss_start_date) AS dss_start_date
                 , MAX(s_personnel_department_hours_tran.dss_version) AS dss_version
            FROM   [TABLEOWNER].[s_personnel_department_hours_tran] s_personnel_department_hours_tran
            GROUP BY s_personnel_department_hours_tran.hk_l_personnel_department_hours
            ) AS current_rows
      ON  stage_personnel_department_hours.hk_l_personnel_department_hours = current_rows.hk_l_personnel_department_hours
    WHERE NOT EXISTS (
        SELECT 1
        FROM   [TABLEOWNER].[s_personnel_department_hours_tran] s_personnel_department_hours_tran
        WHERE  stage_personnel_department_hours.hk_l_personnel_department_hours = s_personnel_department_hours_tran.hk_l_personnel_department_hours
        AND    stage_personnel_department_hours.dss_change_hash_personnel_department_hours_tran = s_personnel_department_hours_tran.dss_change_hash
        AND    current_rows.dss_start_date = s_personnel_department_hours_tran.dss_start_date
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
    SET @p_return_msg = 's_personnel_department_hours_tran updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_s_personnel_d_ff1584bd FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0