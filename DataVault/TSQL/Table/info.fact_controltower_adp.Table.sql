/****** Object:  Table [info].[fact_controltower_adp]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [info].[fact_controltower_adp](
	[Lab] [nvarchar](2) NULL,
	[Lab Location] [varchar](255) NULL,
	[Personnel Nbr] [nvarchar](50) NULL,
	[ADP Dept Nbr] [nvarchar](50) NULL,
	[Lab Dept Nbr] [nvarchar](50) NULL,
	[Date Worked] [date] NULL,
	[Payroll Name] [nvarchar](64) NULL,
	[Pay Code] [nvarchar](32) NULL,
	[Hours] [decimal](12, 2) NULL,
	[Load Date] [datetime2](7) NULL
) ON [PRIMARY]
GO
