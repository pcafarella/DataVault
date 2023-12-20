-- =============================================================================
-- DBMS Name      :    Sql Server
-- Script Name    :    update_dss_source_system
-- Description    :    Update the dimension dss_source_system
-- Author         :    WhereScape
-- =============================================================================
-- Notes / History
-- 20170214 Multi Database update.RED-7769
-- 20190129 RED-10090 Changed procedure location markup for Multi-DB

CREATE PROCEDURE [SCHEMA.update_dss_source_system].update_dss_source_system
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
  -- Dimension Table Variables
  --=====================================================
  DECLARE
    @v_dim_dss_source_system_name    varchar(64)
  , @v_dim_dss_source_active_from    datetime
  , @v_dim_dss_source_active_to      datetime
  , @v_dim_dss_source_system_key     integer


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
    @v_step                           = 1
  , @v_dim_dss_source_system_name     = 'unknown dimension'
  , @v_dim_dss_source_system_key      = 1

  --=====================================================
  -- Every dimension table should have a 0 row for
  -- when the dimension is null
  --=====================================================
  SET @v_step = 10
  SET @v_count = 0
  SET @v_count = 0
  SELECT @v_count = 1
  FROM  [TABLEOWNER].[dss_source_system]
  WHERE dss_source_system_key = 0

  BEGIN TRANSACTION

  -- Allow explicit value to be inserted into IDENTITY field
  SET IDENTITY_INSERT [TABLEOWNER].[dss_source_system] ON

  IF @v_count = 0  -- Unknown dimension record does not exist
  BEGIN
    SET @v_step = 20

    INSERT INTO [TABLEOWNER].[dss_source_system]
    ( dss_source_system_key
    , dss_source_system_name
    )
    VALUES
    ( 0
    , @v_dim_dss_source_system_name
    )

    SET @v_insert_count = @v_insert_count + 1
  END

  --=====================================================
  -- Default Legacy system record
  --=====================================================
  SELECT @v_count = 1
  FROM  [TABLEOWNER].[dss_source_system]
  WHERE dss_source_system_key = 1

  IF @v_count = 0  -- Legacy record does not exist
  BEGIN
    SET @v_step = 30

    -- Allow explicit value to be inserted into IDENTITY field
    SET IDENTITY_INSERT [TABLEOWNER].[dss_source_system] ON
    INSERT INTO [TABLEOWNER].[dss_source_system]
    ( dss_source_system_key
    , dss_source_system_name
    )
    VALUES
    ( 1
    , 'Legacy'
    )

    SET @v_insert_count = @v_insert_count + 1
  END

  --=====================================================
  -- Data Warehouse record
  --=====================================================
  SELECT @v_count = 1
  FROM  [TABLEOWNER].[dss_source_system]
  WHERE dss_source_system_key = 2

  IF @v_count = 0  -- Data Warehouse record does not exist
  BEGIN
    SET @v_step = 40

    -- Allow explicit value to be inserted into IDENTITY field
    SET IDENTITY_INSERT [TABLEOWNER].[dss_source_system] ON
    INSERT INTO [TABLEOWNER].[dss_source_system]
    ( dss_source_system_key
    , dss_source_system_name
    )
    VALUES
    ( 2
    , 'Data Warehouse'
    )
    SET @v_insert_count = @v_insert_count + 1
  END

  -- Restore default handling of IDENTITY field
  SET IDENTITY_INSERT [TABLEOWNER].[dss_source_system] OFF

  COMMIT

  --=====================================================
  -- All Done report the results
  --=====================================================
  SET @v_step = 200
  SET @p_status = 1
  SET @p_return_msg = 'dss_source_system updated. '
    + CONVERT(varchar,@v_insert_count) + ' new records. '
    + CONVERT(varchar,@v_update_count) + ' records updated.'

  RETURN 0


