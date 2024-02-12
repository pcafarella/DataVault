/****** Object:  View [info].[Dim_Calendar]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [info].[Dim_Calendar]
GO
/****** Object:  View [info].[Dim_Calendar]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE         View [info].[Dim_Calendar] AS
SELECT [calendar_date] [Date],
		[cal_year] [Year],
		[cal_month] [Month],
		DATEDIFF(day,  DATEADD(DAY, 1, EOMONTH(calendar_date, -1)),EOMONTH(calendar_date)) [Days in Month],
		[cal_day_in_month] [Day],
		cal_day_in_week [Day Name],
		cal_day_in_week_no [Day of Week],
	    DATENAME(month, calendar_date) 'Month Name' ,
		cal_quarter_no [Quarter],
		DATEDIFF(month, calendar_date, getdate()) *-1 [Month Offset],
		DATEDIFF(year, calendar_date, getdate()) *-1 [Year Offset],
		DATEDIFF(quarter, calendar_date, getdate()) *-1 [Quarter Offset],
		cal_month_name + ' '+ CAST(cal_year AS CHAR(4)) [Year-Month],
		CAST([cal_year] AS CHAR(4))+'-'+format(cal_month_no, '00') [Year-Mo],
		CASE WHEN holiday_desc IS NULL THEN '' ELSE holiday_desc END Holiday,
		CASE when holiday_desc IS NULL and cal_day_in_week_no in (2,3,4,5,6) THEN 1 ELSE 0 END [Is Workday],
		--CASE WHEN holiday_desc IS NOT NULL THEN 0 ELSE CASE WHEN dbo.ufn_CalculateBusinessDays(DATEADD(day,-1,calendar_date),calendar_date+1)-1 != 0 THEN 1 ELSE 0 END END [Is Workday],
		cal_month_name [Month Name Short],
		'Q'+CAST(cal_quarter_no AS CHAR(1)) [Qtr],
		cal_week_in_year [Week Number],
		cal_month [Year-Wk],
		DATEDIFF(week, calendar_date, getdate()) *-1 [Week Index]
FROM mas.pace_calendar
 WHERE calendar_date BETWEEN  DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) -2, 0 )  AND  DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1)  
GO
