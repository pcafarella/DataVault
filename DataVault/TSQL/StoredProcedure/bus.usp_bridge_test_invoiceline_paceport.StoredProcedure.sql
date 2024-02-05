/****** Object:  StoredProcedure [bus].[usp_bridge_test_invoiceline_paceport]    Script Date: 1/30/2024 2:45:18 PM ******/
DROP PROCEDURE [bus].[usp_bridge_test_invoiceline_paceport]
GO
/****** Object:  StoredProcedure [bus].[usp_bridge_test_invoiceline_paceport]    Script Date: 1/30/2024 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE     PROCEDURE [bus].[usp_bridge_test_invoiceline_paceport] AS

 -- exec bus.usp_bridge_test_invoiceline_paceport

IF Object_id('bus.bridge_test_invoiceline_paceport') iS NOT NULL DROP TABLE bus.bridge_test_invoiceline_paceport  

SELECT  l_invoice_invoiceline.hk_l_invoice_invoiceline AS hk_l_invoice_invoiceline,
           l_paceaccount_customer_invoice.hk_l_paceaccount_customer_invoice AS hk_l_paceaccount_customer_invoice,
           l_test_invoiceline.hk_l_test_invoiceline AS hk_l_test_invoiceline,
           l_test_product.hk_l_test_product AS hk_l_test_product,
           l_test_sample.hk_l_test_sample AS hk_l_test_sample,
           l_workorder_test.hk_l_workorder_test AS hk_l_workorder_test,
           h_customer.hk_h_customer AS hk_h_customer,
           h_invoice.hk_h_invoice AS hk_h_invoice,
           h_invoiceline.hk_h_invoiceline AS hk_h_invoiceline,
           h_pace_account.hk_h_pace_account AS hk_h_pace_account,
           h_product.hk_h_product AS hk_h_product,
           h_sample.hk_h_sample AS hk_h_sample,
           h_test.hk_h_test AS hk_h_test,
           h_work_order.hk_h_work_order AS hk_h_work_order,
           h_customer.account_no AS account_no,
           h_customer.account_no_bkcc AS account_no_bkcc,
           h_invoice.invoice_no_bkcc AS invoice_bkcc,
           h_invoice.invoice_no AS invoice_no,
           h_invoiceline.invoiceline_no AS invoiceline_no,
           h_invoiceline.invoiceline_no_bkcc AS invoiceline_no_bkcc,
           h_pace_account.pace_account_no AS pace_account_no,
           h_pace_account.pace_account_no_bkcc AS pace_account_no_bkcc,
           h_product.product_code AS product_code,
           h_product.product_code_bkcc AS product_code_bkcc,
           h_sample.sample_no AS sample_no,
           h_sample.sample_no_bkcc AS sample_no_bkcc,
           h_invoice.tenant_id AS tenant_id,
           h_test.test_no AS test_no,
           h_test.test_no_bkcc AS test_no_bkcc,
           h_work_order.work_order_no AS work_order_no,
           h_work_order.work_order_no_bkcc AS work_order_no_bkcc ,
           CURRENT_TIMESTAMP AS dss_snapshot_date
	INTO bus.[bridge_test_invoiceline_paceport]
FROM Raw.[h_invoice] h_invoice 
JOIN Raw.[l_invoice_invoiceline] l_invoice_invoiceline  ON l_invoice_invoiceline.hk_h_invoice = h_invoice.hk_h_invoice
LEFT OUTER JOIN Raw.[h_invoiceline] h_invoiceline  ON l_invoice_invoiceline.hk_h_invoiceline = h_invoiceline.hk_h_invoiceline
LEFT OUTER JOIN Raw.[l_paceaccount_customer_invoice] l_paceaccount_customer_invoice  ON l_paceaccount_customer_invoice.hk_h_invoice = h_invoice.hk_h_invoice
LEFT OUTER JOIN Raw.[h_pace_account] h_pace_account  ON h_pace_account.hk_h_pace_account = l_paceaccount_customer_invoice.hk_h_pace_account
LEFT OUTER JOIN Raw.[h_customer] h_customer   ON h_customer.hk_h_customer = l_paceaccount_customer_invoice.hk_h_customer
LEFT OUTER JOIN Raw.[l_test_invoiceline] l_test_invoiceline  ON l_test_invoiceline.hk_h_invoiceline = h_invoiceline.hk_h_invoiceline
LEFT OUTER JOIN Raw.[h_test] h_test  ON l_test_invoiceline.hk_h_test = h_test.hk_h_test
LEFT OUTER JOIN Raw.[l_workorder_test] l_workorder_test  (NOLOCK)ON l_workorder_test.hk_h_test = h_test.hk_h_test
LEFT OUTER JOIN Raw.[h_work_order] h_work_order  ON l_workorder_test.hk_h_work_order = h_work_order.hk_h_work_order
LEFT OUTER JOIN Raw.[l_test_sample] l_test_sample   (NOLOCK)ON l_test_sample.hk_h_test = h_test.hk_h_test
LEFT OUTER JOIN Raw.[h_sample] h_sample  ON l_test_sample.hk_h_sample = h_sample.hk_h_sample
LEFT OUTER JOIN Raw.[l_test_product] l_test_product  (NOLOCK)ON l_test_product.hk_h_test = h_test.hk_h_test
LEFT OUTER JOIN Raw.[h_product] h_product  ON l_test_product.hk_h_product = h_product.hk_h_product  

RETURN

 
 
GO