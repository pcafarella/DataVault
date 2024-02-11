/****** Object:  View [info].[fact_invoiceline_v]    Script Date: 2/11/2024 5:13:54 PM ******/
DROP VIEW [info].[fact_invoiceline_v]
GO
/****** Object:  View [info].[fact_invoiceline_v]    Script Date: 2/11/2024 5:13:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
 

 
CREATE      view [info].[fact_invoiceline_v] AS 


 SELECT [Accounting Type],  [Adjusted Pct],  [Buyer],  [Customer Nbr],  [Extended Price],  [Extended Cost],  [Revenue Adjusted],  [Factor Amount],  [Industry],  [Invoice Date],  [Invoice Nbr],  [Invoice Type],  [Is IR Customer],  [Is Owner or Standard],  [Is Pan File],  [Is SISOSUB],  ISNULL(NULLIF(Lab, 'CA'),0) Lab,  [Location],  [Login Date],  [Market],  [Nbr Days],  [Nbr Working Days],  [Product],  [Source Name],  [TAT],  [TAT Code],  [Volume],  [Word Order Desc],  [total_amt] 
 FROM [info].[fact_invoiceline_fairfield_invoice]
 UNION ALL
 SELECT [Accounting Type],  [Adjusted Pct],  [Buyer],  [Customer Nbr],  [Extended Price],  [Extended Cost],  [Revenue Adjusted],  [Factor Amount],  [Industry],  [Invoice Date],  [Invoice Nbr],  [Invoice Type],  [Is IR Customer],  [Is Owner or Standard],  [Is Pan File],  [Is SISOSUB],   ISNULL(NULLIF(Lab, 'CA'),0) Lab,  [Location],  [Login Date],  [Market],  [Nbr Days],  [Nbr Working Days],  [Product],  [Source Name],  [TAT],  [TAT Code],  [Volume],  [Word Order Desc],  [total_amt] 
 FROM [info].[fact_invoiceline_fairfield_credit]
 UNION ALL
 SELECT [Accounting Type],  [Adjusted Pct],  [Buyer],  [Customer Nbr],  [Extended Price],  [Extended Cost],  [Revenue Adjusted],  [Factor Amount],  [Industry],  [Invoice Date],  [Invoice Nbr],  [Invoice Type],  [Is IR Customer],  [Is Owner or Standard],  [Is Pan File],  [Is SISOSUB],  ISNULL(NULLIF(Lab, 'CA'),0) Lab,  [Location],  [Login Date],  [Market],  [Nbr Days],  [Nbr Working Days],  [Product],  [Source Name],  [TAT],  [TAT Code],  [Volume],  [Word Order Desc],  [total_amt] 
 FROM [info].[fact_invoiceline_fairfield_ancillary] 



 /*

 Conversion failed when converting the nvarchar value 'Ca' to data type int.

 if object_id('info.fact_invoiceline') IS NOT NULL DROP TABLE info.fact_invoiceline
 select * into info.fact_invoiceline from info.fact_invoiceline_v
*/
GO
