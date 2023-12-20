--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_stage_customer_e6c79f2
-- Template         :    wsl_sqlserver_proc_dv_stage_sha256
-- Template Version :    8.5.1.0
-- Description      :    Update the Stage Table table stage_customer_national
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Monday, July 24, 2023 at 15:42:31
-- Author           :    Paul Cafarella
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_stage_customer_e6c79f2].update_stage_customer_e6c79f2
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

    SET @v_sql = N'TRUNCATE TABLE [TABLEOWNER].[stage_customer_national]';
    EXEC @v_return_status = sp_executesql @v_sql

    --=====================================================
    -- Insert new records
    --=====================================================
    SET @v_step = 300

    BEGIN TRANSACTION

      INSERT INTO [TABLEOWNER].[stage_customer_national]
      ( hk_h_customer
      , account_no
      , account_no_bkcc
      , tenant_id
      , acctname
      , acctfactor
      , lastdate
      , lasttool
      , lastuser
      , mas90code
      , date_establishd
      , dso
      , customertype
      , creationdate
      , national_acct_flag
      , active
      , sample_state
      , buyer_type
      , market_segment
      , industry_sector
      , pace_excludeinflation
      , dss_change_hash_customer_mroc_national
      , dss_record_source
      , dss_load_date
      , dss_create_time)
      SELECT  CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(load_accountdef_national.acctnum AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_customer
           , load_accountdef_national.acctnum AS account_no
           , 'lims80' AS account_no_bkcc
           , 'lims80' AS tenant_id
           , load_accountdef_national.acctname AS acctname
           , load_accountdef_national.acctfactor AS acctfactor
           , load_accountdef_national.lastdate AS lastdate
           , load_accountdef_national.lasttool AS lasttool
           , load_accountdef_national.lastuser AS lastuser
           , load_accountdef_national.mas90code AS mas90code
           , load_accountdef_national.date_establishd AS date_establishd
           , load_accountdef_national.dso AS dso
           , load_accountdef_national.customertype AS customertype
           , load_accountdef_national.creationdate AS creationdate
           , load_accountdef_national.national_acct_flag AS national_acct_flag
           , load_clients_national.active AS active
           , load_clients_national.sample_state AS sample_state
           , load_clients_national.buyer_type AS buyer_type
           , load_clients_national.market_segment AS market_segment
           , load_clients_national.industry_sector AS industry_sector
           , load_accountdef_national.exclude_scinfl AS pace_excludeinflation
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(load_accountdef_national.acctname AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.acctfactor AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.lastdate AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.lasttool AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.lastuser AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.mas90code AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.date_establishd AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.dso AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.customertype AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.creationdate AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.national_acct_flag AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.active AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.sample_state AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.buyer_type AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.market_segment AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_clients_national.industry_sector AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(load_accountdef_national.exclude_scinfl AS VARCHAR(MAX)),'null')
               ),2) AS dss_change_hash_customer_mroc_national
           , load_clients_national.dss_record_source AS dss_record_source
           , load_clients_national.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_create_time
      FROM [TABLEOWNER].[load_accountdef_national] load_accountdef_national
				LEFT OUTER JOIN [load].[load_clients_national_v] load_clients_national
				ON load_clients_national.acctnum = load_accountdef_national.acctnum
      WHERE projectnum is null
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
    SET @p_return_msg = 'stage_customer_national updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_stage_customer_e6c79f2 FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0
