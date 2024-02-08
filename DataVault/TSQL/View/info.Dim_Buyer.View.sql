/****** Object:  View [info].[Dim_Buyer]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [info].[Dim_Buyer]
GO
/****** Object:  View [info].[Dim_Buyer]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE             VIEW [info].[Dim_Buyer] AS 

SELECT buyer_cd [Buyer Code]
      ,buyer_type [Buyer Type] 
      ,'BT:'+ buyer_type [Buyer Type Relationship]
FROM  [mas].[Buyer]
 
 
GO
