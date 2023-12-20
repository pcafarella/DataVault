-- ============================================================================
-- DBMS Name 		:	SQL Server
-- Script Name 		:	update_dim_date.sql
-- Description 		:	Update Date dimension
-- Author 		:	WhereScape
-- Date			: 	22 January 2002
-- =============================================================================
-- Notes / History
-- 05/Sep/2011  RED-2240 Changed 0 key date to Jan 1st 1753
-- 09/Sep/2015  RED-5653 Changed 0 key insert error message
-- 24/Jan/2019  RED-10090 Changed procedure location markup for Multi-DB
-- ============================================================================

CREATE PROCEDURE [SCHEMA.update_dim_date].update_dim_date
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
    @v_dim_calendar_date                   datetime
  , @v_dim_dim_date_key                    integer
  , @v_dim_cal_day_in_week                 varchar(3)
  , @v_dim_cal_day_in_week_no              int
  , @v_dim_cal_day_in_month                int
  , @v_dim_cal_day_in_year                 int
  , @v_dim_cal_week_in_year                int
  , @v_dim_cal_month_no                    int
  , @v_dim_cal_month                       int
  , @v_dim_cal_month_name                  varchar(7)
  , @v_dim_cal_quarter_no                  int
  , @v_dim_cal_quarter                     int
  , @v_dim_cal_year                        int
  , @v_dim_financial_date                  datetime
  , @v_dim_fin_day_in_week                 varchar(3)
  , @v_dim_fin_day_in_week_no              int
  , @v_dim_fin_day_in_month                int
  , @v_dim_fin_day_in_year                 int
  , @v_dim_fin_week_in_month               int
  , @v_dim_fin_week_in_year                int
  , @v_dim_fin_month_no                    int
  , @v_dim_fin_month                       int
  , @v_dim_fin_month_name                  varchar(7)
  , @v_dim_fin_period                      varchar(20)
  , @v_dim_fin_quarter_no                  int
  , @v_dim_fin_quarter                     int
  , @v_dim_fin_year                        int
  , @v_dim_current_cal_day                 varchar(8)
  , @v_dim_current_cal_week                varchar(8)
  , @v_dim_current_cal_month               varchar(8)
  , @v_dim_current_cal_year                varchar(8)
  , @v_dim_current_cal_mtd                 varchar(8)
  , @v_dim_current_cal_ytd                 varchar(8)
  , @v_dim_moving_cal_year                 varchar(8)
  , @v_dim_current_fin_day                 varchar(8)
  , @v_dim_current_fin_week                varchar(8)
  , @v_dim_current_fin_month               varchar(8)
  , @v_dim_current_fin_quarter             varchar(8)
  , @v_dim_current_fin_year                varchar(8)
  , @v_dim_current_fin_mtd                 varchar(8)
  , @v_dim_current_fin_ytd                 varchar(8)
  , @v_dim_moving_fin_quarter              varchar(8)
  , @v_dim_moving_fin_year                 varchar(8)
  , @v_dim_week_day_flag                   varchar(1)
  , @v_dim_week_end_flag                   varchar(1)
  , @v_dim_holiday_flag                    varchar(1)
  , @v_dim_holiday_desc                    varchar(64)
  , @v_dim_trading_day_flag                varchar(1)
  , @v_dim_trading_days_in_cal_month       int
  , @v_dim_trading_days_in_month_so_far    int
  , @v_dim_dss_update_time                 datetime


  --=====================================================
  -- Variables specific to this program
  --=====================================================
  DECLARE
    @v_start_week      integer
  , @v_last_week       integer
  , @v_start_day       integer
  , @v_start_date      datetime
  , @v_current_date    datetime
  , @v_end_date        datetime
  , @v_no_of_days      integer
  , @v_man_week        integer
  , @v_man_year        integer
  , @v_days_to_june1   integer
  , @v_days_from_june1 integer
  , @v_weeks_to_june1  integer
  , @v_weeks_from_june1  integer
  , @v_fin_year        integer
  , @v_cal_year        integer
  , @v_cal_month       integer
  , @v_days            integer
  , @v_month_no        integer
  , @v_period          integer
  , @v_trading_days_so_far integer

  SET @v_insert_count = 0
  SET @v_update_count = 0

  -- Check to make sure we have a record for the 0 date
  -- and if not add it
  SET @v_count = 0
  SELECT @v_count = 1
  FROM  [TABLEOWNER].[dim_date]
  WHERE dim_date_key = 0

  IF @v_count = 0  -- Unknown dimension record does not exist
  BEGIN
    SET @v_step = 20
    BEGIN TRANSACTION

    INSERT INTO [TABLEOWNER].[dim_date]
    ( dim_date_key
    , cal_month
    , cal_year
    , fin_month
    , fin_year
    , calendar_date
    , dss_update_time
    )
    VALUES
    ( 0
    , 0
    , 0
    , 0
    , 0
    , CONVERT(DATETIME,'17530101',112)
    , GETDATE()
    )

    SELECT
      @v_return_status = @@ERROR
    , @v_row_count = @@ROWCOUNT

    IF @v_return_status <> 0
    BEGIN
      ROLLBACK
      SET @p_return_msg = 'Failed Insert into table dim_date'
      SET @v_db_code = CONVERT(varchar, @v_return_status)
      EXEC [METABASE].WsWrkAudit 'E', @p_job_name, @p_task_name, @p_sequence,
        @p_return_msg, @v_db_code, 'Unknown dimension could not be inserted', @p_task_id, @p_job_id
      SET @p_status = -2
      RETURN 0
    END
    COMMIT
  END

    SET @v_step = 10
    SET @v_no_of_days = 5000 -- number of days into future to generate records

    SET @v_start_date = CONVERT(DATETIME,(CONVERT(VARCHAR,GETDATE()-@v_no_of_days,112)))
    SET @v_end_date = CONVERT(DATETIME,(CONVERT(VARCHAR,GETDATE()+@v_no_of_days,112)))
    --*************** change the line below to v_current_date := sysdate after inital load *******
    SET @v_current_date = @v_start_date -- normally set to sysdate. Start date for intitial load
    --v_current_date := sysdate-1; -- normally set to sysdate. Start date for intitial load
    SET @v_step = 20
    SET @v_dim_trading_days_in_month_so_far = 0

    BEGIN TRANSACTION
    WHILE @v_current_date <= @v_end_date
    BEGIN

      SET @v_dim_dim_date_key = CONVERT(integer,DATEPART(yyyy,@v_current_date))*10000
        + CONVERT(integer,DATEPART(mm,@v_current_date))*100
        + CONVERT(integer,DATEPART(dd,@v_current_date))

      SET @v_dim_cal_month_no = CONVERT(integer,DATEPART(mm,@v_current_date))
      SET @v_dim_cal_year = CONVERT(integer,DATEPART(yyyy,@v_current_date))
      SET @v_dim_cal_month = @v_dim_cal_year*100 + @v_dim_cal_month_no;
      SET @v_dim_calendar_date = @v_current_date
      SET @v_step = 30

      --=====================================================
      -- Calendar dates
      -- Oracle uses Sun 1 to Sat 7.  Here we use Sun 1 to Sat 7
      --=====================================================
      SET @v_dim_cal_day_in_week = CONVERT(varchar(3),DATENAME(dw,@v_current_date))
      SET @v_dim_cal_day_in_week_no = CONVERT(integer,DATEPART(dw,@v_current_date))
      SET @v_dim_cal_day_in_month = CONVERT(integer,DATEPART(dd,@v_current_date))
      SET @v_dim_cal_day_in_year = CONVERT(integer,DATEPART(dy,@v_current_date))
      SET @v_dim_cal_week_in_year = CONVERT(integer,DATEPART(wk,@v_current_date))
      SET @v_dim_cal_month_name = CONVERT(varchar(3),DATENAME(mm,@v_current_date))
      SET @v_dim_cal_quarter_no = CONVERT(integer,DATEPART(qq,@v_current_date))
      SET @v_dim_cal_quarter = @v_dim_cal_year * 100 + @v_dim_cal_quarter_no

      --=====================================================
      -- Financial dates
      --=====================================================

      SET @v_period = @v_dim_cal_month_no
      SET @v_dim_financial_date = @v_current_date
      SET @v_dim_fin_month_no = CONVERT(integer,DATEPART(mm,@v_current_date))
      SET @v_dim_fin_year = CONVERT(integer,DATEPART(yyyy,@v_current_date))
      SET @v_dim_fin_month = @v_dim_cal_year*100 + @v_dim_cal_month_no;
      SET @v_dim_fin_day_in_week = CONVERT(varchar(3),DATENAME(dw,@v_current_date))
      SET @v_dim_fin_day_in_week_no = CONVERT(integer,DATEPART(dw,@v_current_date))
      SET @v_dim_fin_day_in_month = CONVERT(integer,DATEPART(dd,@v_current_date))
      SET @v_dim_fin_day_in_year = CONVERT(integer,DATEPART(dy,@v_current_date))
      SET @v_dim_fin_week_in_year = CONVERT(integer,DATEPART(wk,@v_current_date))
      SET @v_dim_fin_month_name = CONVERT(varchar(3),DATENAME(mm,@v_current_date))
      SET @v_dim_fin_quarter_no = CONVERT(integer,DATEPART(qq,@v_current_date))
      SET @v_dim_fin_quarter = @v_dim_cal_year * 100 + @v_dim_cal_quarter_no
      SET @v_dim_fin_period = '(' + convert(varchar,@v_dim_fin_year) + '-' +
        convert(varchar(2),@v_dim_fin_month_no) + ')' + @v_dim_fin_month_name +
        '-' + convert(varchar,@v_dim_cal_year)

      --=====================================================
      -- Date flags
      --=====================================================

      SET @v_dim_holiday_flag = 'N'
      SET @v_dim_trading_days_in_cal_month = 0

      -- Compute Week Day and Week End flags.
      IF @v_dim_cal_day_in_week = 'Sat'
      OR @v_dim_cal_day_in_week = 'Sun'
      BEGIN
          SET @v_dim_week_day_flag = 'N'
          SET @v_dim_week_end_flag = 'Y'
      END
      ELSE
      BEGIN
          SET @v_dim_week_day_flag = 'Y'
          SET @v_dim_week_end_flag = 'N'
      END


      IF  CONVERT(integer,DATEPART(dd,@v_current_date)) = 1
      BEGIN
        SET @v_dim_trading_days_in_month_so_far = 0
      END

      -- Compute Trading Day Flag.
      IF ( @v_dim_week_day_flag = 'Y' AND @v_dim_holiday_flag = 'N' )
      BEGIN
          SET @v_dim_trading_day_flag = 'Y'
          SET @v_dim_trading_days_in_month_so_far = @v_dim_trading_days_in_month_so_far + 1
      END
      ELSE
      BEGIN
          SET @v_dim_trading_day_flag = 'N'
      END


      SET @v_step = 100
      UPDATE [TABLEOWNER].[dim_date]
      SET
        cal_month = @v_dim_cal_month,
        cal_month_no = @v_dim_cal_month_no,
        cal_year = @v_dim_cal_year,
        cal_day_in_week = @v_dim_cal_day_in_week,
        cal_day_in_week_no = @v_dim_cal_day_in_week_no,
        cal_day_in_month = @v_dim_cal_day_in_month,
        cal_day_in_year = @v_dim_cal_day_in_year,
        cal_week_in_year = @v_dim_cal_week_in_year,
        cal_month_name = @v_dim_cal_month_name,
        cal_quarter_no = @v_dim_cal_quarter_no,
        cal_quarter = @v_dim_cal_quarter,
        financial_date = @v_dim_financial_date,
        fin_day_in_week = @v_dim_fin_day_in_week,
        fin_day_in_week_no = @v_dim_fin_day_in_week_no,
        fin_day_in_month = @v_dim_fin_day_in_month,
        fin_day_in_year = @v_dim_fin_day_in_year,
        fin_week_in_month = @v_dim_fin_week_in_month,
        fin_week_in_year = @v_dim_fin_week_in_year,
        fin_month_no = @v_dim_fin_month_no,
        fin_month = @v_dim_fin_month,
        fin_month_name = @v_dim_fin_month_name,
        fin_period = @v_dim_fin_period,
        fin_quarter_no = @v_dim_fin_quarter_no,
        fin_quarter = @v_dim_fin_quarter,
        fin_year = @v_dim_fin_year,
        week_day_flag = @v_dim_week_day_flag,
        week_end_flag = @v_dim_week_end_flag,
        holiday_desc = @v_dim_holiday_desc,
        holiday_flag = @v_dim_holiday_flag,
        trading_day_flag = @v_dim_trading_day_flag,
        trading_days_so_far = @v_dim_trading_days_in_month_so_far,
        trading_days_in_mth = @v_dim_trading_days_in_cal_month,
        dss_update_time = GETDATE()
      WHERE
        calendar_date = @v_dim_calendar_date

      SELECT
        @v_return_status = @@ERROR
      , @v_row_count = @@ROWCOUNT

      IF @v_row_count = 0
      BEGIN
        INSERT into [TABLEOWNER].[dim_date]
        (
        dim_date_key,
        calendar_date,
        cal_month,
        cal_month_no,
        cal_year,
        cal_day_in_week,
        cal_day_in_week_no,
        cal_day_in_month,
        cal_day_in_year,
        cal_week_in_year,
        cal_month_name,
        cal_quarter_no,
        cal_quarter,
        financial_date,
        fin_day_in_week,
        fin_day_in_week_no,
        fin_day_in_month,
        fin_day_in_year,
        fin_week_in_month,
        fin_week_in_year,
        fin_month_no,
        fin_month,
        fin_month_name,
        fin_period,
        fin_quarter_no,
        fin_quarter,
        fin_year,
        week_day_flag,
        week_end_flag,
        holiday_desc,
        holiday_flag,
        trading_day_flag,
        trading_days_so_far,
        trading_days_in_mth,
        dss_update_time
        )
        values
        (
        @v_dim_dim_date_key,
        @v_dim_calendar_date,
        @v_dim_cal_month,
        @v_dim_cal_month_no,
        @v_dim_cal_year,
        @v_dim_cal_day_in_week,
        @v_dim_cal_day_in_week_no,
        @v_dim_cal_day_in_month,
        @v_dim_cal_day_in_year,
        @v_dim_cal_week_in_year,
        @v_dim_cal_month_name,
        @v_dim_cal_quarter_no,
        @v_dim_cal_quarter,
        @v_dim_financial_date,
        @v_dim_fin_day_in_week,
        @v_dim_fin_day_in_week_no,
        @v_dim_fin_day_in_month,
        @v_dim_fin_day_in_year,
        @v_dim_fin_week_in_month,
        @v_dim_fin_week_in_year,
        @v_dim_fin_month_no,
        @v_dim_fin_month,
        @v_dim_fin_month_name,
        @v_dim_fin_period,
        @v_dim_fin_quarter_no,
        @v_dim_fin_quarter,
        @v_dim_fin_year,
        @v_dim_week_day_flag,
        @v_dim_week_end_flag,
        @v_dim_holiday_desc,
        @v_dim_holiday_flag,
        @v_dim_trading_day_flag,
        @v_dim_trading_days_in_month_so_far,
        @v_dim_trading_days_in_cal_month,
        GETDATE()
        )
        SET @v_insert_count = @v_insert_count + 1
      END
      ELSE
      BEGIN
        SET @v_update_count = @v_update_count + 1
      END
    SET @v_current_date = @v_current_date + 1
  END -- end while loop

  SET @v_step = 110

  COMMIT

  BEGIN TRANSACTION

  DECLARE c_trading_day_month CURSOR READ_ONLY FOR
    SELECT cal_year, cal_month,
           SUM(CASE trading_day_flag WHEN 'Y' THEN 1 ELSE 0 END)
    FROM [TABLEOWNER].[dim_date]
    GROUP BY cal_year, cal_month

  -- Select Number of Trading Days in Month.
  OPEN c_trading_day_month
  FETCH NEXT FROM c_trading_day_month  INTO
    @v_cal_year
  , @v_cal_month
  , @v_days

  WHILE @@FETCH_STATUS = 0
  BEGIN

    UPDATE [TABLEOWNER].[dim_date]
    SET trading_days_in_mth = @v_days
    WHERE cal_year = @v_cal_year
    AND cal_month = @v_cal_month

    FETCH NEXT FROM c_trading_day_month  INTO
      @v_cal_year
    , @v_cal_month
    , @v_days

  END

  CLOSE c_trading_day_month
  DEALLOCATE c_trading_day_month

  COMMIT

  SET @p_return_msg = 'Date Dimension updated from ' +
    CONVERT(varchar,ISNULL(@v_start_date,'No start')) + ' to ' +
    CONVERT(varchar,ISNULL(@v_end_date,'No end')) + '.' +
    CONVERT(varchar,ISNULL(@v_insert_count,0)) + ' new records. ' +
    CONVERT(varchar,ISNULL(@v_update_count,0)) + ' records updated.'

  SET @p_status = 1
  RETURN 0

