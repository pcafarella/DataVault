/****** Object:  Table [mas].[state]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[state](
	[state_abbrev] [nvarchar](255) NULL,
	[state_name] [nvarchar](50) NULL,
	[state_shortname] [nvarchar](50) NULL,
	[region_name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
