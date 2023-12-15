/****** Object:  Table [psa].[load_vw_sdg_details_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_vw_sdg_details_national](
	[loginnum] [nvarchar](50) NULL,
	[sdgid] [nvarchar](50) NULL,
	[receivedate] [datetime2](7) NULL,
	[acctnum] [nvarchar](50) NULL,
	[projectnum] [nvarchar](255) NULL,
	[site] [nvarchar](50) NULL,
	[locator] [nvarchar](20) NULL,
	[description] [nvarchar](60) NULL,
	[status] [nvarchar](50) NULL,
	[report_complete] [nchar](50) NULL,
	[tsr] [nvarchar](4) NULL,
	[first_login_seq] [decimal](12, 2) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
