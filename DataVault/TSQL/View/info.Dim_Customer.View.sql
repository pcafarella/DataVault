/****** Object:  View [info].[Dim_Customer]    Script Date: 12/15/2023 2:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE            VIEW [info].[Dim_Customer] AS 

SELECT customer_no  [Customer Number]
      ,ISNULL(customer_name,'') [Customer Name] 
FROM mas.[customer]
--WHERE interregional_indicator = 0
GO
