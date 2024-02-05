/****** Object:  StoredProcedure [info].[usp_fact_invoiceline_netimpact_credit]    Script Date: 1/30/2024 2:45:18 PM ******/
DROP PROCEDURE [info].[usp_fact_invoiceline_netimpact_credit]
GO
/****** Object:  StoredProcedure [info].[usp_fact_invoiceline_netimpact_credit]    Script Date: 1/30/2024 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE   PROCEDURE [info].[usp_fact_invoiceline_netimpact_credit] AS 

IF object_id('tempdb.dbo.#temp') iS NOT NULL DROP TABLE #temp
IF object_id('info.fact_invoiceline_netimpact_credit') iS NOT NULL DROP TABLE info.fact_invoiceline_netimpact_credit

--exec info.usp_fact_invoiceline_netimpact_credit

SELECT  [Count], [Year], [Invoice Year Dt],[Invoice Year Month],  Lab, [Lab Name], [Lab Name Relationship], Product, [Revenue Adjusted]  
		,CASE WHEN Volume > 0 THEN Volume ELSE CASE WHEN [Revenue Adjusted] > 0 THEN 1 ELSE -1 END  END Volume
		,CAST([Revenue Adjusted]/ CASE WHEN Volume > 0 THEN Volume ELSE CASE WHEN [Revenue Adjusted] > 0 THEN 1 ELSE -1 END END AS DECIMAL(12,2)) [ASP CY] 
INTO #temp
FROM(
SELECT	COUNT(*) [Count],
		YEAR([Invoice Date]) [Year], 
		CAST(MAX(DATEADD(year, DATEDIFF(year, 0, [Invoice Date]), 0)) AS DATE) [Invoice Year Dt], -- start dt of year
		CAST(MAX(DATEADD(mm, DATEDIFF(mm, 0, [Invoice Date]), 0)) AS DATE) [Invoice Year Month],
		ISNULL([Parent Lab],'-1') Lab, MAX([Lab Name]) [Lab Name], MAX([Lab Name Relationship]) [Lab Name Relationship], 
        Product, 
 		SUM(CASE WHEN [Revenue Adjusted] < 0 THEN Volume * -1 ELSE Volume  END)  Volume,
		SUM([Revenue Adjusted]) [Revenue Adjusted]	
FROM  info.fact_invoiceline
LEFT JOIN info.dim_lab ON dim_lab.[Lab Text] = CAST(fact_invoiceline.lab AS VARCHAR)
WHERE [is Owner or Standard] = 1 
GROUP BY [Parent Lab], Product, YEAR([Invoice Date]), Month([Invoice date]) ) a
--WHERE [Revenue Adjusted]  != 0
  
--Insert missing with zeros
;WITH product AS (
SELECT product from mas.product
UNION 
SELECT DISTINCT product FROM info.fact_invoiceline)
,YearMonthProduct AS (
SELECT product, cal_year,  cal_month  , MAX(calendar_date) calendar_date
FROM product 
CROSS JOIN (SELECT cal_year, cal_month , max(calendar_date) calendar_date FROM mas.pace_calendar GROUP BY cal_year, cal_month) ym
GROUP BY product, cal_year, cal_month
HAVING cal_year BETWEEN YEAR(getdate())-2  and YEAR(getdate())  AND MAX(calendar_date) <  getdate() )
 
INSERT INTO #temp
           ([ASP CY]
           ,[Count]
           ,[Year]
           ,[Invoice Year Dt]
           ,[Invoice Year Month]
           ,[Lab]
           ,[Lab Name]
           ,[Lab Name Relationship]
           ,[Product]
           ,[Volume]
           ,[Revenue Adjusted] )
SELECT  0, 0, cal_year,  cast(cal_year AS CHAR(4))+'-01-01' , CAST(cal_year AS CHAR(4))+'-'+CAST(RIGHT(cal_month,2) AS CHAR(2))+'-01' StartOfMonth,
		ISNULL([Parent Lab],'-1') Lab, MAX(dim_lab.[Lab Name]) [Lab Name], MAX(dim_lab.[Lab Name Relationship]) [Lab Name Relationship],  
		c.product,
		0, 0
FROM YearMonthProduct c
JOIN #temp n ON CAST(n.lab  AS VARCHAR) =  cast(n.lab AS VARCHAR)  AND n.product = c.product
LEFT JOIN info.dim_lab ON dim_lab.[Lab Text] = n.lab
WHERE NOT EXISTS (SELECT 1 FROM #temp i WHERE cast(i.lab as VARCHAR) = cast(n.lab AS VARCHAR)  AND i.product = c.product AND i.[Year] = c.cal_year and i.[Invoice Year Month] = CAST(cal_year AS CHAR(4))+'-'+CAST(RIGHT(cal_month,2) AS CHAR(2))+'-01'  )
AND cal_year <= YEAR(getdate())
GROUP BY [Parent Lab] ,c.product, cal_year, cal_month --431094
 
SELECT   CAST(ISNULL([ASP CY],0) AS Decimal(38,2)) [ASP CY]
        ,ISNULL([Count],0) [Count]
        ,ISNULL([Year],'1900') [Invoice Year]
        ,ISNULL([Invoice Year Dt],'1900-01-01') [Invoice Year Dt]
        ,ISNULL([Invoice Year Month],'1900-01-01') [Invoice Year Month]
        ,ISNULL([Lab],0) [Lab]
        ,ISNULL([Lab Name],'(Blank)') [Lab Name]
        ,ISNULL([Lab Name Relationship],'L:(Blank)') [Lab Name Relationship]
        ,ISNULL([Product],'Blank Product') [Product]
        ,CAST(ISNULL([Volume],0.00) AS Decimal(12,2)) [Sum Adjusted Volume]
        ,CAST(ISNULL([Revenue Adjusted],0) AS Decimal(38,2))[Sum Revenue]
		,CAST(ISNULL([Lag Volume],0.00) AS Decimal(12,2)) [Lag Volume]
		,CAST(ISNULL([Lag Revenue],0) AS Decimal(38,2)) [Lag Revenue]
	    ,CAST(ISNULL([ASP PY],0) AS Decimal(38,2)) [ASP PY]
        ,CASE WHEN COALESCE(NULLIF(Volume,0.00), NULLIF([Revenue Adjusted],0.00)) IS NULL OR COALESCE(NULLIF([Lag Volume],0.00), NULLIF([Lag Revenue],0.00)) IS NULL THEN 0.00
		      ELSE ISNULL(([ASP CY] - [ASP PY]) * Volume,0.00) END [Price Impact]
		,CASE WHEN ISNULL([Lag Volume],0.00)  = 0 THEN [Revenue Adjusted] 
			  WHEN ISNULL([Volume],0.00) = 0 THEN [Lag Revenue] * -1
			  ELSE (Volume - [Lag Volume]) * ISNULL([ASP PY],0.00)
			  END [Volume Impact]
INTO info.fact_invoiceline_netimpact_credit
FROM (		 
SELECT * 
		,LAG(volume) OVER (PARTITION BY Lab, Product, right(convert(char(8), [Invoice Year Month], 112), 4) ORDER BY [year]) [Lag Volume]
		,LAG([Revenue Adjusted]) OVER (PARTITION BY Lab, Product,  right(convert(char(8), [Invoice Year Month], 112), 4) ORDER BY [year]) [Lag Revenue]
		,CASE WHEN LAG(volume) OVER (PARTITION BY Lab, Product,right(convert(char(8), [Invoice Year Month], 112), 4) ORDER BY [year])  = 0 THEN 0 ELSE
		 CAST(LAG([Revenue Adjusted]) OVER (PARTITION BY Lab, Product, right(convert(char(8), [Invoice Year Month], 112), 4)  ORDER BY [year])  
		  / LAG(volume) OVER (PARTITION BY Lab, Product,right(convert(char(8), [Invoice Year Month], 112), 4) ORDER BY [year]) AS DECIMAL(12,2)) END [ASP PY]
FROM #temp ) a


RETURN
GO
