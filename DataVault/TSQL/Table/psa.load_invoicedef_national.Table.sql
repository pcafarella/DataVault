/****** Object:  Table [psa].[load_invoicedef_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [psa].[load_invoicedef_national](
	[invoicenum] [nvarchar](50) NULL,
	[invoicedate] [datetime2](7) NULL,
	[acctnum] [nvarchar](20) NULL,
	[invoiceref] [nvarchar](10) NULL,
	[invoicecomm] [nvarchar](240) NULL,
	[projectnum] [nvarchar](255) NULL,
	[description] [nvarchar](40) NULL,
	[status] [nvarchar](10) NULL,
	[lastdate] [datetime2](7) NULL,
	[lasttool] [nvarchar](20) NULL,
	[lastuser] [nvarchar](20) NULL,
	[loginnum] [nvarchar](10) NULL,
	[ponumber] [nvarchar](50) NULL,
	[redostatus] [nvarchar](10) NULL,
	[mas90date] [datetime2](7) NULL,
	[original_invoice_date] [datetime2](7) NULL,
	[summary_invoice] [nvarchar](30) NULL,
	[dss_record_source] [nvarchar](255) NULL,
	[dss_load_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
