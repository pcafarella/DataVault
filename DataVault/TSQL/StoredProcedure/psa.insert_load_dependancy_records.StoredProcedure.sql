/****** Object:  StoredProcedure [psa].[insert_load_dependancy_records]    Script Date: 2/26/2024 11:24:52 AM ******/
DROP PROCEDURE [psa].[insert_load_dependancy_records]
GO
/****** Object:  StoredProcedure [psa].[insert_load_dependancy_records]    Script Date: 2/26/2024 11:24:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE       PROC [psa].[insert_load_dependancy_records]

AS

-- exec [psa].[insert_load_dependancy_records]


INSERT load.load_ordertrack_national
SELECT * FROM psa.load_ordertrack_national_v psa
WHERE NOT EXISTS (SELECT 1 FROM load.load_ordertrack_national i WHERE i.samplenum = psa.samplenum and i.prod = psa.prod and i.matnum = psa.matnum )
AND EXISTS (SELECT 1 FROM load.load_ordermast_national i WHERE i.samplenum = psa.samplenum and i.prod = psa.prod and i.matnum = psa.matnum)
           

INSERT load.load_orderdetail_national
SELECT * FROM psa.load_orderdetail_national_v psa
WHERE NOT EXISTS (SELECT 1 FROM load.load_orderdetail_national i WHERE i.samplenum = psa.samplenum and i.prod = psa.prod and i.matnum = psa.matnum )
AND EXISTS (SELECT 1 FROM load.load_ordermast_national i WHERE i.samplenum = psa.samplenum and i.prod = psa.prod and i.matnum = psa.matnum)
           
INSERT load.load_ordermast_national
SELECT * FROM psa.load_ordermast_national_v psa
WHERE NOT EXISTS (SELECT 1 FROM load.load_ordermast_national i WHERE i.samplenum = psa.samplenum and i.prod = psa.prod and i.matnum = psa.matnum )
AND EXISTS (SELECT 1 FROM load.load_orderdetail_national i WHERE i.samplenum = psa.samplenum and i.prod = psa.prod and i.matnum = psa.matnum
            UNION ALL
			SELECT 1 FROM load.load_ordertrack_national i WHERE i.samplenum = psa.samplenum and i.prod = psa.prod and i.matnum = psa.matnum 
			UNION ALL
			SELECT 1 FROM load.load_lims_audit_national i   WHERE i.key_value = psa.samplenum  AND audit_action = 'UPDATE')
		
INSERT load.load_sample_national
SELECT * FROM psa.load_sample_national_v psa
WHERE NOT EXISTS (SELECT 1 FROM load.load_sample_national i WHERE i.samplenum = psa.samplenum )
AND EXISTS (SELECT 1 FROM load.load_sampheader_national i WHERE i.samplenum = psa.samplenum 
			UNION ALL
			SELECT 1 FROM load.load_lims_audit_national i WHERE i.key_value  = psa.samplenum AND audit_action = 'UPDATE')

INSERT load.load_rundef_national  
SELECT * FROM psa.load_rundef_national_v psa
WHERE  NOT EXISTS (SELECT 1 FROM load.load_rundef_national i WHERE i.run_id = psa.run_id )
AND EXISTS (SELECT 1 FROM load.load_sampheader_national i WHERE i.run_id = psa.run_id )

INSERT load.load_listheader_national  
SELECT * FROM psa.load_listheader_national_v psa
WHERE NOT EXISTS (SELECT 1 FROM load.load_listheader_national i WHERE i.list_joinid = psa.list_joinid )
AND EXISTS (SELECT 1 FROM load.load_sampheader_national i WHERE i.list_joinid = psa.list_joinid )

INSERT load.load_invoicedef_national
SELECT * FROM psa.load_invoicedef_national_v psa
WHERE NOT EXISTS (SELECT 1 FROM load.load_invoicedef_national i WHERE i.invoicenum = psa.invoicenum )
AND EXISTS (SELECT 1 FROM load.load_sample_national i WHERE i.invoicenum = psa.invoicenum)


 RETURN
GO
