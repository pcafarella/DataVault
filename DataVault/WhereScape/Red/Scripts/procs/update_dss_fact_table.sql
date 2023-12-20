-- =============================================================================
-- DBMS Name      :    Sql Server
-- Script Name    :    update_dss_fact_table
-- Description    :    Update the dimension dss_fact_table
-- Author         :    WhereScape
-- =============================================================================
-- Notes / History
-- 20170214 Multi Database update.RED-7769
-- 20190129 RED-10090 Changed procedure location markup for Multi-DB

CREATE PROCEDURE [SCHEMA.update_dss_fact_table].update_dss_fact_table
  @p_sequence         integer
, @p_job_name         varchar(256)
, @p_task_name        varchar(256)
, @p_job_id           integer
, @p_task_id          integer
, @p_return_msg       varchar(256) OUTPUT
, @p_status           integer      OUTPUT
AS
  SET NOCOUNT ON      -- Turn off row count messages

  --=====================================================
  -- Control variables used in most programs
  --=====================================================
  DECLARE
    @v_MsgText         varchar(255)  -- Text for audit_trail
  , @v_Sql             nvarchar(255) -- Text for sql statements
  , @v_set             integer       -- commit set
  , @v_analyze_flag    integer       -- analyze flag
  , @v_step            integer       -- return code
  , @v_update_count    integer       -- no of records updated
  , @v_insert_count    integer       -- no of records inserted
  , @v_count           integer       -- General counter
  , @v_db_code         varchar(10)   -- Database error code
  , @v_db_msg          varchar(100)  -- Database error message

  --=====================================================
  -- General Variables
  --=====================================================
  DECLARE
    @v_return_status   integer       -- Update result status
  , @v_row_count       integer       -- General row count

  --=====================================================
  -- Select all input columns for all dimension rows
  --=====================================================

  DECLARE c_Load CURSOR FAST_FORWARD READ_ONLY FOR
    SELECT
      ft_table_name
    , ft_type_ind
    FROM
      [METABASE].ws_fact_tab;

  --=====================================================
  -- Load Cursor Variables
  --=====================================================
  DECLARE
    @v_load_ft_table_name    varchar(64)
  , @v_load_ft_type_ind      varchar(1)

  --=====================================================
  -- Dimension Table Variables
  --=====================================================
  DECLARE
    @v_dim_dss_fact_table_name    varchar(64)
  , @v_dim_dss_fact_table_type    varchar(24)


  --=====================================================
  -- MAIN
  --=====================================================
  -- Set initial variable values
  SELECT
    @v_set          = 0
  , @v_analyze_flag = 0
  , @v_step         = 0
  , @v_update_count = 0
  , @v_insert_count = 0

  -- Set values for unknown dimension record
  SELECT
    @v_step                        = 1
  , @v_dim_dss_fact_table_name     = 'unknown dimension'
  , @v_dim_dss_fact_table_type     = 'unknown dimension'

  --=====================================================
  -- Every dimension table should have a 0 row for
  -- when the dimension is null
  --=====================================================
  SET @v_step = 10
  SET @v_count = 0
  SET @v_count = 0
  SELECT @v_count = 1
  FROM  [TABLEOWNER].[dss_fact_table]
  WHERE dss_fact_table_key = 0

  BEGIN TRANSACTION

  IF @v_count = 0  -- Unknown dimension record does not exist
  BEGIN
    SET @v_step = 20

    -- Allow explicit value to be inserted into IDENTITY field
    SET IDENTITY_INSERT [TABLEOWNER].[dss_fact_table] ON
    INSERT INTO [TABLEOWNER].[dss_fact_table]
    ( dss_fact_table_key
    , dss_fact_table_name
    , dss_fact_table_type
    )
    VALUES
    ( 0
    , @v_dim_dss_fact_table_name
    , @v_dim_dss_fact_table_type
    )

    -- Restore default handling of IDENTITY field
    SET IDENTITY_INSERT [TABLEOWNER].[dss_fact_table] OFF

  END

  --=======================================================
  -- Loop through all the input records. Attempt to update
  -- the dimension and if that fails then perform an insert
  --=======================================================
  SET @v_step = 30

  OPEN c_Load
  FETCH NEXT FROM c_Load INTO
    @v_load_ft_table_name
  , @v_load_ft_type_ind

  WHILE @@FETCH_STATUS = 0
  BEGIN

    SELECT
      @v_dim_dss_fact_table_name  = @v_load_ft_table_name

    --===================================================
    -- Set the type based on the indicator
    --===================================================
    SET @v_dim_dss_fact_table_type = 'Unknown'

    IF @v_load_ft_type_ind = 'D'
    BEGIN
        SET @v_dim_dss_fact_table_type = 'Detail'
    END
    IF @v_load_ft_type_ind = 'R'
    BEGIN
        SET @v_dim_dss_fact_table_type = 'Rollup'
    END
    IF @v_load_ft_type_ind = 'K'
    BEGIN
        SET @v_dim_dss_fact_table_type = 'Kpi'
    END
    IF @v_load_ft_type_ind = 'S'
    BEGIN
        SET @v_dim_dss_fact_table_type = 'Kpi'
    END

    --===================================================
    -- Update dss_fact_table
    --===================================================
    UPDATE [TABLEOWNER].[dss_fact_table]
    SET
      dss_fact_table_type  = @v_dim_dss_fact_table_type
    WHERE  dss_fact_table_name = @v_dim_dss_fact_table_name

    SELECT
      @v_return_status = @@ERROR
    , @v_row_count     = @@ROWCOUNT

    --===================================================
    -- If the record is not found then insert it
    --===================================================
    SET @v_step = 100
    IF @v_row_count = 0 -- Mo update occured
    BEGIN
      INSERT INTO [TABLEOWNER].[dss_fact_table] --primary key is populated with an IDENTITY value
      ( dss_fact_table_name
      , dss_fact_table_type
      )
      VALUES
      ( @v_dim_dss_fact_table_name
      , @v_dim_dss_fact_table_type
      )
      SET @v_insert_count = @v_insert_count + 1
    END
    ELSE
    BEGIN
      SET @v_update_count = @v_update_count + 1
    END


    FETCH NEXT FROM c_Load INTO
      @v_load_ft_table_name
    , @v_load_ft_type_ind

  END -- While loop end

  CLOSE c_Load
  DEALLOCATE c_Load

  COMMIT

  --=====================================================
  -- All Done report the results
  --=====================================================
  SET @v_step = 200
  SET @p_status = 1
  SET @p_return_msg = 'dss_fact_table updated. '
    + CONVERT(varchar,@v_insert_count) + ' new records. '
    + CONVERT(varchar,@v_update_count) + ' records updated.'

  RETURN 0


