/****** Object:  Table [psa].[load_rundef_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_rundef_national](
	[run_id] [nvarchar](20) NULL,
	[audit_seq] [decimal](12, 2) NULL,
	[run_date] [datetime2](7) NULL,
	[run_type] [nvarchar](10) NULL,
	[instrument_id] [nvarchar](50) NULL,
	[analyst] [nvarchar](30) NULL,
	[deptnum] [int] NULL,
	[worknum] [nvarchar](20) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
