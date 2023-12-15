/****** Object:  Table [mas].[lab]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[lab](
	[lab_no] [nvarchar](255) NOT NULL,
	[parent_lab_no] [nvarchar](255) NOT NULL,
	[parent_lab_name] [nvarchar](255) NULL,
	[parent_lab_city_name] [nvarchar](255) NULL,
	[parent_lab_state_abbrev] [nvarchar](255) NULL,
	[parent_lab_region_name] [nvarchar](255) NULL,
	[dss_load_date] [datetime] NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[operating_lab_name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
