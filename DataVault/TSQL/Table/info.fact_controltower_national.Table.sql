/****** Object:  Table [info].[fact_controltower_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [info].[fact_controltower_national](
	[work_order_no] [nvarchar](50) NULL,
	[sample_no] [nvarchar](50) NULL,
	[department_no] [nvarchar](50) NULL,
	[test_no] [nvarchar](4000) NULL,
	[department_type] [varchar](14) NULL,
	[department_level] [decimal](5, 2) NULL,
	[process_status_batch_no] [nvarchar](20) NULL,
	[pace_account_no] [nvarchar](50) NULL,
	[analysis_process_code] [nvarchar](50) NULL,
	[analysis_process_code_bkcc] [nvarchar](50) NULL,
	[product_code_base] [nvarchar](4000) NULL,
	[matnum_base] [nvarchar](255) NULL,
	[matrix] [nvarchar](10) NULL,
	[method] [nvarchar](100) NULL,
	[process_status_code] [varchar](50) NULL,
	[process_status_date] [datetime] NULL,
	[receivedate] [datetime2](7) NULL,
	[holddate] [datetime2](7) NULL,
	[internal_duedate] [datetime2](7) NULL,
	[external_duedate] [datetime2](7) NULL,
	[dept_avail_date] [datetime2](7) NULL,
	[dept_batch_date] [datetime2](7) NULL,
	[work_inprogress_date] [datetime2](7) NULL,
	[work_capture_date] [datetime2](7) NULL,
	[work_complete_date] [datetime2](7) NULL,
	[preprep_required] [varchar](1) NOT NULL,
	[original_invoice_date] [datetime2](7) NULL,
	[invoicedate] [datetime2](7) NULL
) ON [PRIMARY]
GO
