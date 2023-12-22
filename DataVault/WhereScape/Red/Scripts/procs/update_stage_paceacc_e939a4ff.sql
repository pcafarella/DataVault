--==============================================================================
-- DBMS Name        :    SQL Server
-- Procedure Name   :    update_stage_paceacc_e939a4ff
-- Template         :    wsl_sqlserver_proc_dv_stage_sha256
-- Template Version :    8.5.1.0
-- Description      :    Update the Stage Table table stage_paceaccount_customer_invoice_national
-- Generated by     :    WhereScape RED Version 8.6.6.1 (build 220216-231917)
-- Generated for    :    Pace Analytical Services
-- Generated on     :    Wednesday, March 08, 2023 at 10:45:01
-- Author           :
--==============================================================================
-- Notes / History
--
CREATE PROCEDURE [SCHEMA.update_stage_paceacc_e939a4ff].update_stage_paceacc_e939a4ff
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

    SET @v_sql = N'TRUNCATE TABLE [TABLEOWNER].[stage_paceaccount_customer_invoice_national]';
    EXEC @v_return_status = sp_executesql @v_sql

    --=====================================================
    -- Insert new records
    --=====================================================
    SET @v_step = 300

    BEGIN TRANSACTION

      INSERT INTO [TABLEOWNER].[stage_paceaccount_customer_invoice_national]
      ( hk_l_paceaccount_customer_invoice
      , hk_h_invoice
      , hk_h_pace_account
      , hk_h_customer
      , pace_account_no
      , pace_account_no_bkcc
      , pace_account_no_tenant_id
      , account_no
      , account_no_bkcc
      , account_no_tenant_id
      , invoice_no
      , invoice_no_bkcc
      , invoice_no_tenant_id
      , dss_record_source
      , dss_load_date
      , dss_create_time)
      SELECT  CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(load_invoicedef_national.invoicenum AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(ISNULL(pace_acct_code,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST(ISNULL(load_accountdef_national.acctnum,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_l_paceaccount_customer_invoice
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(load_invoicedef_national.invoicenum AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_invoice
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(ISNULL(pace_acct_code,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_pace_account
           , CONVERT(NVARCHAR(64),HashBytes('SHA2_256',
               COALESCE(CAST(ISNULL(load_accountdef_national.acctnum,'-1') AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null') +'||'+
               COALESCE(CAST('lims80' AS VARCHAR(MAX)),'null')
               ),2) AS hk_h_customer
           , ISNULL(pace_acct_code,'-1') AS pace_account_no
           , 'lims80' AS pace_account_no_bkcc
           , 'lims80' AS pace_account_no_tenant_id
           , ISNULL(load_accountdef_national.acctnum,'-1') AS account_no
           , 'lims80' AS account_no_bkcc
           , 'lims80' AS account_no_tenant_id
           , load_invoicedef_national.invoicenum AS invoice_no
           , 'lims80' AS invoice_no_bkcc
           , 'lims80' AS invoice_no_tenant_id
           , load_invoicedef_national.dss_record_source AS dss_record_source
           , load_invoicedef_national.dss_load_date AS dss_load_date
           , @v_current_datetime AS dss_create_time
      FROM [TABLEOWNER].[load_accountdef_national] load_accountdef_national
INNER JOIN [TABLEOWNER].[load_invoicedef_national] load_invoicedef_national
ON load_invoicedef_national.acctnum = load_accountdef_national.acctnum
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
    SET @p_return_msg = 'stage_paceaccount_customer_invoice_national updated. '
      + CONVERT(VARCHAR,@v_insert_count) + ' new records.'

    RETURN 0

  END TRY
  BEGIN CATCH

    SET @p_status = -2
    SET @p_return_msg = SUBSTRING('update_stage_paceacc_e939a4ff FAILED with error '
      + CONVERT(VARCHAR,ISNULL(ERROR_NUMBER(),0))
      + ' Step ' + CONVERT(VARCHAR,ISNULL(@v_step,0))
      + '. Error Msg: ' + ERROR_MESSAGE(),1,1023)

  END CATCH
  IF XACT_STATE() <> 0
  BEGIN
    ROLLBACK TRANSACTION
  END

  RETURN 0