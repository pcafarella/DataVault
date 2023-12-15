/****** Object:  Table [info].[fact_controltower_vault_adp]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [info].[fact_controltower_vault_adp](
	[personnel_no] [nvarchar](50) NULL,
	[adp_working_department_no] [nvarchar](50) NULL,
	[lab_working_department_no] [nvarchar](50) NULL,
	[date_worked] [datetime2](7) NULL,
	[payroll_name] [nvarchar](64) NULL,
	[pay_code] [nvarchar](32) NULL,
	[hours] [decimal](12, 2) NULL,
	[business_unit] [nvarchar](100) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
