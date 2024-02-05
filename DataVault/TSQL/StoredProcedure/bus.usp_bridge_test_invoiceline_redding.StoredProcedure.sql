/****** Object:  StoredProcedure [bus].[usp_bridge_test_invoiceline_redding]    Script Date: 1/30/2024 2:45:18 PM ******/
DROP PROCEDURE [bus].[usp_bridge_test_invoiceline_redding]
GO
/****** Object:  StoredProcedure [bus].[usp_bridge_test_invoiceline_redding]    Script Date: 1/30/2024 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 CREATE         PROCEDURE [bus].[usp_bridge_test_invoiceline_redding] AS

 -- exec [Bus].[usp_bridge_test_invoiceline_redding]

IF Object_id('bus.bridge_test_invoiceline_redding') iS NOT NULL DROP TABLE bus.bridge_test_invoiceline_redding

SELECT       l_paceaccount_customer_invoice.hk_l_paceaccount_customer_invoice  
           , l_customer_workorder.hk_l_customer_workorder AS hk_l_customer_workorder 
           , l_project_workorder.hk_l_project_workorder AS hk_l_project_workorder 
           , l_test_invoice.hk_l_test_invoice AS hk_l_test_invoice 
           , l_test_product.hk_l_test_product AS hk_l_test_product 
           , l_test_sample.hk_l_test_sample AS hk_l_test_sample 
           , l_workorder_test.hk_l_workorder_test AS hk_l_workorder_test 
		   , NULL AS hk_l_ancillary_invoiceitem
		   , NULL AS hk_l_test_invoice_credit
           , h_customer.hk_h_customer AS hk_h_customer 
           , h_invoice.hk_h_invoice AS hk_h_invoice 
           , h_pace_account.hk_h_pace_account AS hk_h_pace_account 
           , h_product.hk_h_product AS hk_h_product 
           , h_project.hk_h_project AS hk_h_project 
           , h_sample.hk_h_sample AS hk_h_sample 
           , h_test.hk_h_test AS hk_h_test 
           , h_work_order.hk_h_work_order AS hk_h_work_order 
           , h_customer.account_no AS account_no 
           , h_customer.account_no_bkcc AS account_no_bkcc 
           , h_invoice.invoice_no_bkcc AS invoice_bkcc 
           , h_invoice.invoice_no AS invoice_no 
           , h_pace_account.pace_account_no AS pace_account_no 
           , h_pace_account.pace_account_no_bkcc AS pace_account_no_bkcc 
           , h_product.product_code AS product_code 
           , h_product.product_code_bkcc AS product_code_bkcc 
           , h_project.project_no AS project_no 
           , h_project.project_no_bkcc AS project_no_bkcc 
           , h_sample.sample_no AS sample_no 
           , h_sample.sample_no_bkcc AS sample_no_bkcc 
           , h_invoice.tenant_id AS tenant_id 
           , h_test.test_no AS test_no 
           , h_test.test_no_bkcc AS test_no_bkcc 
           , h_work_order.work_order_no AS work_order_no 
           , h_work_order.work_order_no_bkcc AS work_order_no_bkcc 
		   , NULL AS description
           , CURRENT_TIMESTAMP AS dss_snapshot_date 
		 INTO bus.bridge_test_invoiceline_redding
FROM raw.h_invoice
LEFT JOIN raw.[l_test_invoice] ON l_test_invoice.hk_h_invoice= h_invoice.hk_h_invoice
LEFT JOIN raw.[h_test] h_test ON h_test.hk_h_test = l_test_invoice.hk_h_test
LEFT JOIN raw.[l_test_product] l_test_product ON l_test_product.hk_h_test = h_test.hk_h_test
LEFT JOIN raw.[h_product] h_product ON l_test_product.hk_h_product = h_product.hk_h_product
LEFT JOIN raw.[l_workorder_test] l_workorder_test ON l_workorder_test.hk_h_test = h_test.hk_h_test
LEFT JOIN raw.[h_work_order] h_work_order ON l_workorder_test.hk_h_work_order = h_work_order.hk_h_work_order
LEFT JOIN raw.[l_customer_workorder] l_customer_workorder ON l_customer_workorder.hk_h_work_order = h_work_order.hk_h_work_order
LEFT JOIN raw.[h_customer] h_customer ON h_customer.hk_h_customer = l_customer_workorder.hk_h_customer
LEFT JOIN raw.[l_paceaccount_customer_invoice] [l_paceaccount_customer_invoice] ON [l_paceaccount_customer_invoice].hk_h_invoice = h_invoice.hk_h_invoice
LEFT JOIN raw.[h_pace_account] h_pace_account ON [l_paceaccount_customer_invoice].hk_h_pace_account = h_pace_account.hk_h_pace_account
LEFT JOIN raw.[l_project_workorder] l_project_workorder ON l_project_workorder.hk_h_work_order = h_work_order.hk_h_work_order
LEFT JOIN raw.[h_project] h_project ON l_project_workorder.hk_h_project = h_project.hk_h_project
LEFT JOIN raw.[l_test_sample] l_test_sample ON l_test_sample.hk_h_test = h_test.hk_h_test
LEFT JOIN raw.[h_sample] h_sample ON l_test_sample.hk_h_sample = h_sample.hk_h_sample
WHERE h_invoice.tenant_id IN ('lims28')
 
UNION ALL

SELECT    l_paceaccount_customer_invoice.hk_l_paceaccount_customer_invoice  
           , NULL AS hk_l_customer_workorder 
           , NULL AS hk_l_project_workorder 
           , NULL AS hk_l_test_invoice 
           , NULL AS hk_l_test_product 
           , NULL AS hk_l_test_sample 
           , NULL AS hk_l_workorder_test 
		   , l_ancillary_invoiceitem.hk_l_ancillary_invoiceitem AS hk_l_ancillary_invoiceitem
		   , NULL AS hk_l_test_invoice_credit
           , h_customer.hk_h_customer AS hk_h_customer 
           , h_invoice.hk_h_invoice AS hk_h_invoice 
           , h_pace_account.hk_h_pace_account AS hk_h_pace_account 
           , NULL AS hk_h_product 
           , NULL AS hk_h_project 
           , NULL AS hk_h_sample 
           , NULL AS hk_h_test 
           , NULL AS hk_h_work_order 
           , h_customer.account_no AS account_no 
           , h_customer.account_no_bkcc AS account_no_bkcc 
           , h_invoice.invoice_no_bkcc AS invoice_bkcc 
           , h_invoice.invoice_no AS invoice_no 
           , h_pace_account.pace_account_no AS pace_account_no 
           , h_pace_account.pace_account_no_bkcc AS pace_account_no_bkcc 
           , NULL AS product_code 
           , NULL AS product_code_bkcc 
           , NULL AS project_no 
           , NULL AS project_no_bkcc 
           , NULL AS sample_no 
           , NULL AS sample_no_bkcc 
           , h_invoice.tenant_id AS tenant_id 
           , NULL AS test_no 
           , NULL AS test_no_bkcc 
           , NULL AS work_order_no 
           , NULL AS work_order_no_bkcc 
		   , l_ancillary_invoiceitem.description
           , CURRENT_TIMESTAMP AS dss_snapshot_date 
FROM raw.l_ancillary_invoiceitem
LEFT JOIN raw.h_invoice ON l_ancillary_invoiceitem.hk_h_invoice = h_invoice.hk_h_invoice
LEFT JOIN raw.[l_paceaccount_customer_invoice]    ON  l_paceaccount_customer_invoice.hk_h_invoice = h_invoice.hk_h_invoice
LEFT JOIN raw.[h_customer] h_customer ON h_customer.hk_h_customer = l_paceaccount_customer_invoice.hk_h_customer
LEFT JOIN raw.[h_pace_account] h_pace_account ON l_paceaccount_customer_invoice.hk_h_pace_account = h_pace_account.hk_h_pace_account
WHERE h_invoice.tenant_id  IN ('lims28')
 
UNION ALL

SELECT	   l_paceaccount_customer_invoice.hk_l_paceaccount_customer_invoice   
        , l_customer_workorder.hk_l_customer_workorder AS hk_l_customer_workorder 
        , l_project_workorder.hk_l_project_workorder AS hk_l_project_workorder 
        , NULL AS hk_l_test_invoice 
        , l_test_product.hk_l_test_product AS hk_l_test_product 
        , l_test_sample.hk_l_test_sample AS hk_l_test_sample 
        , l_workorder_test.hk_l_workorder_test AS hk_l_workorder_test 
		, NULL AS hk_l_ancillary_invoiceitem
		, l_test_invoice_credit.hk_l_test_invoice_credit AS hk_l_test_invoice_credit
        , h_customer.hk_h_customer AS hk_h_customer 
        , h_invoice.hk_h_invoice AS hk_h_invoice 
        , h_pace_account.hk_h_pace_account AS hk_h_pace_account 
        , h_product.hk_h_product AS hk_h_product 
        , h_project.hk_h_project AS hk_h_project 
        , h_sample.hk_h_sample AS hk_h_sample 
        , h_test.hk_h_test AS hk_h_test 
        , h_work_order.hk_h_work_order AS hk_h_work_order 
        , h_customer.account_no AS account_no 
        , h_customer.account_no_bkcc AS account_no_bkcc 
        , h_invoice.invoice_no_bkcc AS invoice_bkcc 
        , h_invoice.invoice_no AS invoice_no 
        , h_pace_account.pace_account_no AS pace_account_no 
        , h_pace_account.pace_account_no_bkcc AS pace_account_no_bkcc 
        , h_product.product_code AS product_code 
        , h_product.product_code_bkcc AS product_code_bkcc 
        , h_project.project_no AS project_no 
        , h_project.project_no_bkcc AS project_no_bkcc 
        , h_sample.sample_no AS sample_no 
        , h_sample.sample_no_bkcc AS sample_no_bkcc 
        , h_invoice.tenant_id AS tenant_id 
        , h_test.test_no AS test_no 
        , h_test.test_no_bkcc AS test_no_bkcc 
        , h_work_order.work_order_no AS work_order_no 
        , h_work_order.work_order_no_bkcc AS work_order_no_bkcc 
		, NULL AS description
        , CURRENT_TIMESTAMP AS dss_snapshot_date
		--select top 100 l_test_invoice_credit .*
FROM raw.l_test_invoice_credit 
LEFT JOIN raw.h_invoice ON h_invoice.hk_h_invoice = l_test_invoice_credit.hk_h_invoice
LEFT JOIN raw.[h_test] h_test ON h_test.hk_h_test = l_test_invoice_credit.hk_h_test
LEFT JOIN raw.[l_test_sample] l_test_sample ON l_test_sample.hk_h_test = h_test.hk_h_test
LEFT JOIN raw.[h_sample] h_sample ON l_test_sample.hk_h_sample = h_sample.hk_h_sample
LEFT JOIN raw.[l_test_product] l_test_product ON l_test_product.hk_h_test = h_test.hk_h_test
LEFT JOIN raw.[h_product] h_product ON l_test_product.hk_h_product = h_product.hk_h_product
LEFT JOIN raw.[l_workorder_test] l_workorder_test ON l_workorder_test.hk_h_test = h_test.hk_h_test
LEFT JOIN raw.[h_work_order] h_work_order ON l_workorder_test.hk_h_work_order = h_work_order.hk_h_work_order
LEFT JOIN raw.[l_customer_workorder] l_customer_workorder ON l_customer_workorder.hk_h_work_order = h_work_order.hk_h_work_order
LEFT JOIN raw.[h_customer] h_customer ON h_customer.hk_h_customer = l_customer_workorder.hk_h_customer
LEFT JOIN raw.[l_paceaccount_customer_invoice]    ON  l_paceaccount_customer_invoice.hk_h_invoice = h_invoice.hk_h_invoice
LEFT JOIN raw.[h_pace_account] h_pace_account ON l_paceaccount_customer_invoice.hk_h_pace_account = h_pace_account.hk_h_pace_account
LEFT JOIN raw.[l_project_workorder] l_project_workorder ON l_project_workorder.hk_h_work_order = h_work_order.hk_h_work_order
LEFT JOIN raw.[h_project] h_project ON l_project_workorder.hk_h_project = h_project.hk_h_project
WHERE h_invoice.tenant_id ='lims28'
 

RETURN

 
GO
