-- =============================================================================
-- DBMS Name      :    SQL Server
-- Script Name    :    get_dim_date_key
-- Description    :    Get the key for the dimension dim_date
-- Author         :    WhereScape
-- =============================================================================
-- Notes / History
-- 20170214 Multi Database update.RED-7769
-- 20190129 RED-10090 Changed procedure location markup for Multi-DB

CREATE PROCEDURE [SCHEMA.get_dim_date_key].get_dim_date_key
  @p_calendar_date                  datetime
, @p_auto_add                       varchar(1)
, @p_log_error                      varchar(1)
, @p_sequence                       integer
, @p_job_name                       varchar(256)
, @p_task_name                      varchar(256)
, @p_job_id                         integer
, @p_task_id                        integer
, @p_dim_date_key                   integer OUTPUT
, @p_status                         integer OUTPUT
AS
  SET NOCOUNT ON  --  Turn off row count messages

  --=====================================================
  -- Control variables used in most programs
  --=====================================================
  DECLARE
    @v_msgtext         varchar(255)  -- Text for audit_trail
  , @v_step            integer       -- debug step
  , @v_return_status   integer       -- sub procedure status

  --=====================================================
  -- MAIN
  --=====================================================

  SET @v_step = 1
  SET @p_status = 0
  SET @p_dim_date_key = 0 -- default return value

  --=====================================================
  -- Check that no business keys are null
  --=====================================================
  IF @p_calendar_date IS NULL
  BEGIN
    IF @p_log_error = 'Y'
    BEGIN
      SET @v_msgtext = 'Null value in calendar_date'
      EXEC [METABASE].WsWrkError
          @p_status_code = 'W'
        , @p_job_name    = @p_job_name
        , @p_task_name   = @p_task_name
        , @p_sequence    = @p_sequence
        , @p_message     = @v_msgtext
        , @p_db_code     = NULL
        , @p_db_msg      = NULL
        , @p_task_key    = @p_job_id
        , @p_job_key     = @p_task_id
        , @p_msg_type    = 'NULL_KEY'
        , @p_result_status = @v_return_status OUTPUT
    END
    RETURN 0
  END


  --=====================================================
  -- Lookup the key
  --=====================================================
  SET @v_step = 100
  SET @p_dim_date_key = NULL
  SELECT @p_dim_date_key = dim_date_key
  FROM   [TABLEOWNER].[dim_date]
  WHERE  calendar_date = @p_calendar_date

  --=====================================================
  -- If not found then add it if we have the flag set.
  --=====================================================

  IF @p_dim_date_key IS NOT NULL  -- Key found
  BEGIN
    SET @p_status = 1
    RETURN 0
  END
  ELSE  -- Key not found
  BEGIN
    IF @p_auto_add = 'Y'
    BEGIN
      INSERT INTO [TABLEOWNER].[dim_date]
      ( calendar_date
      , dss_update_time
      )
      VALUES
      ( @p_calendar_date
      , GETDATE()
      )
      SELECT @p_dim_date_key = @@IDENTITY -- get last inserted key value
      COMMIT;
      SET @p_status = 2

      --=====================================================
      -- If requested log a message about the auto add
      --=====================================================
      IF @p_log_error = 'Y'
      BEGIN
        SET @v_msgtext = 'Auto added dimension row '
          + CONVERT(varchar,@p_calendar_date)
        EXEC [METABASE].WsWrkError
            @p_status_code = 'W'
          , @p_job_name    = @p_job_name
          , @p_task_name   = @p_task_name
          , @p_sequence    = @p_sequence
          , @p_message     = @v_msgtext
          , @p_db_code     = NULL
          , @p_db_msg      = NULL
          , @p_task_key    = @p_job_id
          , @p_job_key     = @p_task_id
          , @p_msg_type    = 'AUTO_ADD'
          , @p_result_status = @v_return_status OUTPUT
      END  -- End log auto add message
    END  -- End of auto add
    ELSE  -- Else no auto add
    BEGIN
      SET @p_dim_date_key = 0 -- not found result
      --=====================================================
      -- If requested log a message about the lookup failure
      --=====================================================
      IF @p_log_error = 'Y'
      BEGIN
        SET @v_msgtext = 'Unmatched key lookup '
          + CONVERT(varchar,@p_calendar_date);
        EXEC [METABASE].WsWrkError
            @p_status_code = 'W'
          , @p_job_name    = @p_job_name
          , @p_task_name   = @p_task_name
          , @p_sequence    = @p_sequence
          , @p_message     = @v_msgtext
          , @p_db_code     = NULL
          , @p_db_msg      = NULL
          , @p_task_key    = @p_job_id
          , @p_job_key     = @p_task_id
          , @p_msg_type    = 'LOOKUP'
          , @p_result_status = @v_return_status OUTPUT
      END  -- End lookup failed message
    END  -- End of no auto add
  END  -- End of key not found
  RETURN 0

