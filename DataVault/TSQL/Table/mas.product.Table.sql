/****** Object:  Table [mas].[product]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mas].[product](
	[Product] [nvarchar](2000) NOT NULL,
	[Parent Product] [nvarchar](max) NULL,
	[Product Family] [nvarchar](255) NULL,
	[Master Department] [nvarchar](255) NULL,
	[Charge Type] [nvarchar](255) NULL,
	[LIMS Type] [nvarchar](255) NULL,
	[LIMS] [nvarchar](max) NULL,
	[Lab Location] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Product(Acode)] [nvarchar](max) NULL,
	[Product(Acode) Description] [nvarchar](255) NULL,
	[Method] [nvarchar](255) NULL,
	[Method Description] [nvarchar](255) NULL,
	[Matrix (SP & EL)] [nvarchar](255) NULL,
	[Product(Acode) Type (HZ)] [nvarchar](255) NULL,
	[List Type (SP)] [nvarchar](255) NULL,
	[Queue/Dept] [nvarchar](255) NULL,
	[Queue/Dept Name] [nvarchar](255) NULL,
	[Procedure (HZ)] [nvarchar](max) NULL,
	[Procedure Description (HZ)] [nvarchar](255) NULL,
	[Hold Code (HZ)] [nvarchar](255) NULL,
	[Container (HZ)] [nvarchar](255) NULL,
	[Container Description] [nvarchar](255) NULL,
	[Prep Template (SP)] [nvarchar](255) NULL,
	[Prep Template Description (SP)] [nvarchar](255) NULL,
	[Prep Method (SP)] [nvarchar](255) NULL,
	[Prep Department (SP)] [nvarchar](255) NULL,
	[Parent/Child (SP)] [nvarchar](255) NULL,
	[Parent Lab Location (SP)] [nvarchar](255) NULL,
	[Parent Product (SP)] [nvarchar](255) NULL,
	[Parent Matrix (SP)] [nvarchar](255) NULL,
	[Last Received (SP)] [nvarchar](255) NULL,
	[dss_load_date] [datetime] NULL,
	[dss_record_source] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
