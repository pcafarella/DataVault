/****** Object:  Table [psa].[load_listheader_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_listheader_national](
	[list_joinid] [nvarchar](20) NULL,
	[plevel] [decimal](12, 2) NULL,
	[pkey] [nvarchar](20) NULL,
	[listtype] [nvarchar](50) NULL,
	[list_func] [nvarchar](40) NULL,
	[listmatclass] [nvarchar](10) NULL,
	[current_flag] [nvarchar](1) NULL,
	[expiredate] [datetime2](7) NULL,
	[pchain_name] [nvarchar](30) NULL,
	[designid] [nvarchar](10) NULL,
	[dkey_flag] [nvarchar](1) NULL,
	[parm_validate_flag] [nvarchar](1) NULL,
	[methodref] [nvarchar](40) NULL,
	[description] [nvarchar](100) NULL,
	[lastdate] [datetime2](7) NULL,
	[lastuser] [nvarchar](20) NULL,
	[lasttool] [nvarchar](20) NULL,
	[seq] [decimal](12, 2) NULL,
	[icalcritid] [bigint] NULL,
	[report_definition_id] [decimal](12, 2) NULL,
	[methodid] [decimal](12, 2) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
