/****** Object:  Table [mas].[market]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[market](
	[market] [nvarchar](255) NULL,
	[market_segment] [nvarchar](255) NULL,
	[dss_load_date] [datetime] NOT NULL,
	[dss_record_source] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
