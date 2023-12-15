/****** Object:  Table [bus].[bridge_test_invoiceline_national]    Script Date: 12/15/2023 2:12:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bus].[bridge_test_invoiceline_national](
	[hk_l_customer_paceaccount] [nchar](64) NULL,
	[hk_l_customer_workorder] [nchar](64) NULL,
	[hk_l_project_workorder] [nchar](64) NULL,
	[hk_l_test_invoice] [nchar](64) NOT NULL,
	[hk_l_test_product] [nchar](64) NULL,
	[hk_l_test_sample] [nchar](64) NULL,
	[hk_l_workorder_test] [nchar](64) NULL,
	[hk_h_invoice] [nchar](64) NOT NULL,
	[hk_h_pace_account] [nchar](64) NULL,
	[hk_h_product] [nchar](64) NULL,
	[hk_h_sample] [nchar](64) NULL,
	[hk_h_test] [nchar](64) NULL,
	[hk_h_work_order] [nchar](64) NULL,
	[hk_h_project] [nchar](64) NULL,
	[invoice_bkcc] [nvarchar](255) NULL,
	[test_no] [nvarchar](4000) NULL,
	[test_no_bkcc] [nvarchar](255) NULL,
	[invoice_no] [nvarchar](50) NULL,
	[pace_account_no] [nvarchar](50) NULL,
	[pace_account_no_bkcc] [nvarchar](255) NULL,
	[product_code] [nvarchar](100) NULL,
	[product_code_bkcc] [nvarchar](255) NULL,
	[sample_no] [nvarchar](50) NULL,
	[sample_no_bkcc] [nvarchar](255) NULL,
	[work_order_no] [nvarchar](50) NULL,
	[work_order_no_bkcc] [nvarchar](255) NULL,
	[tenant_id] [nvarchar](15) NULL,
	[dss_snapshot_date] [datetime] NOT NULL
) ON [PRIMARY]
GO
