/****** Object:  Table [mas].[department_type]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[department_type](
	[department_no] [nvarchar](50) NULL,
	[department_name] [nvarchar](100) NULL,
	[department_short_name] [nvarchar](4) NULL,
	[department_type] [varchar](14) NULL,
	[tenant_id] [nvarchar](50) NULL,
	[department_level] [decimal](5, 2) NULL,
	[precedence] [tinyint] NULL
) ON [PRIMARY]
GO
