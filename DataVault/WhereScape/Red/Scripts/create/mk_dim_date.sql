CREATE TABLE dbo.dim_date (
  dim_date_key int NOT NULL -- dim_date.dim_date_key 
, calendar_date datetime -- dim_date.calendar_date 
, cal_day_in_week nvarchar(3) -- dim_date.cal_day_in_week 
, cal_day_in_week_no int -- dim_date.cal_day_in_week_no 
, cal_day_in_month int -- dim_date.cal_day_in_month 
, cal_day_in_year int -- dim_date.cal_day_in_year 
, cal_week_in_year int -- dim_date.cal_week_in_year 
, cal_month_no int -- dim_date.cal_month_no 
, cal_month int -- dim_date.cal_month 
, cal_month_name nvarchar(7) -- dim_date.cal_month_name 
, cal_quarter_no int -- dim_date.cal_quarter_no 
, cal_quarter int -- dim_date.cal_quarter 
, cal_year int -- dim_date.cal_year 
, financial_date datetime -- dim_date.financial_date 
, fin_day_in_week nvarchar(3) -- dim_date.fin_day_in_week 
, fin_day_in_week_no int -- dim_date.fin_day_in_week_no 
, fin_day_in_month int -- dim_date.fin_day_in_month 
, fin_day_in_year int -- dim_date.fin_day_in_year 
, fin_week_in_month int -- dim_date.fin_week_in_month 
, fin_week_in_year int -- dim_date.fin_week_in_year 
, fin_month_no int -- dim_date.fin_month_no 
, fin_month int -- dim_date.fin_month 
, fin_month_name nvarchar(7) -- dim_date.fin_month_name 
, fin_period nvarchar(20) -- dim_date.fin_period 
, fin_quarter_no int -- dim_date.fin_quarter_no 
, fin_quarter int -- dim_date.fin_quarter 
, fin_year int -- dim_date.fin_year 
, current_cal_day nvarchar(8) -- dim_date.current_cal_day 
, current_cal_week nvarchar(8) -- dim_date.current_cal_week 
, current_cal_month nvarchar(8) -- dim_date.current_cal_month 
, current_cal_year nvarchar(8) -- dim_date.current_cal_year 
, current_cal_mtd nvarchar(8) -- dim_date.current_cal_mtd 
, current_cal_ytd nvarchar(8) -- dim_date.current_cal_ytd 
, moving_cal_year nvarchar(8) -- dim_date.moving_cal_year 
, current_fin_day nvarchar(8) -- dim_date.current_fin_day 
, current_fin_week nvarchar(8) -- dim_date.current_fin_week 
, current_fin_month nvarchar(8) -- dim_date.current_fin_month 
, current_fin_quarter nvarchar(8) -- dim_date.current_fin_quarter 
, current_fin_year nvarchar(8) -- dim_date.current_fin_year 
, current_fin_mtd nvarchar(8) -- dim_date.current_fin_mtd 
, current_fin_ytd nvarchar(8) -- dim_date.current_fin_ytd 
, moving_fin_quarter nvarchar(8) -- dim_date.moving_fin_quarter 
, moving_fin_year nvarchar(8) -- dim_date.moving_fin_year 
, week_day_flag nvarchar(1) -- dim_date.week_day_flag 
, week_end_flag nvarchar(1) -- dim_date.week_end_flag 
, holiday_flag nvarchar(1) -- dim_date.holiday_flag 
, holiday_desc nvarchar(64) -- dim_date.holiday_desc 
, dss_update_time datetime 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX dim_date_idx_0 ON dbo.dim_date (dim_date_key) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX dim_date_idx_A ON dbo.dim_date (calendar_date) WITH (SORT_IN_TEMPDB = OFF);

