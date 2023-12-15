/****** Object:  Table [psa].[load_sample_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_sample_national](
	[samplenum] [nvarchar](50) NULL,
	[clientid] [nvarchar](50) NULL,
	[acctnum] [nvarchar](20) NULL,
	[projectnum] [nvarchar](255) NULL,
	[site] [nvarchar](max) NULL,
	[locator] [nvarchar](20) NULL,
	[qctype] [nvarchar](10) NULL,
	[collectby] [nvarchar](20) NULL,
	[receivedate] [datetime2](7) NULL,
	[collectdate] [datetime2](7) NULL,
	[tat] [decimal](12, 2) NULL,
	[duedate] [datetime2](7) NULL,
	[priorityflag] [nvarchar](3) NULL,
	[loginnum] [nvarchar](50) NULL,
	[login_seq] [decimal](12, 2) NULL,
	[prelognum] [nvarchar](10) NULL,
	[presamplenum] [nvarchar](20) NULL,
	[expectdate] [datetime2](7) NULL,
	[orderdate] [datetime2](7) NULL,
	[description] [nvarchar](60) NULL,
	[comments] [nvarchar](max) NULL,
	[quotenumref] [nvarchar](20) NULL,
	[totalprice] [decimal](12, 2) NULL,
	[invoicenum] [nvarchar](50) NULL,
	[lastdate] [datetime2](7) NULL,
	[lasttool] [nvarchar](20) NULL,
	[lastuser] [nvarchar](20) NULL,
	[samp_function] [nvarchar](1) NULL,
	[designid] [nvarchar](10) NULL,
	[reportdate] [datetime2](7) NULL,
	[prelog_exportedon] [datetime2](7) NULL,
	[original_report_date] [datetime2](7) NULL,
	[tableid] [nvarchar](10) NULL,
	[duedate2] [datetime2](7) NULL,
	[collect_timezone] [nvarchar](10) NULL,
	[utc_collectdate] [datetime2](7) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
