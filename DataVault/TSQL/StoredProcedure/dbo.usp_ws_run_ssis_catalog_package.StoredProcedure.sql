/****** Object:  StoredProcedure [dbo].[usp_ws_run_ssis_catalog_package]    Script Date: 12/20/2023 12:55:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ws_run_ssis_catalog_package]
   @p_sequence integer
 , @p_job_name varchar(256)
 , @p_task_name varchar(256)
 , @p_job_id integer
 , @p_task_id integer
 , @p_return_msg varchar(256) OUTPUT
 , @p_status integer  OUTPUT
 
AS  
 
 SET XACT_ABORT OFF  -- Turn off auto abort on errors  
 SET NOCOUNT ON      -- Turn off row count messages  
 --===============================================================  

-- Control variables used in most programs  
--===============================================================  
 DECLARE @v_msgtext varchar(256) -- Text for audit_trail  
  , @v_step  integer      -- return code 
  , @v_update_count    integer      -- no of records updated 
  , @v_insert_count    integer      -- no of records inserted  
  , @v_count  integer      -- General counter  
  , @v_return_status   integer      -- Query result status  
  , @v_row_count       integer      -- Query returned row count  
  , @v_db_code varchar(10)  -- Database error code  
  , @v_db_msg varchar(100) -- Database error message  
 --=============================================================== 
  
  -- Main  --===============================================================  
  SET @v_step = 100  
  SET @v_update_count = 0  SET @v_insert_count = 0
  

--===============================================================  
--Process Package  
--***************************************************************  
DECLARE
	  @v_return_msg     VARCHAR(MAX)
	, @param_string     VARCHAR(8000)
	, @execution_id     BIGINT
	, @package VARCHAR(8000)
	, @project VARCHAR(8000)
	, @folder VARCHAR(8000)
	, @environment_name VARCHAR(8000)
	, @environment_id   BIGINT
	, @logging_level    SMALLINT
	, @syncronised_exec SMALLINT
	, @delimiter        VARCHAR(255)
	, @ssis_error_txt   VARCHAR(255)  
  
-- set variable defaults  
SELECT @v_return_status = 0, @delimiter = '|' -- delimiter for split function  
     
-- set variable from the parameter containing details of the package   
SET @param_string = (SELECT dbo.WsParameterReadF ('pSSIS_Package'))
     
-- set input variable values 
SELECT  @folder  = (SELECT Item FROM dbo.ufn_split_string (@param_string,@delimiter) WHERE Ordinal = 1)
, @project = (SELECT Item FROM dbo.ufn_split_string (@param_string,@delimiter) WHERE Ordinal = 2)
, @package = (SELECT Item FROM dbo.ufn_split_string (@param_string,@delimiter) WHERE Ordinal = 3)
, @environment_name = (SELECT Item FROM dbo.ufn_split_string (@param_string,@delimiter) WHERE Ordinal = 4)
, @logging_level    = (SELECT ISNULL(Item,1) FROM dbo.ufn_split_string (@param_string,@delimiter) WHERE Ordinal = 5)  -- default logging = basic (1)
, @syncronised_exec = (SELECT ISNULL(Item,1) FROM dbo.ufn_split_string (@param_string,@delimiter) WHERE Ordinal = 6) -- default sync = true (1)  
      
SELECT @environment_id   = 2--(SELECT reference_id FROM [SSISDB].[catalog].[environment_references] WHERE environment_name = @environment_name  AND environment_folder_name = @folder)  
SELECT
@environment_name = 'testenv'-- CASE WHEN @environment_name IS NULL THEN 1 ELSE @environment_name END
	  ,@logging_level = CASE WHEN @logging_level IS NULL THEN 1 ELSE @logging_level END
	 , @syncronised_exec = CASE WHEN @syncronised_exec IS NULL THEN 1 ELSE @syncronised_exec END  

BEGIN TRY 
BEGIN
   -- create package execution container
	   EXEC [SSISDB].[catalog].[create_execution]  
	      @package_name    = @package
		, @execution_id    = @execution_id OUTPUT
		, @folder_name     = @folder
		, @project_name = @project
		, @reference_id    = @environment_id
		, @use32bitruntime = FALSE;

	-- set logging level paramter value
	EXEC [SSISDB].[catalog].[set_execution_parameter_value]  
	  @execution_id
	, @object_type     = 50 -- execution param
	, @parameter_name  = N'LOGGING_LEVEL'
	, @parameter_value = @logging_level;
	
	-- set sync/non-sync execution mode
	EXEC [SSISDB].[catalog].[set_execution_parameter_value] 
	  @execution_id -- execution_id from catalog.create_execution
	, @object_type   = 50 -- execution param
	, @parameter_name  = N'SYNCHRONIZED'
	, @parameter_value = @syncronised_exec;

	-- set your own custom paramter values here if required

	-- execute the package itself
	EXEC [SSISDB].[catalog].[start_execution] @execution_id; 

	END

	  -- if a an execution error occurs then raise a custom error message
			-- note: if an ssis error occurs the sprocs will succeed which is why we need this step      
	IF EXISTS (SELECT 1 FROM [SSISDB].[catalog].[executions] WHERE execution_id = @execution_id AND [status] IN (4, 6) )-- failure, ended unexpectedly statuses
	 
    BEGIN
			SET @ssis_error_txt = 'SSIS Package error occurred. Check SSIS catalog view [catalog].[operation_messages] for details. 
			SELECT * FROM [SSISDB].[catalog].[operation_messages] WHERE operation_id = '+ CAST (@execution_id AS VARCHAR(64))
			RAISERROR(@ssis_error_txt,16,1)
    END    

	-- set the success return values
	 SET @v_return_status = ISNULL(ERROR_NUMBER(),0)
	 SET @v_return_msg    = 'SSIS Package execution succeeded. Check SSIS catalog view [catalog].[executions] for details. execution id = ' + CAST (@execution_id AS VARCHAR(64))   
 END TRY 

 -- catch the error if it occurs 
 BEGIN CATCH
 -- set the error return values

	SET @v_return_status = ISNULL(ERROR_NUMBER(),0)
	SET @v_return_msg    = ERROR_MESSAGE() 
END CATCH  

SELECT @v_count = @@SPID  
SELECT @v_return_status = @v_return_status  
		  , @v_row_count     = @@ROWCOUNT  

--===============================================================  

-- Handle Error  --===============================================================  
IF @v_return_status <> 0 
BEGIN    
	SET @v_db_code = CONVERT(varchar, @v_return_status)   
	SELECT @v_db_msg = description FROM master.dbo.sysmessages    
	WHERE error = @v_return_status    
	SET @p_return_msg = 'Unhandled Exception in usp_ws_run_ssis_catalog_package at step '      + CONVERT(varchar,@v_step) +  SUBSTRING(@v_db_msg,1,150)    
	EXEC @v_return_status = WsWrkAudit 'F',@p_job_name,@p_task_name,    @p_sequence,@p_return_msg,@v_return_msg,@v_return_msg,@p_task_id,@p_job_id    
	SET @p_status = -3    
	RETURN 0 
  END 
  
  --***************************************************************  
   --End of custom code.  --===============================================================  
   --===============================================================  
   --All Done report the results and return.  
   --p_status is the return code. Valid values are:  
   --  1  successful completion  
   -- -2  failed with error 
   -- -3  failed with unhandled error  
   -- p_return_msg is a 256 character message which should  
   --  provide a summary of the result of this procedure.  
   
   --===============================================================  
SET @v_step = 200  
SET @p_status = 1  
SET @p_return_msg = 'usp_ws_run_ssis_catalog_package completed. '    + @v_return_msg  

RETURN 0

  

GO
