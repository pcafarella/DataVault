/****** Object:  StoredProcedure [info].[usp_fact_invoiceline_paceport_er]    Script Date: 1/30/2024 2:45:18 PM ******/
DROP PROCEDURE [info].[usp_fact_invoiceline_paceport_er]
GO
/****** Object:  StoredProcedure [info].[usp_fact_invoiceline_paceport_er]    Script Date: 1/30/2024 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE     PROCEDURE [info].[usp_fact_invoiceline_paceport_er] AS 
 
-- exec info.usp_fact_invoiceline_paceport_er

IF Object_id('info.fact_invoiceline_paceport_er') IS NOT NULL drop table info.fact_invoiceline_paceport_er

;WITH market as (
SELECT  ctab_id, aux_data_id , MAX(aux_data +'-'+cl1.choice_desc)  Market
FROM  ref.r_dmart_aux_data a
INNER JOIN ref.r_dmart_auxiliary_data ad on (a.system_id = ad.system_id AND ad.aux_data_format = a.aux_data_format and a.aux_field = ad.field_number)
LEFT OUTER JOIN ref.r_dmart_choice_lists cl1 on (ad.system_id = cl1.ctab_id AND cl1.code_type = ad.choice_list and cl1.legal_value = a.aux_data and a.aux_field = 1)
WHERE  a.aux_data_type = 'R' and a.aux_data_format = 'MRKT'
GROUP BY ctab_id,aux_data_id)
,industry AS (
SELECT  ctab_id, aux_data_id ,  MAX(aux_data +'-'+cl2.choice_desc) Industry
FROM ref.r_dmart_aux_data a
INNER JOIN ref.r_dmart_auxiliary_data ad on (a.system_id = ad.system_id AND ad.aux_data_format = a.aux_data_format and a.aux_field = ad.field_number)
LEFT OUTER JOIN ref.r_dmart_choice_lists cl2 on (ad.system_id = cl2.ctab_id AND cl2.code_type = ad.choice_list and cl2.legal_value = a.aux_data and a.aux_field = 2)
WHERE aux_data_type = 'R' and a.aux_data_format = 'MRKT'
GROUP BY  ctab_id,aux_data_id)

SELECT  CASE WHEN sil.charge >= 0 THEN 'Invoice' ELSE 'Credit' END [Accounting Type],
		-1 [Adjusted Pct],
	    COALESCE(LEFT(sc.flags,1),'Blank Buyer') Buyer,
        LTRIM(b.pace_account_no) [Customer Nbr],
		--Extended Price = Extended_Cost / % / qty
		CASE WHEN NULLIF(sil.percentfactor,0) IS NULL THEN CAST((sil.charge / ISNULL(NULLIF(sil.qty,0),1)) AS DECIMAL(12,2))  ELSE CAST(((sil.charge / ISNULL(NULLIF(sil.qty,0),1)) / (ISNULL(NULLIF(sil.percentfactor,0),1) / 100)) / ISNULL(NULLIF(sil.qty,0),1) AS DECIMAL(12,2)) END [Extended Price],
		-- Extended cost - charge
		CAST(sil.charge AS DECIMAL(12,2))  [Extended Cost],
		CAST(sil.charge AS DECIMAL(12,2))  [Revenue Adjusted],
		-- Factor = (Extended_Cost - (Extended_Price * qty)) / qty
	    CASE WHEN NULLIF(sil.percentfactor,0)  IS NULL THEN cast(0 as DECIMAL(12,2)) ELSE CAST((sil.charge / ISNULL(NULLIF(sil.qty,0),1)) - (((sil.charge / ISNULL(NULLIF(sil.qty,0),1)) / (ISNULL(NULLIF(sil.percentfactor,0),1) / 100)) / ISNULL(NULLIF(sil.qty,0),1) * ISNULL(NULLIF(sil.qty,0),1)) / ISNULL(NULLIF(sil.qty,0),1) AS DECIMAL(12,2)) END  [Factor Amount],
	    COALESCE(industry.Industry, 'Blank Industry') Industry,
		CAST(si.actual_date AS DATE) [Invoice Date],
		b.invoice_no [Invoice Nbr],
	    CASE WHEN cir.ir_customer_no IS NOT NULL THEN 'Working' ELSE 'Standard' END [Invoice Type],
		CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 1 ELSE 0 END AS Bit) [Is IR Customer],
		CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 0 ELSE 1 END AS Bit) [Is Owner or Standard],
		CAST(0 AS Bit) [Is Pan File],
		CAST(0 AS Bit) [Is SISOSUB],
		RIGHT(b.tenant_id,2) Lab,
		COALESCE(sil.location,'Blank Location') Location,
		'1900-01-01' [Login Date],
		 COALESCE(market.Market, 'Blank Market') Market, 
		-1 [Nbr Days],
		-1 [Nbr Working Days],
		COALESCE(b.product_code, sil.part, 'Blank Product') Product, 
		b.tenant_id [Source Name],	
		-1 TAT,
	   'placeholder' [TAT Code],
		CAST(COALESCE(ISNULL(NULLIF(sil.qty,0.00),1.00),0.00) AS float) Volume, 
		COALESCE(b.work_order_no,'') [Word Order Desc],
		0 total_amt
INTO info.fact_invoiceline_paceport_er
FROM bus.bridge_test_invoiceline_paceport b 
LEFT OUTER JOIN bus.s_invoice_mroc_paceport_current  si ON si.hk_h_invoice = b.hk_h_invoice -- 1043445
LEFT OUTER JOIN bus.s_invoiceline_mroc_current sil ON sil.hk_h_invoiceline = b.hk_h_invoiceline -- 1043445
LEFT OUTER JOIN bus.s_customer_mroc_paceport_current  sc ON sc.hk_h_customer = b.hk_h_customer 
LEFT OUTER JOIN bus.s_work_order_mroc_paceport_current  sww ON sww.hk_h_work_order = b.hk_h_work_order 
LEFT OUTER JOIN market ON market.ctab_id = b.tenant_id AND sww.reqnbr = market.aux_data_id 
LEFT OUTER JOIN industry ON industry.ctab_id =b.tenant_id AND sww.reqnbr = industry.aux_data_id 
LEFT OUTER JOIN mas.customer_interregional  cir ON LTRIM(RTRIM(cir.ir_customer_no)) = LTRIM(RTRIM(b.pace_account_no))
WHERE sil.charge <> 0
  AND si.actual_date >= '2021-01-01'
  AND b.pace_account_no  IN ('10-118160','10-118134','30-369063','10-118141','60-533423','20-386154','20-387904','20-388607','24-233647','24-289779','24-307942','24-312733','26-101922','30-366665','35-002011','40-403222','51-100387','60-520070','60-532499','60-533132','77-101091','92-617836','92-620669')

RETURN

 
GO
