/****** Object:  Table [psa].[load_lims_audit_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_lims_audit_national](
	[key_value] [nvarchar](100) NULL,
	[audit_table] [nvarchar](30) NULL,
	[audit_field] [nvarchar](30) NULL,
	[audit_action] [nvarchar](10) NULL,
	[old_value] [nvarchar](100) NULL,
	[new_value] [nvarchar](100) NULL,
	[audit_user] [nvarchar](30) NULL,
	[audit_date] [datetime2](7) NULL,
	[audit_tool] [nvarchar](30) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
