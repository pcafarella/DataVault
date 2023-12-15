/****** Object:  Table [mas].[adp_department_map]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[adp_department_map](
	[adp_department_no] [nvarchar](50) NULL,
	[adp_department_name] [nvarchar](100) NULL,
	[adp_hk_h_department] [nchar](64) NOT NULL,
	[nat_department_no] [varchar](50) NULL,
	[nat_hk_h_department] [varchar](64) NULL
) ON [PRIMARY]
GO
