/****** Object:  StoredProcedure [info].[fact_controltower_fact_history]    Script Date: 2/5/2024 10:41:23 AM ******/
DROP PROCEDURE [info].[fact_controltower_fact_history]
GO
/****** Object:  StoredProcedure [info].[fact_controltower_fact_history]    Script Date: 2/5/2024 10:41:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [info].[fact_controltower_fact_history]  @p_capture_date Date = NULL
AS

--exec info.fact_controltower_fact_history @p_capture_date = getdate()

DECLARE @data_asof_date DATE

SET @data_asof_date =  DATEADD( d, -1, ISNULL(@p_capture_date,CAST(getdate() AS DATE))) 
 
INSERT INTO [info].[fact_controltower_ap3_history]
           ([Data asof Date]
           ,[Work Order Nbr]
           ,[Sample Nbr]
           ,[Customer Nbr]
           ,[Lab]
           ,[Analysis Process]
           ,[Method]
           ,[Matrix]
           ,[Hold Date]
           ,[Internal Due Date]
           ,[Met Int Due Date Flag]
           ,[External Due Date]
           ,[Met Ext Due Date Flag]
           ,[Original Invoice Date]
           ,[Delivered Date]
           ,[Login Dept Nbr]
           ,[Login Dept Abbrev]
           ,[Login Dept Lims Status]
           ,[Login Dept Lims Status Date]
           ,[Login Dept Received Date]
           ,[Login Dept Logged In Date]
           ,[PrePrep Dept Nbr]
           ,[PrePrep Dept Abbrev]
           ,[PrePrep Dept Batch Nbr]
           ,[PrePrep Dept Lims Status]
           ,[PrePrep Dept Lims Status Date]
           ,[PrePrep Available]
           ,[PrePrep Batched]
           ,[PrePrep Complete]
           ,[Prep Dept Nbr]
           ,[Prep Dept Abbrev]
           ,[Prep Dept Batch Nbr]
           ,[Prep Dept Lims Status]
           ,[Prep Dept Lims Status Date]
           ,[Prep Available]
           ,[Prep Batched]
           ,[Prep Benchwork Started]
           ,[Prep Complete]
           ,[Analysis Dept Nbr]
           ,[Analysis Dept Abbrev]
           ,[Analysis Dept Batch Nbr]
           ,[Analysis Dept Lims Status]
           ,[Analysis Dept Lims Status Date]
           ,[Analysis Available]
           ,[Analysis Batched]
           ,[Analysis Started]
           ,[First Review Complete]
           ,[Second Review Complete]
           ,[Analysis Instrument]
           ,[Location]
           ,[Analysis Dept Attempt Count]
           ,[Reporting Dept Nbr]
           ,[Reporting Dept Abbrev]
           ,[Reporting Dept Lims Status]
           ,[Reporting Dept Lims Status Date]
           ,[Report Generated Date]
           ,[Invoice Dept Nbr]
           ,[Invoice Dept Abbrev]
           ,[Invoice Dept Lims Status]
           ,[Invoice Dept Lims Status Date]
           ,[Invoice Generated Date])
 
SELECT @data_asof_date
	  ,[Work Order Nbr]
      ,[Sample Nbr]
      ,[Customer Nbr]
      ,[Lab]
      ,[Analysis Process]
      ,[Method]
      ,[Matrix]
      ,[Hold Date]
      ,[Internal Due Date]
      ,[Met Int Due Date Flag]
      ,[External Due Date]
      ,[Met Ext Due Date Flag]
      ,[Original Invoice Date]
      ,[Delivered Date]
      ,[Login Dept Nbr]
      ,[Login Dept Abbrev]
      ,[Login Dept Lims Status]
      ,[Login Dept Lims Status Date]
      ,[Login Dept Received Date]
      ,[Login Dept Logged In Date]
      ,[PrePrep Dept Nbr]
      ,[PrePrep Dept Abbrev]
      ,[PrePrep Dept Batch Nbr]
      ,[PrePrep Dept Lims Status]
      ,[PrePrep Dept Lims Status Date]
      ,[PrePrep Available]
      ,[PrePrep Batched]
      ,[PrePrep Complete]
      ,[Prep Dept Nbr]
      ,[Prep Dept Abbrev]
      ,[Prep Dept Batch Nbr]
      ,[Prep Dept Lims Status]
      ,[Prep Dept Lims Status Date]
      ,[Prep Available]
      ,[Prep Batched]
      ,[Prep Benchwork Started]
      ,[Prep Complete]
      ,[Analysis Dept Nbr]
      ,[Analysis Dept Abbrev]
      ,[Analysis Dept Batch Nbr]
      ,[Analysis Dept Lims Status]
      ,[Analysis Dept Lims Status Date]
      ,[Analysis Available]
      ,[Analysis Batched]
      ,[Analysis Started]
      ,[First Review Complete]
      ,[Second Review Complete]
      ,[Analysis Instrument]
      ,[Location]
      ,[Analysis Dept Attempt Count]
      ,[Reporting Dept Nbr]
      ,[Reporting Dept Abbrev]
      ,[Reporting Dept Lims Status]
      ,[Reporting Dept Lims Status Date]
      ,[Report Generated Date]
      ,[Invoice Dept Nbr]
      ,[Invoice Dept Abbrev]
      ,[Invoice Dept Lims Status]
      ,[Invoice Dept Lims Status Date]
      ,[Invoice Generated Date]
  FROM [info].[fact_controltower_ap3]

RETURN


 

 
 
GO