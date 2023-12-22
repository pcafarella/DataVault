 

/****** Object:  Table [info].[fact_controltower_ap3_history]    Script Date: 12/22/2023 10:04:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [info].[fact_controltower_ap3_history](
	[Data asof Date] [date] NOT NULL,
	[Work Order Nbr] [nvarchar](50) NULL,
	[Sample Nbr] [nvarchar](50) NULL,
	[Customer Nbr] [nvarchar](50) NULL,
	[Lab] [varchar](2) NOT NULL,
	[Analysis Process] [nvarchar](101) NULL,
	[Method] [nvarchar](100) NULL,
	[Matrix] [nvarchar](50) NULL,
	[Hold Date] [date] NULL,
	[Internal Due Date] [date] NULL,
	[Met Int Due Date Flag] [varchar](1) NOT NULL,
	[External Due Date] [date] NULL,
	[Met Ext Due Date Flag] [varchar](1) NOT NULL,
	[Original Invoice Date] [date] NULL,
	[Delivered Date] [date] NULL,
	[Login Dept Nbr] [nvarchar](50) NULL,
	[Login Dept Abbrev] [nvarchar](4) NULL,
	[Login Dept Lims Status] [varchar](50) NULL,
	[Login Dept Lims Status Date] [datetime] NULL,
	[Login Dept Received Date] [datetime2](7) NULL,
	[Login Dept Logged In Date] [datetime2](7) NULL,
	[PrePrep Dept Nbr] [nvarchar](50) NULL,
	[PrePrep Dept Abbrev] [nvarchar](4) NULL,
	[PrePrep Dept Batch Nbr] [nvarchar](20) NULL,
	[PrePrep Dept Lims Status] [varchar](50) NULL,
	[PrePrep Dept Lims Status Date] [datetime] NULL,
	[PrePrep Available] [datetime2](7) NULL,
	[PrePrep Batched] [datetime2](7) NULL,
	[PrePrep Complete] [datetime2](7) NULL,
	[Prep Dept Nbr] [nvarchar](50) NULL,
	[Prep Dept Abbrev] [nvarchar](4) NULL,
	[Prep Dept Batch Nbr] [nvarchar](20) NULL,
	[Prep Dept Lims Status] [varchar](50) NULL,
	[Prep Dept Lims Status Date] [datetime] NULL,
	[Prep Available] [datetime2](7) NULL,
	[Prep Batched] [datetime2](7) NULL,
	[Prep Benchwork Started] [datetime2](7) NULL,
	[Prep Complete] [datetime2](7) NULL,
	[Analysis Dept Nbr] [nvarchar](50) NULL,
	[Analysis Dept Abbrev] [nvarchar](4) NULL,
	[Analysis Dept Batch Nbr] [nvarchar](20) NULL,
	[Analysis Dept Lims Status] [varchar](50) NULL,
	[Analysis Dept Lims Status Date] [datetime] NULL,
	[Analysis Available] [datetime2](7) NULL,
	[Analysis Batched] [datetime2](7) NULL,
	[Analysis Started] [datetime2](7) NULL,
	[First Review Complete] [datetime2](7) NULL,
	[Second Review Complete] [datetime2](7) NULL,
	[Analysis Instrument] [varchar](30) NULL,
	[Location] [varchar](30) NULL,
	[Analysis Dept Attempt Count] [varchar](30) NULL,
	[Reporting Dept Nbr] [nvarchar](50) NULL,
	[Reporting Dept Abbrev] [nvarchar](4) NULL,
	[Reporting Dept Lims Status] [varchar](50) NULL,
	[Reporting Dept Lims Status Date] [datetime] NULL,
	[Report Generated Date] [datetime2](7) NULL,
	[Invoice Dept Nbr] [nvarchar](50) NULL,
	[Invoice Dept Abbrev] [nvarchar](4) NULL,
	[Invoice Dept Lims Status] [varchar](50) NULL,
	[Invoice Dept Lims Status Date] [datetime] NULL,
	[Invoice Generated Date] [datetime2](7) NULL,
	[dss_load_date] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [info].[fact_controltower_ap3_history] ADD  CONSTRAINT [DF_fact_controltower_ap3_history_dss_load_date]  DEFAULT (getdate()) FOR [dss_load_date]
GO


