/****** Object:  Table [bus].[bridge_controltower_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bus].[bridge_controltower_national](
	[hk_l_test_product] [nchar](64) NOT NULL,
	[hk_l_test_sample] [nchar](64) NOT NULL,
	[hk_h_product] [nchar](64) NOT NULL,
	[hk_h_sample] [nchar](64) NOT NULL,
	[hk_h_test] [nchar](64) NOT NULL,
	[product_code] [nvarchar](100) NULL,
	[product_code_bkcc] [nvarchar](255) NULL,
	[sample_no] [nvarchar](50) NULL,
	[sample_no_bkcc] [nvarchar](255) NULL,
	[tenant_id] [nvarchar](255) NULL,
	[test_no] [nvarchar](4000) NULL,
	[test_no_bkcc] [nvarchar](255) NULL,
	[dss_snapshot_date] [datetime] NOT NULL
) ON [PRIMARY]
GO
