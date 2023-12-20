CREATE TABLE dbo.dim_date_teradata (
  dim_date_teradata_key date -- dim_date_teradata.dim_date_teradata_key 
, calendar_date date -- dim_date_teradata.calendar_date 
, cal_day_in_week nvarchar(3) -- dim_date_teradata.cal_day_in_week 
, cal_day_in_week_no int -- dim_date_teradata.cal_day_in_week_no 
, cal_day_in_month int -- dim_date_teradata.cal_day_in_month 
, cal_day_in_year int -- dim_date_teradata.cal_day_in_year 
, cal_week_in_year int -- dim_date_teradata.cal_week_in_year 
, cal_month_no int -- dim_date_teradata.cal_month_no 
, cal_month int -- dim_date_teradata.cal_month 
, cal_month_name nvarchar(7) -- dim_date_teradata.cal_month_name 
, cal_quarter_no int -- dim_date_teradata.cal_quarter_no 
, cal_quarter int -- dim_date_teradata.cal_quarter 
, cal_year int -- dim_date_teradata.cal_year 
, financial_date date -- dim_date_teradata.financial_date 
, fin_day_in_week nvarchar(3) -- dim_date_teradata.fin_day_in_week 
, fin_day_in_week_no int -- dim_date_teradata.fin_day_in_week_no 
, fin_day_in_month int -- dim_date_teradata.fin_day_in_month 
, fin_day_in_year int -- dim_date_teradata.fin_day_in_year 
, fin_week_in_month int -- dim_date_teradata.fin_week_in_month 
, fin_week_in_year int -- dim_date_teradata.fin_week_in_year 
, fin_month_no int -- dim_date_teradata.fin_month_no 
, fin_month int -- dim_date_teradata.fin_month 
, fin_month_name nvarchar(7) -- dim_date_teradata.fin_month_name 
, fin_period nvarchar(20) -- dim_date_teradata.fin_period 
, fin_quarter_no int -- dim_date_teradata.fin_quarter_no 
, fin_quarter int -- dim_date_teradata.fin_quarter 
, fin_year int -- dim_date_teradata.fin_year 
, week_day_flag nvarchar(1) -- dim_date_teradata.week_day_flag 
, week_end_flag nvarchar(1) -- dim_date_teradata.week_end_flag 
, holiday_flag nvarchar(1) -- dim_date_teradata.holiday_flag 
, holiday_desc nvarchar(64) -- dim_date_teradata.holiday_desc 
, dss_update_time datetime 
) 
;

CREATE UNIQUE NONCLUSTERED INDEX dim_date_teradata_idx_0 ON dbo.dim_date_teradata (dim_date_teradata_key) WITH (SORT_IN_TEMPDB = OFF);
CREATE UNIQUE NONCLUSTERED INDEX dim_date_teradata_idx_A ON dbo.dim_date_teradata (dim_date_teradata_key) WITH (SORT_IN_TEMPDB = OFF);

