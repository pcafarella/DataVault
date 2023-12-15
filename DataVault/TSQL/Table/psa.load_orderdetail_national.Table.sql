/****** Object:  Table [psa].[load_orderdetail_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_orderdetail_national](
	[samplenum] [nvarchar](4000) NULL,
	[matnum] [nvarchar](50) NULL,
	[prod] [nvarchar](20) NULL,
	[login_seq] [nvarchar](50) NULL,
	[loginnum] [nvarchar](10) NULL,
	[worknum] [nvarchar](20) NULL,
	[workdate] [datetime2](7) NULL,
	[workstatus] [nvarchar](50) NULL,
	[priorityflag] [nvarchar](3) NULL,
	[class] [nvarchar](50) NULL,
	[deptnum] [nvarchar](50) NULL,
	[dstatus] [nvarchar](4) NULL,
	[dstatusdate] [datetime2](7) NULL,
	[dalloc] [decimal](12, 2) NULL,
	[dprice] [decimal](12, 2) NULL,
	[dcost] [decimal](12, 2) NULL,
	[dholddays] [decimal](12, 2) NULL,
	[dholddate] [datetime2](7) NULL,
	[dduedays] [decimal](12, 2) NULL,
	[dduedate] [datetime2](7) NULL,
	[dprevdeptnum] [decimal](12, 2) NULL,
	[dnextdeptnum] [decimal](12, 2) NULL,
	[lastdate] [datetime2](7) NULL,
	[lasttool] [nvarchar](20) NULL,
	[lastuser] [nvarchar](20) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
