/****** Object:  StoredProcedure [info].[usp_fact_invoiceline_peoria]    Script Date: 1/30/2024 2:45:18 PM ******/
DROP PROCEDURE [info].[usp_fact_invoiceline_peoria]
GO
/****** Object:  StoredProcedure [info].[usp_fact_invoiceline_peoria]    Script Date: 1/30/2024 2:45:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 


 
CREATE               PROCEDURE [info].[usp_fact_invoiceline_peoria] AS 
 
-- exec info.usp_fact_invoiceline_peoria 

IF OBJECT_ID('info.fact_invoiceline_peoria_ancillary') IS NOT NULL DROP TABLE info.fact_invoiceline_peoria_ancillary
IF OBJECT_ID('info.fact_invoiceline_peoria_credit') IS NOT NULL DROP TABLE info.fact_invoiceline_peoria_credit
IF OBJECT_ID('info.fact_invoiceline_peoria_invoice') IS NOT NULL DROP TABLE info.fact_invoiceline_peoria_invoice 

DECLARE @dss_snapshot_date DATETIME, @invoice_no varchar(50)
SELECT @dss_snapshot_date = (SELECT MAX(dss_snapshot_date) from bus.bridge_test_invoiceline_peoria)
 
SELECT CASE WHEN (stw.price * stw.surcharge/ 100) + stw.price < 0 THEN 'Credit' ELSE 'Invoice' END [Accounting Type],
		 -1 [Adjusted Pct],
	      COALESCE(NULLIF(LTRIM(RTRIM(sprw.ClientType)),''),'-1') Buyer,
		 COALESCE(LTRIM(NULLIF(h_pace_account.pace_account_no,'')),'-1') [Customer Nbr],
         CAST(stw.price AS Decimal(12,2)) [Extended Price],
		 CAST(ROUND(((stw.price * stw.surcharge/ 100) + stw.price),2) AS Decimal(12,2)) [Extended Cost],
	     CAST(ROUND(((stw.price * stw.surcharge/ 100) + stw.price),2) AS Decimal(12,2)) [Revenue Adjusted],
         CAST(ROUND((stw.Price * stw.Surcharge / 100 + stw.Price)  - stw.Price,2) AS Decimal(12,2)) [Factor Amount],
	     '-1' Industry, 
		 CAST(siw.invoiceDate AS DATE) [Invoice Date],
		 h_invoice.Invoice_no [Invoice Nbr], 
		 CASE WHEN cir.ir_customer_no IS NOT NULL THEN 'Working' ELSE 'Standard' END [Invoice Type],
		 CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 1 ELSE 0 END AS Bit) [Is IR Customer],
		 CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 0 ELSE 1 END AS Bit) [Is Owner or Standard],
		 CAST(0 AS Bit) [Is Pan File],
		 CAST(0 AS Bit) [Is SISOSUB],
		 COALESCE(LEFT(LTRIM(NULLIF(h_pace_account.pace_account_no,'')) ,2),'-1') Lab,
		 COALESCE(NULLIF(sprw.Location, ''),'-1') Location,
		 COALESCE(ssw.samplereceived,'1900-01-01') [Login Date],
		 '-1'  Market,
	     '-1' [Nbr Days],
	 	 '-1' [Nbr Working Days],
		 LTRIM(RTRIM(h_product.product_code)) Product, 
		 'lims72' [Source Name],
		'-1' TAT,
	    'placeholder' [TAT Code],
		 1 Volume, 
		 b.sample_no+'|'+h_work_order.work_order_no [Word Order Desc],
		 CAST(ROUND(siw.invoicetotal,2) AS DECIMAL(12,2)) total_amt 
 INTO info.fact_invoiceline_peoria_invoice
 --select top 1000 h_pace_account.*
FROM  bus.bridge_test_invoiceline_peoria b
INNER JOIN raw.h_test on h_test.hk_h_test = b.hk_h_test
LEFT OUTER JOIN raw.h_invoice h_invoice ON h_invoice.hk_h_invoice = b.hk_h_invoice
LEFT OUTER JOIN raw.h_product h_product ON  h_product.hk_h_product  = b.hk_h_product
LEFT OUTER JOIN raw.h_work_order h_work_order ON h_work_order.hk_h_work_order= b.hk_h_work_order
LEFT OUTER JOIN raw.h_pace_account h_pace_account ON h_pace_account.hk_h_pace_account= b.hk_h_pace_account
LEFT OUTER JOIN raw.h_customer h_customer On h_customer.hk_h_customer = b.hk_h_customer
LEFT OUTER JOIN bus.s_test_hroc_peoria_current stw ON stw.hk_h_test = b.hk_h_test -- 1043445
LEFT OUTER JOIN bus.s_work_order_mroc_peoria_current sww ON sww.hk_h_work_order = b.hk_h_work_order
LEFT OUTER JOIN bus.s_sample_mroc_peoria_current ssw ON ssw.hk_h_sample = b.hk_h_sample
LEFT OUTER JOIN bus.s_invoice_mroc_peoria_current siw ON siw.hk_h_invoice = b.hk_h_invoice
LEFT OUTER JOIN bus.s_project_mroc_peoria_current sprw ON sprw.hk_h_project = b.hk_h_project
LEFT OUTER JOIN mas.customer_interregional cir ON LTRIM(RTRIM(cir.ir_customer_no)) = LTRIM(RTRIM(h_pace_account.pace_account_no)) 
WHERE b.tenant_id = 'lims72'
AND siw.invoicedate >= '2021-01-01'
AND siw.isposted = 1
AND siw.invoicedate < CAST(YEAR(getdate()) AS VARCHAR)+'-'+CAST(MONTH(getdate()) AS VARCHAR)+ '-01'
AND (stw.price * stw.surcharge/ 100) + stw.price !=0
AND b.hk_l_test_invoice_credit IS NULL
AND COALESCE(b.pace_account_no, '00-000000') NOT IN ('44-631225','CA1234','MC1002')
AND ISNUMERIC(LEFT(LTRIM(RTRIM(b.pace_account_no)),2)) =1
 AND b.dss_snapshot_date = @dss_snapshot_date
AND COALESCE(@invoice_no, b.invoice_no) = b.invoice_no

SELECT  CASE WHEN quantity < 0 THEN 'Credit' ELSE 'Invoice' END   [Accounting Type],
		 '-1' [Adjusted Pct],
		  COALESCE(NULLIF(LTRIM(RTRIM(sprw.ClientType)),''),'-1') Buyer,
		 COALESCE(LTRIM(NULLIF(h_pace_account.pace_account_no,'')),'-1') [Customer Nbr],
         CASE WHEN quantity < 0 THEN ABS(CAST(ROUND(saiw.itemtotal,2) /ISNULL(NULLIF(ABS(quantity),0),1) AS Decimal(12,2))) * -1 
		                        ELSE  CAST(ROUND(saiw.itemtotal,2) /ISNULL(NULLIF(ABS(quantity),0),1) AS Decimal(12,2)) END [Extended Price],
		 CASE WHEN quantity < 0 THEN ABS(CAST(ROUND(saiw.itemtotal,2) AS Decimal(12,2)) ) * -1
		                        ELSE CAST(ROUND(saiw.itemtotal,2) AS Decimal(12,2)) END [Extended Cost],
		 CASE WHEN quantity < 0 THEN ABS(CAST(ROUND(saiw.itemtotal,2) AS Decimal(12,2)) ) * -1
		                        ELSE CAST(ROUND(saiw.itemtotal,2) AS Decimal(12,2)) END [Revenue Adjusted],
         CAST(0 AS Decimal(12,2)) [Factor Amount],
		 '-1' Industry, 
		 CAST(siw.invoiceDate AS DATE) [Invoice Date],
		 h_invoice.Invoice_no [Invoice Nbr], 
		 CASE WHEN cir.ir_customer_no IS NOT NULL THEN 'Working' ELSE 'Standard' END [Invoice Type],
		 CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 1 ELSE 0 END AS Bit) [Is IR Customer],
		 CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 0 ELSE 1 END AS Bit) [Is Owner or Standard],
		 CAST(0 AS Bit) [Is Pan File],
		 CAST(CASE WHEN h_customer.account_no like '%Pace%' THEN 1 ELSE 0 END AS Bit) [Is SISOSUB],
		 COALESCE(LEFT(LTRIM(NULLIF(h_pace_account.pace_account_no,'')) ,2),'-1') Lab,
		 COALESCE(NULLIF(sprw.Location, ''),'-1') Location,
		 COALESCE(ssw.samplereceived,'1900-01-01') [Login Date],
		 '-1'  Market,
	     '-1' [Nbr Days],
	 	 '-1' [Nbr Working Days],
		  LTRIM(RTRIM(b.[description])) Product, 
		 'lims72-Ancillary' [Source Name],
		'-1' TAT,
	    'placeholder' [TAT Code],
		 ABS(quantity) Volume, 
		 saiw.ItemType +CASE WHEN NULLIF(itemcode,'') is not null  then '|'+saiw.itemcode else '' END [Word Order Desc],
		 CAST(ROUND(siw.invoicetotal,2) AS DECIMAL(12,2)) total_amt 	
INTO info.fact_invoiceline_peoria_ancillary
FROM bus.bridge_test_invoiceline_peoria b
INNER JOIN raw.h_invoice h_invoice On h_invoice.hk_h_invoice = b.hk_h_invoice
LEFT OUTER JOIN raw.h_pace_account h_pace_account ON h_pace_account.hk_h_pace_account= b.hk_h_pace_account
LEFT OUTER JOIN raw.h_customer h_customer On h_customer.hk_h_customer = b.hk_h_customer
LEFT OUTER JOIN bus.s_invoice_mroc_peoria_current siw ON siw.hk_h_invoice =b.hk_h_invoice
LEFT OUTER JOIN bus.s_ancillary_invoiceitem_tran_peoria_current saiw ON saiw.hk_l_ancillary_invoiceitem = b.hk_l_ancillary_invoiceitem
LEFT OUTER JOIN bus.s_project_mroc_peoria_current sprw ON sprw.hk_h_project = b.hk_h_project
LEFT OUTER JOIN bus.s_sample_mroc_peoria_current ssw ON ssw.hk_h_sample = b.hk_h_sample
LEFT OUTER JOIN mas.customer_interregional cir ON LTRIM(RTRIM(cir.ir_customer_no)) = LTRIM(RTRIM(h_pace_account.pace_account_no)) 
WHERE b.tenant_id = 'lims72'
AND siw.isposted = 1
AND b.hk_l_ancillary_invoiceitem IS NOT NULL
AND siw.invoicedate >= '2021-01-01'
AND siw.invoicedate < CAST(YEAR(getdate()) AS VARCHAR)+'-'+CAST(MONTH(getdate()) AS VARCHAR)+ '-01'
AND saiw.itemtotal != 0 
AND COALESCE(b.pace_account_no, '00-000000') NOT IN ('44-631225','CA1234','MC1002')
AND ISNUMERIC(LEFT(LTRIM(RTRIM(b.pace_account_no)),2)) =1
AND b.dss_snapshot_date = @dss_snapshot_date
AND COALESCE(@invoice_no, b.invoice_no) = b.invoice_no

SELECT   'Credit' [Accounting Type],
		 '-1' [Adjusted Pct],
	      COALESCE(NULLIF(LTRIM(RTRIM(sprw.ClientType)),''),'-1') Buyer,
		 COALESCE(LTRIM(NULLIF(h_pace_account.pace_account_no,'')),'-1') [Customer Nbr],
		 CAST(saiw.price AS Decimal(12,2))*-1 [Extended Price],
		 CAST(ROUND(((saiw.price * saiw.surcharge/ 100) + saiw.price),2) AS Decimal(12,2))*-1 [Extended Cost],
	     CAST(ROUND(((saiw.price * saiw.surcharge/ 100) + saiw.price),2) AS Decimal(12,2))*-1  [Revenue Adjusted],
         CAST(ROUND((saiw.Price * saiw.Surcharge / 100 + saiw.Price)  - saiw.Price,2) AS Decimal(12,2))*-1  [Factor Amount],
		 '-1'  Industry,
		 CAST(siw.invoiceDate AS DATE) [Invoice Date],
		 h_invoice.Invoice_no [Invoice Nbr], 
		 CASE WHEN cir.ir_customer_no IS NOT NULL THEN 'Working' ELSE 'Standard' END [Invoice Type],
		 CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 1 ELSE 0 END AS Bit) [Is IR Customer],
		 CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 0 ELSE 1 END AS Bit) [Is Owner or Standard],
		 CAST(0 AS Bit) [Is Pan File],
		 CAST(0 AS Bit) [Is SISOSUB],
		 COALESCE(LEFT(LTRIM(NULLIF(h_pace_account.pace_account_no,'')) ,2),'-1') Lab,
		 COALESCE(NULLIF(sprw.Location, ''),'-1') Location,
		 COALESCE(ssw.samplereceived,'1900-01-01') [Login Date],
	   	 '-1'  Market,  
	     '-1' [Nbr Days],
	 	 '-1' [Nbr Working Days],
		 COALESCE(LTRIM(RTRIM(product_code)),saiw.Analysis,'-1') Product, 
		 'lims72-Credit' [Source Name],
	 	 '-1' TAT,
	     'placeholder' [TAT Code],
		  1 Volume, 
		  ISNULL(h_test.test_no,'-1')+'|'+h_work_order.work_order_no [Word Order Desc],
		  CAST(ROUND(siw.invoicetotal,2) AS DECIMAL(12,2)) total_amt 
INTO info.fact_invoiceline_peoria_credit 
FROM bus.bridge_test_invoiceline_peoria b
INNER JOIN raw.h_invoice h_invoice On  h_invoice.hk_h_invoice = b.hk_h_invoice
LEFT OUTER JOIN raw.h_test on h_test.hk_h_test = b.hk_h_test
LEFT OUTER JOIN raw.h_work_order on h_work_order.hk_h_work_order = b.hk_h_work_order
LEFT OUTER JOIN raw.h_pace_account h_pace_account ON h_pace_account.hk_h_pace_account= b.hk_h_pace_account
LEFT OUTER JOIN raw.h_customer h_customer On h_customer.hk_h_customer = b.hk_h_customer
LEFT OUTER JOIN bus.s_invoice_mroc_peoria_current siw ON siw.hk_h_invoice = b.hk_h_invoice
LEFT OUTER JOIN bus.s_work_order_mroc_peoria_current sww ON sww.hk_h_work_order = b.hk_h_work_order
LEFT OUTER JOIN bus.s_test_hroc_peoria_current stm ON stm.hk_h_test =b.hk_h_test
LEFT OUTER JOIN bus.s_test_invoice_credit_tran_peoria_current saiw ON saiw.hk_l_test_invoice_credit = b.hk_l_test_invoice_credit
LEFT OUTER JOIN bus.s_project_mroc_peoria_current sprw ON sprw.hk_h_project = b.hk_h_project
LEFT OUTER JOIN bus.s_sample_mroc_peoria_current ssw ON ssw.hk_h_sample = b.hk_h_sample
LEFT OUTER JOIN mas.customer_interregional cir ON LTRIM(RTRIM(cir.ir_customer_no)) = LTRIM(RTRIM(h_pace_account.pace_account_no)) 
WHERE b.tenant_id = 'lims72'
AND b.hk_l_test_invoice_credit IS NOT NULL
AND isposted = 1
AND siw.invoicedate >= '2021-01-01'
AND siw.invoicedate < CAST(YEAR(getdate()) AS VARCHAR)+'-'+CAST(MONTH(getdate()) AS VARCHAR)+ '-01'
AND saiw.iscredit = 1
AND saiw.price != 0
AND COALESCE(b.pace_account_no, '00-000000') NOT IN ('44-631225','CA1234','MC1002')
AND ISNUMERIC(LEFT(LTRIM(RTRIM(b.pace_account_no)),2)) =1
AND b.dss_snapshot_date = @dss_snapshot_date
AND COALESCE(@invoice_no, b.invoice_no) = b.invoice_no

UNION ALL
SELECT   'Invoice' [Accounting Type],
		 '-1' [Adjusted Pct],
	     COALESCE(NULLIF(LTRIM(RTRIM(sprw.ClientType)),''),'-1') Buyer,
		 COALESCE(LTRIM(NULLIF(h_pace_account.pace_account_no,'')),'-1') [Customer Nbr],
		 CAST(saiw.price AS Decimal(12,2)) [Extended Price],
		 CAST(ROUND(((saiw.price * saiw.surcharge/ 100) + saiw.price),2) AS Decimal(12,2)) [Extended Cost],
	     CAST(ROUND(((saiw.price * saiw.surcharge/ 100) + saiw.price),2) AS Decimal(12,2)) [Revenue Adjusted],
         CAST(ROUND((saiw.Price * saiw.Surcharge / 100 + saiw.Price)  - saiw.Price,2) AS Decimal(12,2)) [Factor Amount],
		 '-1' Industry,
		 CAST(siw.invoiceDate AS DATE) [Invoice Date],
		 h_invoice.Invoice_no [Invoice Nbr], 
		 CASE WHEN cir.ir_customer_no IS NOT NULL THEN 'Working' ELSE 'Standard' END [Invoice Type],
		 CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 1 ELSE 0 END AS Bit) [Is IR Customer],
		 CAST(CASE WHEN cir.ir_customer_no IS NOT NULL THEN 0 ELSE 1 END AS Bit) [Is Owner or Standard],
		 CAST(0 AS Bit) [Is Pan File],
		 CAST(0 AS Bit) [Is SISOSUB],
		 COALESCE(LEFT(LTRIM(NULLIF(h_pace_account.pace_account_no,'')) ,2),'-1') Lab,
		 COALESCE(NULLIF(sprw.Location, ''),'-1') Location,
		 COALESCE(ssw.samplereceived,'1900-01-01') [Login Date],
		 '-1' Market,  
	     '-1' [Nbr Days],
	 	 '-1' [Nbr Working Days],
		 COALESCE(LTRIM(RTRIM(product_code)),saiw.Analysis,'-1') Product, 
		 'lims72-Credit' [Source Name],
	 	 '-1' TAT,
	     'placeholder' [TAT Code],
		  1 Volume, 
		  ISNULL(h_test.test_no,'-1')+'|'+h_work_order.work_order_no [Word Order Desc],
		  CAST(ROUND(siw.invoicetotal,2) AS DECIMAL(12,2)) total_amt 
FROM bus.bridge_test_invoiceline_peoria b
INNER JOIN raw.h_invoice h_invoice On  h_invoice.hk_h_invoice = b.hk_h_invoice
LEFT OUTER JOIN raw.h_test on h_test.hk_h_test = b.hk_h_test
LEFT OUTER JOIN raw.h_work_order on h_work_order.hk_h_work_order = b.hk_h_work_order
LEFT OUTER JOIN raw.h_pace_account h_pace_account ON h_pace_account.hk_h_pace_account= b.hk_h_pace_account
LEFT OUTER JOIN raw.h_customer h_customer On h_customer.hk_h_customer = b.hk_h_customer
LEFT OUTER JOIN bus.s_invoice_mroc_peoria_current siw ON siw.hk_h_invoice = b.hk_h_invoice
LEFT OUTER JOIN bus.s_work_order_mroc_peoria_current sww ON sww.hk_h_work_order = b.hk_h_work_order
LEFT OUTER JOIN bus.s_test_hroc_peoria_current stm ON stm.hk_h_test =b.hk_h_test
LEFT OUTER JOIN bus.s_test_invoice_credit_tran_peoria_current saiw ON saiw.hk_l_test_invoice_credit = b.hk_l_test_invoice_credit
LEFT OUTER JOIN bus.s_project_mroc_peoria_current sprw ON sprw.hk_h_project = b.hk_h_project
LEFT OUTER JOIN bus.s_sample_mroc_peoria_current ssw ON ssw.hk_h_sample = b.hk_h_sample
LEFT OUTER JOIN mas.customer_interregional cir ON LTRIM(RTRIM(cir.ir_customer_no)) = LTRIM(RTRIM(h_pace_account.pace_account_no)) 
WHERE b.tenant_id = 'lims72'
AND b.hk_l_test_invoice_credit IS NOT NULL
AND isposted = 1
AND siw.invoicedate >= '2021-01-01'
AND siw.invoicedate < CAST(YEAR(getdate()) AS VARCHAR)+'-'+CAST(MONTH(getdate()) AS VARCHAR)+ '-01'
AND saiw.iscredit = 0
AND saiw.price != 0
AND COALESCE(b.pace_account_no, '00-000000') NOT IN ('44-631225','CA1234','MC1002')
AND ISNUMERIC(LEFT(LTRIM(RTRIM(b.pace_account_no)),2)) =1
AND b.dss_snapshot_date = @dss_snapshot_date
AND COALESCE(@invoice_no, b.invoice_no) = b.invoice_no


RETURN
 
GO
