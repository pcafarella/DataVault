/****** Object:  StoredProcedure [info].[usp_fact_invoiceline_national]    Script Date: 1/30/2024 2:45:18 PM ******/
DROP PROCEDURE [info].[usp_fact_invoiceline_national]
GO
/****** Object:  StoredProcedure [info].[usp_fact_invoiceline_national]    Script Date: 1/30/2024 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [info].[usp_fact_invoiceline_national] AS 

-- exec info.usp_fact_invoiceline_national

IF Object_id('info.fact_invoiceline_national') IS NOT NULL drop table info.fact_invoiceline_national

SELECT  CASE WHEN stn.price >= 0 THEN 'Invoice' ELSE 'Credit' END [Accounting Type],
		-1 [Adjusted Pct],
	    COALESCE(spjn.buyer_type, scn.buyer_type, 'Blank Buyer') Buyer,
        b.pace_account_no [Customer Nbr],
		CAST(stn.price AS DECIMAL(12,2)) [Extended Price],
		CAST(stn.price * stn.percentfactor AS DECIMAL(12,2)) [Extended Cost],
		CAST(stn.price * stn.percentfactor AS DECIMAL(12,2)) [Revenue Adjusted],
		CAST((stn.price * stn.percentfactor) - stn.price AS DECIMAL(12,2)) [Factor Amount],
	    COALESCE(spjn.Industry_Sector, scn.Industry_Sector, 'Blank Industry') Industry,
		CAST(sinc.invoicedate AS DATE) [Invoice Date],
		b.invoice_no [Invoice Nbr],
	    CASE WHEN cir.ir_customer_no IS NOT NULL THEN 'Working' ELSE 'Standard' END [Invoice Type],
		CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 1 ELSE 0 END AS Bit) [Is IR Customer],
		CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 0 ELSE 1 END AS Bit) [Is Owner or Standard],
		CAST(1 AS Bit) [Is Pan File],
		CAST(0 AS Bit) [Is SISOSUB],
		CASE WHEN ISNUMERIC(LEFT(b.pace_account_no,2)) = 1 THEN CAST(COALESCE(LEFT(b.pace_account_no,2),0) AS SMALLINT) ELSE 0 END Lab,
		COALESCE(scn.sample_state, 'Blank Location') Location,
		ISNULL(ssn.receivedate,'1900-01-01') [Login Date],
		COALESCE(spjn.Market_Segment, scn.Market_Segment, 'Blank Market') Market, 
		-1 [Nbr Days],
		-1 [Nbr Working Days],
		COALESCE(COALESCE(spn.method, b.product_code) +  ' '+ COALESCE(c_seedpak_matrixdef.matrix,''),'Blank Product') Product, 
		'lims80' [Source Name],	
		-1 TAT,
		'placeholder' [TAT Code],
		CAST(1 AS SMALLINT) Volume, 
		COALESCE(b.work_order_no,'') [Word Order Desc],
		0 total_amt
INTO info.fact_invoiceline_national
FROM bus.bridge_test_invoiceline_national b
LEFT OUTER JOIN bus.s_test_hroc_national_current stn ON stn.hk_h_test = b.hk_h_test  
LEFT OUTER JOIN bus.s_sample_mroc_national_current  ssn ON ssn.hk_h_sample = b.hk_h_sample  
LEFT OUTER JOIN bus.s_invoice_mroc_national_current sinc ON sinc.hk_h_invoice =  b.hk_h_invoice 
LEFT OUTER JOIN bus.s_project_mroc_national_current  spjn ON spjn.hk_h_project = b.hk_h_project 
lEFT OUTER JOIN bus.s_customer_mroc_national_current scn ON scn.hk_h_customer = b.hk_h_customer
LEFT OUTER JOIN bus.s_product_mroc_national_current spn ON spn.hk_h_product = b.hk_h_product 
LEFT OUTER JOIN mas.customer_interregional cir ON LTRIM(RTRIM(cir.ir_customer_no)) = LTRIM(RTRIM(b.pace_account_no))
LEFT OUTER JOIN ref.r_seedpak_matrixdef c_seedpak_matrixdef ON c_seedpak_matrixdef.matnum = spn.matrix
WHERE stn.price <> 0
AND stn.class IN ('P','S')
AND ISNULL(ssn.samp_function,'L') = 'L' --verify
AND sinc.invoicedate >= '2021-01-01'   --4,807,504   00:07:05
 
 RETURN

 
GO
