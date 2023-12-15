/****** Object:  Table [psa].[load_ordertrack_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_ordertrack_national](
	[samplenum] [nvarchar](20) NULL,
	[matnum] [nvarchar](4) NULL,
	[prod] [nvarchar](20) NULL,
	[deptnum] [nvarchar](50) NULL,
	[worknum] [nvarchar](20) NULL,
	[dstatus] [nvarchar](4) NULL,
	[dstatusdate] [datetime2](7) NULL,
	[lastdate] [datetime2](7) NULL,
	[lasttool] [nvarchar](20) NULL,
	[lastuser] [nvarchar](20) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
