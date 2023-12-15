/****** Object:  Table [psa].[load_projectdef_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_projectdef_national](
	[acctnum] [nvarchar](50) NULL,
	[projectnum] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[startdate] [datetime2](7) NULL,
	[stopdate] [datetime2](7) NULL,
	[ponumber] [nvarchar](50) NULL,
	[site] [nvarchar](255) NULL,
	[manager] [nvarchar](30) NULL,
	[projref] [nvarchar](100) NULL,
	[sales1code] [nvarchar](4) NULL,
	[sales1plan] [nvarchar](4) NULL,
	[sales2code] [nvarchar](4) NULL,
	[sales2plan] [nvarchar](4) NULL,
	[termcode] [nvarchar](10) NULL,
	[lastdate] [datetime2](7) NULL,
	[lasttool] [nvarchar](20) NULL,
	[lastuser] [nvarchar](20) NULL,
	[locator] [nvarchar](50) NULL,
	[permitnum] [nvarchar](100) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
