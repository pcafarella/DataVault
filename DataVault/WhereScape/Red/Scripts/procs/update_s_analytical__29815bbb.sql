--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_s_analytical__29815bbb
-- Template         :    wsl_sqlserver_proc_dv_perm
-- Template Version :    8.5.1.0
-- Description      :    Update the Satellite table s_analytical_instrument_mroc_national
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Friday, August 11, 2023 at 17:46:32
-- Author           :
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_s_analytical__29815bbb].update_s_analytical__29815bbb
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


    INSERT INTO [TABLEOWNER].[s_analytical_instrument_mroc_national]
      ( hk_h_analytical_instrument
      , certification_req
      , service_status
      , instrument_type
      , instrument_model
      , serial_number
      , description
      , location
      , calib_days
      , calib_desc
      , last_calib
      , next_calib
      , service_days
      , service_desc
      , last_service
      , next_service
      , capacity
      , capacity_samp_test
      , instrument_cost
      , lasttool
      , lastuser
      , lastdate
      , computername
      , datapath
      , raw_data_mode
      , analysis_location_code
      , tzcode
      , dss_change_hash
      , dss_record_source
      , dss_load_date
      , dss_start_date
      , dss_version
      , dss_create_time)
    SELECT DISTINCT stage_analytical_instrument_national.hk_h_analytical_instrument AS hk_h_analytical_instrument
           , stage_analytical_instrument_national.certification_req AS certification_req
           , stage_analytical_instrument_national.service_status AS service_status
           , stage_analytical_instrument_national.instrument_type AS instrument_type
           , stage_analytical_instrument_national.instrument_model AS instrument_model
           , stage_analytical_instrument_national.serial_number AS serial_number
           , stage_analytical_instrument_national.description AS description
           , stage_analytical_instrument_national.location AS location
           , stage_analytical_instrument_national.calib_days AS calib_days
           , stage_analytical_instrument_national.calib_desc AS calib_desc
           , stage_analytical_instrument_national.last_calib AS last_calib
           , stage_analytical_instrument_national.next_calib AS next_calib
           , stage_analytical_instrument_national.service_days AS service_days
           , stage_analytical_instrument_national.service_desc AS service_desc
           , stage_analytical_instrument_national.last_service AS last_service
           , stage_analytical_instrument_national.next_service AS next_service
           , stage_analytical_instrument_national.capacity AS capacity
           , stage_analytical_instrument_national.capacity_samp_test AS capacity_samp_test
           , stage_analytical_instrument_national.instrument_cost AS instrument_cost
           , stage_analytical_instrument_national.lasttool AS lasttool
           , stage_analytical_instrument_national.lastuser AS lastuser
           , stage_analytical_instrument_national.lastdate AS lastdate
           , stage_analytical_instrument_national.computername AS computername
           , stage_analytical_instrument_national.datapath AS datapath
           , stage_analytical_instrument_national.raw_data_mode AS raw_data_mode
           , stage_analytical_instrument_national.analysis_location_code AS analysis_location_code
           , stage_analytical_instrument_national.tzcode AS tzcode
           , stage_analytical_instrument_national.dss_change_hash_analytical_instrument_mroc_national AS dss_change_hash
           , stage_analytical_instrument_national.dss_record_source AS dss_record_source
           , stage_analytical_instrument_national.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_start_date
           , ISNULL(current_rows.dss_version,0) + 1 AS dss_version
           , @v_current_datetime AS dss_create_time
    FROM [TABLEOWNER].[stage_analytical_instrument_national] stage_analytical_instrument_national
    LEFT OUTER JOIN (
            SELECT s_analytical_instrument_mroc_national.hk_h_analytical_instrument
                 , MAX(s_analytical_instrument_mroc_national.dss_start_date) AS dss_start_date
                 , MAX(s_analytical_instrument_mroc_national.dss_version) AS dss_version
            FROM   [TABLEOWNER].[s_analytical_instrument_mroc_national] s_analytical_instrument_mroc_national
            GROUP BY s_analytical_instrument_mroc_national.hk_h_analytical_instrument
            ) AS current_rows
      ON  stage_analytical_instrument_national.hk_h_analytical_instrument = current_rows.hk_h_analytical_instrument
    WHERE NOT EXISTS (
        SELECT 1
        FROM   [TABLEOWNER].[s_analytical_instrument_mroc_national] s_analytical_instrument_mroc_national
        WHERE  stage_analytical_instrument_national.hk_h_analytical_instrument = s_analytical_instrument_mroc_national.hk_h_analytical_instrument
        AND    stage_analytical_instrument_national.dss_change_hash_analytical_instrument_mroc_national = s_analytical_instrument_mroc_national.dss_change_hash
        AND    current_rows.dss_start_date = s_analytical_instrument_mroc_national.dss_start_date
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
    SET @p_return_msg = 's_analytical_instrument_mroc_national updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_s_analytical__29815bbb FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0
