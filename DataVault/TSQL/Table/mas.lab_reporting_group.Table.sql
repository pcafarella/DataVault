/****** Object:  Table [mas].[lab_reporting_group]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[lab_reporting_group](
	[list_type] [nvarchar](255) NOT NULL,
	[list_matclass] [nvarchar](255) NOT NULL,
	[adjusted_department] [nvarchar](255) NULL,
	[reporting_group] [nvarchar](255) NULL,
	[due_date_correction] [float] NULL,
	[dss_load_date] [datetime] NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[tenant_id] [nvarchar](255) NULL
) ON [PRIMARY]
GO
