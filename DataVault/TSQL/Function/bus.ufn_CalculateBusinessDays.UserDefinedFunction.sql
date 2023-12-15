USE [WSDataVault_dev_incremental]
GO
/****** Object:  UserDefinedFunction [bus].[ufn_CalculateBusinessDays]    Script Date: 12/15/2023 2:16:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE       FUNCTION [bus].[ufn_CalculateBusinessDays](
@StartDate DATE,
@EndDate DATE = NULL)

RETURNS INT
AS

BEGIN
DECLARE @TotalBusinessDays INT = 0;
DECLARE @TestDate DATE = @StartDate;


IF @EndDate IS NULL
    RETURN NULL;


SELECT @TotalBusinessDays = count(*)
FROM mas.pace_calendar
WHERE calendar_date BETWEEN @startdate and @enddate
AND week_day_flag = 'Y' and holiday_flag = 'N'


RETURN @TotalBusinessDays;
END
GO
