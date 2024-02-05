/****** Object:  StoredProcedure [bus].[usp_bridge_test_invoiceline_national_inner]    Script Date: 1/30/2024 2:45:18 PM ******/
DROP PROCEDURE [bus].[usp_bridge_test_invoiceline_national_inner]
GO
/****** Object:  StoredProcedure [bus].[usp_bridge_test_invoiceline_national_inner]    Script Date: 1/30/2024 2:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE       PROCEDURE [bus].[usp_bridge_test_invoiceline_national_inner]  AS

--  exec bus.[usp_bridge_test_invoiceline_national_inner]

IF Object_id('bus.bridge_test_invoiceline_national_inner') iS NOT NULL DROP TABLE bus.bridge_test_invoiceline_national_inner 
 
SELECT l_customer_paceaccount.hk_l_customer_paceaccount AS hk_l_customer_paceaccount,
           l_customer_workorder.hk_l_customer_workorder AS hk_l_customer_workorder,
           l_project_workorder.hk_l_project_workorder AS hk_l_project_workorder,
           l_test_invoice.hk_l_test_invoice AS hk_l_test_invoice,
           l_test_product.hk_l_test_product AS hk_l_test_product,
           l_test_sample.hk_l_test_sample AS hk_l_test_sample,
           l_workorder_test.hk_l_workorder_test AS hk_l_workorder_test,
           h_customer.hk_h_customer AS hk_h_customer,
           h_invoice.hk_h_invoice AS hk_h_invoice,
           h_pace_account.hk_h_pace_account AS hk_h_pace_account,
           h_product.hk_h_product AS hk_h_product,
           h_project.hk_h_project AS hk_h_project,
           h_sample.hk_h_sample AS hk_h_sample,
           h_test.hk_h_test AS hk_h_test,
           h_work_order.hk_h_work_order AS hk_h_work_order,
           h_customer.account_no AS account_no,
           h_customer.account_no_bkcc AS account_no_bkcc,
           h_invoice.invoice_no_bkcc AS invoice_bkcc,
           h_invoice.invoice_no AS invoice_no,
           h_pace_account.pace_account_no AS pace_account_no,
           h_pace_account.pace_account_no_bkcc AS pace_account_no_bkcc,
           h_product.product_code AS product_code,
           h_product.product_code_bkcc AS product_code_bkcc,
           h_project.project_no AS project_no,
           h_project.project_no_bkcc AS project_no_bkcc,
           h_sample.sample_no AS sample_no,
           h_sample.sample_no_bkcc AS sample_no_bkcc,
           h_test.tenant_id AS tenant_id,
           h_test.test_no AS test_no,
           h_test.test_no_bkcc AS test_no_bkcc,
           h_work_order.work_order_no AS work_order_no,
           h_work_order.work_order_no_bkcc AS work_order_no_bkcc,
           CURRENT_TIMESTAMP AS dss_snapshot_date 
	INTO bus.bridge_test_invoiceline_national_inner
FROM raw.[h_invoice] (NOLOCK)
INNER JOIN raw.[l_test_invoice] (NOLOCK) l_test_invoice ON l_test_invoice.hk_h_invoice = h_invoice.hk_h_invoice
INNER JOIN raw.[h_test] (NOLOCK) h_test ON l_test_invoice.hk_h_test = h_test.hk_h_test
INNER JOIN raw.[l_test_sample] (NOLOCK) l_test_sample ON l_test_sample.hk_h_test = h_test.hk_h_test
INNER JOIN raw.[h_sample] (NOLOCK) h_sample ON l_test_sample.hk_h_sample = h_sample.hk_h_sample
INNER JOIN raw.[l_test_product] (NOLOCK) l_test_product ON l_test_product.hk_h_test = h_test.hk_h_test
INNER JOIN raw.[h_product] (NOLOCK) h_product ON l_test_product.hk_h_product = h_product.hk_h_product
INNER JOIN raw.[l_workorder_test] (NOLOCK) l_workorder_test ON l_workorder_test.hk_h_test = h_test.hk_h_test
INNER JOIN raw.[h_work_order] (NOLOCK) h_work_order ON l_workorder_test.hk_h_work_order = h_work_order.hk_h_work_order
INNER JOIN raw.[l_customer_workorder] (NOLOCK) l_customer_workorder ON l_customer_workorder.hk_h_work_order = h_work_order.hk_h_work_order
INNER JOIN raw.[h_customer] (NOLOCK) h_customer  ON h_customer.hk_h_customer = l_customer_workorder.hk_h_customer
INNER JOIN raw.[l_customer_paceaccount] (NOLOCK) l_customer_paceaccount ON l_customer_paceaccount.hk_h_customer = h_customer.hk_h_customer
INNER JOIN raw.[h_pace_account] (NOLOCK) h_pace_account ON l_customer_paceaccount.hk_h_pace_account = h_pace_account.hk_h_pace_account
INNER JOIN raw.[l_project_workorder] (NOLOCK) l_project_workorder ON l_project_workorder.hk_h_work_order = h_work_order.hk_h_work_order
INNER JOIN raw.[h_project] (NOLOCK) h_project ON l_project_workorder.hk_h_project = h_project.hk_h_project
--LEFT OUTER JOIN bus.[s_test_hroc_national_current] (NOLOCK) s_test_hroc_national ON s_test_hroc_national.hk_h_test = h_test.hk_h_test
--LEFT OUTER JOIN bus.[s_product_mroc_national_current] (NOLOCK) s_product_mroc_national ON s_product_mroc_national.hk_h_product = h_product.hk_h_product
WHERE h_invoice.tenant_id = 'lims80'
 
RETURN
GO
