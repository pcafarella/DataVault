/****** Object:  StoredProcedure [bus].[usp_bridge_controltower_national]    Script Date: 2/26/2024 11:24:52 AM ******/
DROP PROCEDURE [bus].[usp_bridge_controltower_national]
GO
/****** Object:  StoredProcedure [bus].[usp_bridge_controltower_national]    Script Date: 2/26/2024 11:24:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [bus].[usp_bridge_controltower_national] AS

-- exec bus.usp_bridge_controltower_national

--select * from bus.bridge_controltower_national WHERE test_no like 'L1606994%' ORDER BY SAMPLE_NO, product_code

 if object_id('bus.bridge_controltower_national') is not null DROP TABLE bus.bridge_controltower_national
SELECT   l_test_product.hk_l_test_product AS hk_l_test_product
		, l_test_sample.hk_l_test_sample AS hk_l_test_sample
		, h_product.hk_h_product AS hk_h_product
		, h_sample.hk_h_sample AS hk_h_sample
		, h_test.hk_h_test AS hk_h_test
		, h_product.product_code AS product_code
		, h_product.product_code_bkcc AS product_code_bkcc
		, h_sample.sample_no AS sample_no
		, h_sample.sample_no_bkcc AS sample_no_bkcc
		, h_test.tenant_id AS tenant_id
		, h_test.test_no AS test_no
		, h_test.test_no_bkcc AS test_no_bkcc
		, getdate() AS dss_snapshot_date
	INTO bus.[bridge_controltower_national]
	FROM  raw.[h_test]
	INNER JOIN raw.[l_test_product] l_test_product ON l_test_product.hk_h_test = h_test.hk_h_test
	INNER JOIN raw.[h_product] h_product  ON l_test_product.hk_h_product = h_product.hk_h_product
	INNER JOIN raw.[l_test_sample] l_test_sample ON l_test_sample.hk_h_test = h_test.hk_h_test
	INNER JOIN raw.[h_sample] h_sample  ON l_test_sample.hk_h_sample = h_sample.hk_h_sample


RETURN 


GO
