/****** Object:  Table [mas].[order_status]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[order_status](
	[order_status_code] [varchar](4) NOT NULL,
	[order_status_rank] [int] NOT NULL,
	[order_status_description] [varchar](100) NULL,
	[tenant_id] [varchar](255) NULL
) ON [PRIMARY]
GO
