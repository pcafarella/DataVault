/****** Object:  StoredProcedure [raw].[usp_ghostrecords_hubandlink]    Script Date: 2/26/2024 11:24:52 AM ******/
DROP PROCEDURE [raw].[usp_ghostrecords_hubandlink]
GO
/****** Object:  StoredProcedure [raw].[usp_ghostrecords_hubandlink]    Script Date: 2/26/2024 11:24:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE       PROCEDURE  [raw].[usp_ghostrecords_hubandlink] 
AS 

-- exec raw.usp_ghostrecords_hubandlink

INSERT  Raw.h_customer SELECT REPLICATE(0,64),'N/A','N/A','pace','default ghost record insert','2022-07-28 10:37:14.230','2022-07-28 10:37:14.230' WHERE NOT EXISTS (SELECT 1 FROM Raw.h_customer  WHERE hk_h_customer = REPLICATE(0,64))
INSERT  Raw.h_invoice SELECT REPLICATE(0,64),'N/A','N/A','pace','default ghost record insert','2022-07-28 10:37:14.230','2022-07-28 10:37:14.230' WHERE NOT EXISTS (SELECT 1 FROM Raw.h_invoice  WHERE hk_h_invoice = REPLICATE(0,64))
INSERT  Raw.h_invoiceline SELECT REPLICATE(0,64),'N/A','N/A','pace','default ghost record insert','2022-07-28 10:37:14.230','2022-07-28 10:37:14.230' WHERE NOT EXISTS (SELECT 1 FROM Raw.h_invoiceline  WHERE hk_h_invoiceline = REPLICATE(0,64))
INSERT  Raw.h_pace_account SELECT REPLICATE(0,64),'N/A','N/A','pace','default ghost record insert','2022-07-28 10:37:14.230','2022-07-28 10:37:14.230' WHERE NOT EXISTS (SELECT 1 FROM Raw.h_pace_account  WHERE hk_h_pace_account = REPLICATE(0,64))
INSERT  Raw.h_product SELECT REPLICATE(0,64),'N/A','N/A','pace','default ghost record insert','2022-07-28 10:37:14.230','2022-07-28 10:37:14.230' WHERE NOT EXISTS (SELECT 1 FROM Raw.h_product  WHERE hk_h_product = REPLICATE(0,64))
INSERT  Raw.h_project SELECT REPLICATE(0,64),'N/A','N/A','pace','default ghost record insert','2022-07-28 10:37:14.230','2022-07-28 10:37:14.230' WHERE NOT EXISTS (SELECT 1 FROM Raw.h_project  WHERE hk_h_project = REPLICATE(0,64))
INSERT  Raw.h_sample SELECT REPLICATE(0,64),'N/A','N/A','pace','default ghost record insert','2022-07-28 10:37:14.230','2022-07-28 10:37:14.230' WHERE NOT EXISTS (SELECT 1 FROM Raw.h_sample  WHERE hk_h_sample = REPLICATE(0,64))
INSERT  Raw.h_test SELECT REPLICATE(0,64),'N/A','N/A','pace','default ghost record insert','2022-07-28 10:37:14.230','2022-07-28 10:37:14.230' WHERE NOT EXISTS (SELECT 1 FROM Raw.h_test  WHERE hk_h_test = REPLICATE(0,64))
INSERT  Raw.h_work_order SELECT REPLICATE(0,64),'N/A','N/A','pace','default ghost record insert','2022-07-28 10:37:14.230','2022-07-28 10:37:14.230' WHERE NOT EXISTS (SELECT 1 FROM Raw.h_work_order  WHERE hk_h_work_order = REPLICATE(0,64))

INSERT  Raw.l_customer_paceaccount SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_customer_paceaccount  WHERE hk_l_customer_paceaccount = REPLICATE(0,64))
INSERT  Raw.l_customer_project SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_customer_project  WHERE hk_l_customer_project = REPLICATE(0,64))
INSERT  Raw.l_customer_workorder SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_customer_workorder  WHERE hk_l_customer_workorder = REPLICATE(0,64))
INSERT  Raw.l_invoice_invoiceline SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_invoice_invoiceline  WHERE hk_l_invoice_invoiceline = REPLICATE(0,64))
INSERT  Raw.l_paceaccount_invoice SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_paceaccount_invoice  WHERE hk_l_paceaccount_invoice = REPLICATE(0,64))
INSERT  Raw.l_product_parent SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_product_parent  WHERE hk_l_product_parent = REPLICATE(0,64))
INSERT  Raw.l_project_workorder SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_project_workorder  WHERE hk_l_project_workorder = REPLICATE(0,64))
INSERT  Raw.l_test_invoice SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_test_invoice  WHERE hk_l_test_invoice = REPLICATE(0,64))
INSERT  Raw.l_test_invoiceline SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_test_invoiceline  WHERE hk_l_test_invoiceline = REPLICATE(0,64))
INSERT  Raw.l_test_product SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_test_product  WHERE hk_l_test_product = REPLICATE(0,64))
INSERT  Raw.l_test_sample SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_test_sample  WHERE hk_l_test_sample = REPLICATE(0,64))
INSERT  Raw.l_workorder_test SELECT REPLICATE(0,64), REPLICATE(0,64),REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_workorder_test  WHERE hk_l_workorder_test = REPLICATE(0,64))

-- 3 hubs
INSERT  Raw.l_paceaccount_customer_invoice SELECT REPLICATE(0,64), REPLICATE(0,64), REPLICATE(0,64), REPLICATE(0,64),'default ghost record insert','2022-07-28 10:45:30.340','2022-07-28 10:45:30.340' WHERE NOT EXISTS (SELECT 1 FROM Raw.l_paceaccount_customer_invoice  WHERE hk_l_paceaccount_customer_invoice = REPLICATE(0,64))

RETURN
GO
