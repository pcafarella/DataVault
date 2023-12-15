/****** Object:  Table [psa].[load_ordermast_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_ordermast_national](
	[samplenum] [nvarchar](20) NULL,
	[matnum] [nvarchar](255) NULL,
	[prod] [nvarchar](20) NULL,
	[pkey] [nvarchar](20) NULL,
	[plevel] [decimal](12, 2) NULL,
	[pprodref] [nvarchar](20) NULL,
	[pmatnumref] [nvarchar](4) NULL,
	[class] [nvarchar](1) NULL,
	[price] [float] NULL,
	[cost] [decimal](12, 2) NULL,
	[factor] [decimal](12, 2) NULL,
	[holddate] [datetime2](7) NULL,
	[holddays] [decimal](12, 2) NULL,
	[holdflg] [nvarchar](1) NULL,
	[duedate] [datetime2](7) NULL,
	[duedays] [decimal](12, 2) NULL,
	[location] [nvarchar](20) NULL,
	[bottles] [decimal](12, 2) NULL,
	[lastdate] [datetime2](7) NULL,
	[lasttool] [nvarchar](20) NULL,
	[lastuser] [nvarchar](20) NULL,
	[designid] [nvarchar](10) NULL,
	[comp] [nvarchar](10) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
