/****** Object:  StoredProcedure [load].[usp_get_lastdates_national]    Script Date: 2/5/2024 11:13:14 AM ******/
DROP PROCEDURE [load].[usp_get_lastdates_national]
GO
/****** Object:  StoredProcedure [load].[usp_get_lastdates_national]    Script Date: 2/5/2024 11:13:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROCEDURE [load].[usp_get_lastdates_national] AS

--exec [load].[usp_get_lastdates_national] 


DECLARE @RC int
DECLARE @lastdate datetime

-- TODO: Set parameter values here.

EXECUTE @RC = [Load].[usp_getlastdate_ordermast_national] 
   @lastdate OUTPUT
EXECUTE @RC = [Load].[usp_getlastdate_orderdetail_national] 
   @lastdate OUTPUT
EXECUTE @RC = [Load].[usp_getlastdate_ordertrack_national] 
   @lastdate OUTPUT
EXECUTE @RC = [Load].[usp_getlastdate_audit_national] 
   @lastdate OUTPUT
EXECUTE @RC = [Load].[usp_getlastdate_invoicedef_national] 
   @lastdate OUTPUT
 EXECUTE @RC = [Load].[usp_getlastdate_clients_national] 
   @lastdate OUTPUT
 EXECUTE @RC = [Load].[usp_getlastdate_projectdef_national] 
   @lastdate OUTPUT
 EXECUTE @RC = [Load].[usp_getlastdate_sample_national] 
   @lastdate OUTPUT
 EXECUTE @RC = [Load].[usp_getlastdate_sampheader_national] 
   @lastdate OUTPUT
 EXECUTE @RC = [Load].[usp_getlastdate_rundef_national] 
   @lastdate OUTPUT
 

TRUNCATE TABLE ref.r_seedpak_esc_report_prod_groupings
TRUNCATE TABLE ref.r_seedpak_mm_prodmatlist
TRUNCATE TABLE ref.r_seedpak_mm_header
TRUNCATE TABLE ref.r_seedpak_prep_data
TRUNCATE TABLE ref.r_seedpak_matrixdef
TRUNCATE TABLE ref.r_seedpak_methods
TRUNCATE TABLE ref.r_seedpak_trans
TRUNCATE TABLE ref.r_seedpak_auxiliary_lab_lookup
TRUNCATE TABLE raw.l_analysis_process_product
GO
