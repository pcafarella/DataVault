-- ============================================================================
-- DBMS Name       : SqlServer 2005
-- Script Name     : daily_date_roll.sql
-- Description     : Rolls current_day_details table and time flags
-- Author          : WhereScape
-- Date            : 22 January 2002
-- WhereScape Limited, inc. All rights reserved. (C) Copyright 1996-2019
-- =============================================================================
-- Notes / History
--
-- The current day is the current time minus 18 hours. SO the day will roll after 6:00pm
--
-- ============================================================================
-- WMR 22/01/2002  Version 1.0.0
-- WMR 17/11/2003  Version 4.1.0
-- WMR 28/10/2004  Version 4.1.1    Commented out writing of parameters
-- HM  21/10/2015  Version 6.8.4.4  Update Current_Fin_Day, Current_Fin_Quarter,
--                                  Moving_Fin_Quarter
-- KH  29/01/2019  Version 8.4.1.0   RED-10090 Changed procedure location markup for Multi-DB

CREATE PROCEDURE [SCHEMA.daily_date_roll].daily_date_roll
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
    @v_MsgText                  varchar(255)  -- Text for audit_trail
  , @v_Sql                      nvarchar(255) -- Text for sql statements
  , @v_set                      integer       -- commit set
  , @v_analyze_flag             integer       -- analyze flag
  , @v_step                     integer       -- return code
  , @v_update_count             integer       -- no of records updated
  , @v_insert_count             integer       -- no of records inserted
  , @v_count                    integer       -- General counter
  , @v_db_code                  varchar(10)   -- Database error code
  , @v_db_msg                   varchar(100)  -- Database error message

  , @v_today                    datetime
  , @v_cweek                    integer
  , @v_cmonth                   integer
  , @v_cmonthno                 integer
  , @v_cyear                    integer
  , @v_fweek                    integer
  , @v_fmonth                   integer
  , @v_fmonthno                 integer
  , @v_fyear                    integer
  , @v_fperiod                  varchar(64)
  , @v_fquarter                 integer
  , @v_fquarterno               integer
  , @v_fmovingquarterstart      integer
  , @v_fmovingquarterend        integer
  , @v_prev_cyear               integer
  , @v_prev_cyear2              integer
  , @v_prev_fquarter            integer
  , @v_prev_fquarterno          integer
  , @v_prev_fmovingquarterstart integer
  , @v_prev_fmovingquarterend   integer
  , @v_prev_fyear               integer
  , @v_prev_fyear2              integer
  , @v_prev_cmonthno            integer
  , @v_prev_cmonth              integer
  , @v_prev_cweek               integer
  , @v_prev_cweek_year          integer
  , @v_prev_fmonthno            integer
  , @v_prev_fmonth              integer
  , @v_prev_fweek               integer
  , @v_prev_fweek_year          integer
  , @v_total_days               integer
  , @v_mtd_days                 integer

    -- ====================================================================
    -- Get all the details for the current day that we will be using
    -- to populate the current_day_details table
    -- As we only have details up to the end of the previous day. Then
    -- we will treat the current day as  now minus 18 hours. So after
    -- 6pm if we roll then it will be for today.
    -- ====================================================================

  SELECT
    @v_today = calendar_date
  , @v_cweek = cal_week_in_year
  , @v_cmonth = cal_month
  , @v_cmonthno = cal_month_no
  , @v_cyear = cal_year
  , @v_fweek = fin_week_in_year
  , @v_fmonth = fin_month
  , @v_fmonthno = fin_month_no
  , @v_fquarter = fin_quarter
  , @v_fquarterno = fin_quarter_no
  , @v_fperiod = fin_period
  , @v_fyear = fin_year
  , @v_total_days = trading_days_in_mth
  , @v_mtd_days = trading_days_so_far
  FROM [TABLEOWNER].[dim_date]
  WHERE calendar_date = CONVERT(DATETIME,(CONVERT(VARCHAR,GETDATE()-0.75,112)))

  SET @v_fmovingquarterend = @v_fyear * 100 + @v_fmonthno

  IF @v_fmonthno > 2
  BEGIN
    SET @v_fmovingquarterstart = @v_fyear * 100 + (@v_fmonthno - 2)
  END
  ELSE
  BEGIN
    SET @v_fmovingquarterstart = (@v_fyear - 1) * 100 + (12 - (2 - @v_fmonthno))
  END

  -- ====================================================================
  -- Work out the previous periods
  -- ====================================================================
  SET @v_prev_cyear = @v_cyear - 1
  SET @v_prev_fyear = @v_fyear - 1
  SET @v_prev_cyear2 = @v_cyear - 2
  SET @v_prev_fyear2 = @v_fyear - 2
  SET @v_prev_cmonthno = @v_cmonthno - 1
  SET @v_prev_fmonthno = @v_fmonthno - 1
  SET @v_prev_cweek = @v_cweek - 1
  SET @v_prev_fweek = @v_fweek - 1
  SET @v_prev_cweek_year = @v_cyear
  SET @v_prev_fweek_year = @v_fyear
  IF @v_prev_cmonthno < 1
  BEGIN
    SET @v_prev_cmonth = ( @v_prev_cyear * 100 ) + 12
    SET @v_prev_cmonthno = 12
  END
  ELSE
  BEGIN
    SET @v_prev_cmonth = @v_cmonth - 1
  END

  IF @v_prev_fmonthno < 1
  BEGIN
    SET @v_prev_fmonth = ( @v_prev_fyear * 100 ) + 12
    SET @v_prev_fmonthno = 12
  END
  ELSE
  BEGIN
    SET @v_prev_fmonth = @v_fmonth - 1
  END

  IF @v_prev_cweek < 1
  BEGIN
    SELECT
      @v_prev_cweek = max(cal_week_in_year)
    FROM [TABLEOWNER].[dim_date]
    WHERE cal_year = @v_prev_cyear
    SET @v_prev_cweek_year = @v_prev_cyear
  END

  IF @v_prev_fweek < 1
  BEGIN
    SELECT
      @v_prev_fweek = max(fin_week_in_year)
    FROM [TABLEOWNER].[dim_date]
    WHERE fin_year = @v_prev_fyear
    SET @v_prev_fweek_year = @v_prev_fyear
  END

  IF @v_fquarterno > 1
  BEGIN
    SET @v_prev_fquarter = @v_fyear * 100 + (@v_fquarterno - 1)
  END
  ELSE
  BEGIN
    SET @v_prev_fquarter = @v_prev_fyear * 100 + 4
  END

  IF @v_fmonthno > 3
  BEGIN
    SET @v_prev_fmovingquarterend = @v_fyear * 100 + (@v_fmonthno - 3)
  END
  ELSE
  BEGIN
    SET @v_prev_fmovingquarterend = @v_prev_fyear * 100 + (12 - (3 - @v_fmonthno))
  END
  IF @v_fmonthno > 5
  BEGIN
    SET @v_prev_fmovingquarterstart = @v_fyear * 100 + (@v_fmonthno - 5)
  END
  ELSE
  BEGIN
    SET @v_prev_fmovingquarterstart = @v_prev_fyear * 100 + (12 - (5 - @v_fmonthno))
  END

  -- ====================================================================
  -- Reset all the flags
  -- ====================================================================
  BEGIN TRANSACTION
  UPDATE [TABLEOWNER].[dim_date]
  SET
    current_cal_day = 'No',
    current_cal_week = 'No',
    current_cal_month = 'No',
    current_cal_year = 'No',
    current_cal_mtd = 'No',
    current_cal_ytd = 'No',
    current_fin_day = 'No',
    current_fin_week = 'No',
    current_fin_month = 'No',
    current_fin_quarter = 'No',
    current_fin_year = 'No',
    current_fin_mtd = 'No',
    current_fin_ytd = 'No',
    moving_cal_year = 'No',
    moving_fin_quarter = 'No',
    moving_fin_year = 'No'
  COMMIT

  -- ====================================================================
  -- Update the calendar month/year
  -- ====================================================================
  BEGIN TRANSACTION
    Update [TABLEOWNER].[dim_date] set current_cal_day = 'Current'
      Where calendar_date = @v_today
    Update [TABLEOWNER].[dim_date] set current_cal_week = 'Current'
      Where cal_week_in_year = @v_cweek
      And cal_year = @v_cyear
    Update [TABLEOWNER].[dim_date] set current_cal_month = 'Current'
      Where cal_month = @v_cmonth
    Update [TABLEOWNER].[dim_date] set current_cal_year = 'Current'
      Where cal_year = @v_cyear
    Update [TABLEOWNER].[dim_date] set current_cal_ytd = 'Current'
      Where cal_year = @v_cyear and cal_month_no <= @v_cmonthno
    Update [TABLEOWNER].[dim_date] set current_cal_mtd = 'Current'
      Where cal_month = @v_cmonth
    Update [TABLEOWNER].[dim_date] set moving_cal_year = 'Current'
      Where cal_year = @v_cyear and cal_month_no <= @v_cmonthno
    Update [TABLEOWNER].[dim_date] set moving_cal_year = 'Current'
      Where cal_year = @v_prev_cyear and cal_month_no > @v_cmonthno

    Update [TABLEOWNER].[dim_date] set current_cal_week = 'Previous'
      Where cal_week_in_year = @v_prev_cweek
      And cal_year = @v_prev_cweek_year
    Update [TABLEOWNER].[dim_date] set current_cal_month = 'Previous'
      Where cal_month = @v_prev_cmonth
    Update [TABLEOWNER].[dim_date] set current_cal_year = 'Previous'
      Where cal_year = @v_prev_cyear
    Update [TABLEOWNER].[dim_date] set current_cal_ytd = 'Previous'
      Where cal_year = @v_prev_cyear and cal_month_no <= @v_cmonthno
    Update [TABLEOWNER].[dim_date] set current_cal_mtd = 'Previous'
      Where cal_year = @v_prev_cyear and cal_month_no = @v_cmonthno
    Update [TABLEOWNER].[dim_date] set moving_cal_year = 'Previous'
      Where cal_year = @v_prev_cyear and cal_month_no <= @v_cmonthno
    Update [TABLEOWNER].[dim_date] set moving_cal_year = 'Previous'
      Where cal_year = @v_prev_cyear2 and cal_month_no > @v_cmonthno

    Update [TABLEOWNER].[dim_date] set current_cal_week = 'Lastyear'
      Where cal_week_in_year = @v_cweek
      And cal_year = @v_prev_cyear
    Update [TABLEOWNER].[dim_date] set current_cal_month = 'Lastyear'
      Where cal_month_no = @v_cmonthno
      And cal_year = @v_prev_cyear

  COMMIT

  -- ====================================================================
  -- Update the financial month/year
  -- ====================================================================
  BEGIN TRANSACTION
    Update [TABLEOWNER].[dim_date] set current_fin_day = 'Current'
      Where financial_date = @v_today
    Update [TABLEOWNER].[dim_date] set current_fin_week = 'Current'
      Where fin_week_in_year = @v_fweek
      And fin_year = @v_fyear
    Update [TABLEOWNER].[dim_date] set current_fin_month = 'Current'
      Where fin_month = @v_fmonth
    Update [TABLEOWNER].[dim_date] set current_fin_quarter = 'Current'
      Where fin_quarter = @v_fquarter
    Update [TABLEOWNER].[dim_date] set current_fin_year = 'Current'
      Where fin_year = @v_fyear
    Update [TABLEOWNER].[dim_date] set current_fin_ytd = 'Current'
      Where fin_year = @v_fyear and fin_month_no <= @v_fmonthno
    Update [TABLEOWNER].[dim_date] set current_fin_mtd = 'Current'
      Where fin_year = @v_fyear and fin_month = @v_fmonth
    Update [TABLEOWNER].[dim_date] set moving_fin_quarter = 'Current'
      Where fin_month >= @v_fmovingquarterstart
      And fin_month <= @v_fmovingquarterend
    Update [TABLEOWNER].[dim_date] set moving_fin_year = 'Current'
      Where fin_year = @v_fyear and fin_month_no <= @v_fmonthno
    Update [TABLEOWNER].[dim_date] set moving_fin_year = 'Current'
      Where fin_year = @v_prev_fyear and fin_month_no > @v_fmonthno

    Update [TABLEOWNER].[dim_date] set current_fin_week = 'Previous'
      Where fin_week_in_year = @v_prev_fweek
      And fin_year = @v_prev_fweek_year
    Update [TABLEOWNER].[dim_date] set current_fin_month = 'Previous'
      Where fin_month = @v_prev_fmonth
    Update [TABLEOWNER].[dim_date] set current_fin_quarter = 'Previous'
      Where fin_quarter = @v_prev_fquarter
    Update [TABLEOWNER].[dim_date] set current_fin_year = 'Previous'
      Where fin_year = @v_prev_fyear
    Update [TABLEOWNER].[dim_date] set current_fin_ytd = 'Previous'
      Where fin_year = @v_prev_fyear and fin_month_no <= @v_fmonthno
    Update [TABLEOWNER].[dim_date] set current_fin_mtd = 'Previous'
      Where fin_year = @v_prev_fyear and fin_month_no = @v_fmonthno
    Update [TABLEOWNER].[dim_date] set moving_fin_quarter = 'Previous'
      Where fin_month >= @v_prev_fmovingquarterstart
      And fin_month <= @v_prev_fmovingquarterend
    Update [TABLEOWNER].[dim_date] set moving_fin_year = 'Previous'
      Where fin_year = @v_prev_fyear and fin_month_no <= @v_fmonthno
    Update [TABLEOWNER].[dim_date] set moving_fin_year = 'Previous'
      Where fin_year = @v_prev_fyear2 and fin_month_no > @v_fmonthno

    Update [TABLEOWNER].[dim_date] set current_fin_week = 'Lastyear'
      Where fin_week_in_year = @v_fweek
      And fin_year = @v_prev_fyear
    Update [TABLEOWNER].[dim_date] set current_fin_month = 'Lastyear'
      Where fin_month_no = @v_fmonthno
      And fin_year = @v_prev_fyear

  COMMIT

  -- ====================================================================
  -- Update the parameter table with current day info
  -- ====================================================================
--       Exec [METABASE].WsParameterWrite 'CURRENT_DATE',@v_today,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'BUSINESS_DAYS_IN_MONTH',@v_total_days,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'BUSINESS_DAYS_MTD',@v_mtd_days,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'PREVIOUS_CAL_MONTH',@v_prev_cmonth,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'PREVIOUS_CAL_MONTH_NO',@v_prev_cmonthno,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'PREVIOUS_CAL_YEAR',@v_prev_cyear,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'PREVIOUS_FIN_MONTH',@v_prev_fmonth,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'PREVIOUS_FIN_MONTH_NO',@v_prev_fmonthno,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'PREVIOUS_FIN_YEAR',@v_prev_fyear,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'CURRENT_CAL_MONTH',@v_cmonth,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'CURRENT_CAL_MONTH_NO',@v_cmonthno,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'CURRENT_CAL_YEAR',@v_cyear,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'CURRENT_FIN_MONTH',@v_fmonth,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'CURRENT_FIN_MONTH_NO',@v_fmonthno,'updated via daily_time_roll'
--       Exec [METABASE].WsParameterWrite 'CURRENT_FIN_YEAR',@v_fyear,'updated via daily_time_roll'
  -- ====================================================================
  -- All DOne
  -- ====================================================================

  SET @p_return_msg = 'Daily Date roll completed. New date is ' +
	CONVERT(VARCHAR,GETDATE()-0.75,112)
    SET @p_status = 1

