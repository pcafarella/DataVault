/****** Object:  StoredProcedure [raw].[usp_TruncateRawVault]    Script Date: 2/26/2024 11:24:52 AM ******/
DROP PROCEDURE [raw].[usp_TruncateRawVault]
GO
/****** Object:  StoredProcedure [raw].[usp_TruncateRawVault]    Script Date: 2/26/2024 11:24:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec raw.usp_TruncateRawVault
CREATE Proc [raw].[usp_TruncateRawVault] AS
TRUNCATE TABLE raw.h_customer
TRUNCATE TABLE raw.h_invoice
TRUNCATE TABLE raw.h_invoiceline
TRUNCATE TABLE raw.h_pace_account
TRUNCATE TABLE raw.h_product
TRUNCATE TABLE raw.h_project
TRUNCATE TABLE raw.h_sample
TRUNCATE TABLE raw.h_test
TRUNCATE TABLE raw.h_work_order
TRUNCATE TABLE raw.l_ancillary_invoiceitem
TRUNCATE TABLE raw.l_customer_paceaccount
TRUNCATE TABLE raw.l_customer_project
TRUNCATE TABLE raw.l_customer_workorder
TRUNCATE TABLE raw.l_invoice_invoiceline
TRUNCATE TABLE raw.l_paceaccount_customer_invoice
TRUNCATE TABLE raw.l_paceaccount_invoice
TRUNCATE TABLE raw.l_product_parent
TRUNCATE TABLE raw.l_project_workorder
TRUNCATE TABLE raw.l_test_invoice
TRUNCATE TABLE raw.l_test_invoice_credit
TRUNCATE TABLE raw.l_test_invoiceline
TRUNCATE TABLE raw.l_test_product
TRUNCATE TABLE raw.l_test_sample
TRUNCATE TABLE raw.l_workorder_test
TRUNCATE TABLE raw.s_ancillary_invoiceitem_tran_bakersfield
TRUNCATE TABLE raw.s_ancillary_invoiceitem_tran_eastlongmeadow
TRUNCATE TABLE raw.s_ancillary_invoiceitem_tran_madisonville
TRUNCATE TABLE raw.s_ancillary_invoiceitem_tran_peoria
TRUNCATE TABLE raw.s_ancillary_invoiceitem_tran_redding
TRUNCATE TABLE raw.s_customer_mroc_bakersfield
TRUNCATE TABLE raw.s_customer_mroc_eastlongmeadow
TRUNCATE TABLE raw.s_customer_mroc_madisonville
TRUNCATE TABLE raw.s_customer_mroc_national
TRUNCATE TABLE raw.s_customer_mroc_paceport
TRUNCATE TABLE raw.s_customer_mroc_peoria
TRUNCATE TABLE raw.s_customer_mroc_redding
TRUNCATE TABLE raw.s_invoice_mroc_bakersfield
TRUNCATE TABLE raw.s_invoice_mroc_eastlongmeadow
TRUNCATE TABLE raw.s_invoice_mroc_madisonville
TRUNCATE TABLE raw.s_invoice_mroc_national
TRUNCATE TABLE raw.s_invoice_mroc_paceport
TRUNCATE TABLE raw.s_invoice_mroc_peoria
TRUNCATE TABLE raw.s_invoice_mroc_redding
TRUNCATE TABLE raw.s_invoiceline_mroc
TRUNCATE TABLE raw.s_product_mroc_bakersfield
TRUNCATE TABLE raw.s_product_mroc_eastlongmeadow
TRUNCATE TABLE raw.s_product_mroc_madisonville
TRUNCATE TABLE raw.s_product_mroc_national
TRUNCATE TABLE raw.s_product_mroc_paceport
TRUNCATE TABLE raw.s_product_mroc_peoria
TRUNCATE TABLE raw.s_product_mroc_redding
TRUNCATE TABLE raw.s_product_parent_tran_bakersfield
TRUNCATE TABLE raw.s_product_parent_tran_eastlongmeadow
TRUNCATE TABLE raw.s_product_parent_tran_madisonville
TRUNCATE TABLE raw.s_product_parent_tran_peoria
TRUNCATE TABLE raw.s_product_parent_tran_redding
TRUNCATE TABLE raw.s_project_mroc_bakersfield
TRUNCATE TABLE raw.s_project_mroc_eastlongmeadow
TRUNCATE TABLE raw.s_project_mroc_madisonville
TRUNCATE TABLE raw.s_project_mroc_national
TRUNCATE TABLE raw.s_project_mroc_paceport
TRUNCATE TABLE raw.s_project_mroc_peoria
TRUNCATE TABLE raw.s_project_mroc_redding
TRUNCATE TABLE raw.s_sample_mroc_bakersfield
TRUNCATE TABLE raw.s_sample_mroc_eastlongmeadow
TRUNCATE TABLE raw.s_sample_mroc_madisonville
TRUNCATE TABLE raw.s_sample_mroc_national
TRUNCATE TABLE raw.s_sample_mroc_paceport
TRUNCATE TABLE raw.s_sample_mroc_peoria
TRUNCATE TABLE raw.s_sample_mroc_redding
TRUNCATE TABLE raw.s_test_hroc_bakersfield
TRUNCATE TABLE raw.s_test_hroc_eastlongmeadow
TRUNCATE TABLE raw.s_test_hroc_madisonville
TRUNCATE TABLE raw.s_test_hroc_national
TRUNCATE TABLE raw.s_test_hroc_paceport
TRUNCATE TABLE raw.s_test_hroc_peoria
TRUNCATE TABLE raw.s_test_hroc_redding
TRUNCATE TABLE raw.s_test_invoice_credit_tran_bakersfield
TRUNCATE TABLE raw.s_test_invoice_credit_tran_eastlongmeadow
TRUNCATE TABLE raw.s_test_invoice_credit_tran_madisonville
TRUNCATE TABLE raw.s_test_invoice_credit_tran_peoria
TRUNCATE TABLE raw.s_test_invoice_credit_tran_redding
TRUNCATE TABLE raw.s_work_order_mroc_bakersfield
TRUNCATE TABLE raw.s_work_order_mroc_eastlongmeadow
TRUNCATE TABLE raw.s_work_order_mroc_madisonville
TRUNCATE TABLE raw.s_work_order_mroc_national
TRUNCATE TABLE raw.s_work_order_mroc_paceport
TRUNCATE TABLE raw.s_work_order_mroc_peoria
TRUNCATE TABLE raw.s_work_order_mroc_redding

TRUNCATE TABLE ref.r_dmart_aux_data
TRUNCATE TABLE ref.r_dmart_auxiliary_data
TRUNCATE TABLE ref.r_dmart_choice_lists
TRUNCATE TABLE ref.r_seedpak_matrixdef
 


RETURN
GO
