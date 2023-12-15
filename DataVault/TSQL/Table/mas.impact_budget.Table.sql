/****** Object:  Table [mas].[impact_budget]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[impact_budget](
	[Year] [int] NULL,
	[Year Month] [datetime] NULL,
	[Budget] [float] NULL,
	[Parent Lab] [int] NULL
) ON [PRIMARY]
GO
