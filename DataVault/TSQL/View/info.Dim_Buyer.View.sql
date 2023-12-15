/****** Object:  View [info].[Dim_Buyer]    Script Date: 12/15/2023 2:09:16 PM ******/
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
