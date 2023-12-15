/****** Object:  Table [mas].[customer]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[customer](
	[customer_no] [nvarchar](255) NULL,
	[customer_name] [nvarchar](255) NULL,
	[dss_load_date] [datetime] NULL,
	[dss_record_source] [nvarchar](255) NULL
) ON [PRIMARY]
GO
