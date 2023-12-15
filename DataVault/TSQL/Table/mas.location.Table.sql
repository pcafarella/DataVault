/****** Object:  Table [mas].[location]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[location](
	[location_reference] [nvarchar](255) NOT NULL,
	[state_abbrev] [nvarchar](255) NULL,
	[dss_load_date] [datetime] NULL,
	[dss_record_source] [nvarchar](255) NULL
) ON [PRIMARY]
GO
