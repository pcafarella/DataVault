/****** Object:  View [bus].[s_test_hroc_national_current]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









 
if object_id('bus.s_test_hroc_national_current') IS NOT NULL
     DROP VIEW bus.s_test_hroc_national_current
GO

CREATE                                  VIEW [bus].[s_test_hroc_national_current]

-- select * from [bus].[s_test_hroc_national_current] s join raw.h_test on h_test.hk_h_test = s.hk_h_test WHERE h_test.test_no like   'L1670312-01|%'
-- select * from [raw].[s_test_hroc_national] s join raw.h_test on h_test.hk_h_test = s.hk_h_test WHERE h_test.test_no like   'L1670312-01|%'
-- select * from ref.r_record_tracking where key_value = 'L1661969-01'

AS
WITH ref_tracking AS (
SELECT * 
FROM (
SELECT	 -- audit_table, audit_action action1 ,charindex(':',new_value) comm, charindex('*',new_value) astr, new_value,
         key_value, 
		 SUBSTRING(new_value, charindex(':',new_value)+1 ,CASE WHEN charindex('*',new_value)=0 THEN 9999 ELSE  charindex('*',new_value) END -  charindex(':',new_value)-1 ) product_code_base, 
		 SUBSTRING(old_value, charindex(':',old_value)+1 ,CASE WHEN charindex('*',old_value)=0 THEN 9999 ELSE  charindex('*',old_value) END -  charindex(':',old_value)-1 ) matnum_base, 
		 CASE WHEN charindex('*',new_value)=0 THEN '' ELSE    SUBSTRING(new_value, charindex('PRODREF:',new_value)+8 ,len(new_value) -   charindex('PRODREF:',new_value)-1 ) END parent ,	
		 audit_date, audit_action
FROM ref.r_record_tracking
WHERE audit_table = 'ORDERMAST' AND audit_action IN ('DELETE','INSERT')) t
PIVOT(MAX(audit_date)
FOR audit_action IN ([DELETE], [INSERT]) )
AS pvt  )
 
SELECT 
s_test_hroc_national.hk_h_test, 
s_test_hroc_national.price, 
s_test_hroc_national.surcharge, 
s_test_hroc_national.pkey, 
s_test_hroc_national.plevel, 
s_test_hroc_national.pprodref, 
s_test_hroc_national.pmatnumref, 
s_test_hroc_national.class, 
s_test_hroc_national.cost, 
s_test_hroc_national.holddate, 
s_test_hroc_national.holddays, 
s_test_hroc_national.holdflg, 
s_test_hroc_national.duedate, 
s_test_hroc_national.duedays, 
s_test_hroc_national.location, 
s_test_hroc_national.bottles, 
s_test_hroc_national.lastdate, 
s_test_hroc_national.lasttool, 
s_test_hroc_national.lastuser, 
s_test_hroc_national.designid, 
s_test_hroc_national.comp, 
s_test_hroc_national.dss_change_hash, 
s_test_hroc_national.dss_record_source, 
s_test_hroc_national.dss_load_date, 
s_test_hroc_national.dss_start_date, 
s_test_hroc_national.dss_version, 
s_test_hroc_national.dss_create_time 
 FROM WSDataVault_dev_incremental.raw.s_test_hroc_national s_test_hroc_national
INNER JOIN (SELECT hk_h_test,  MAX(dss_start_date) AS dss_start_date
			 FROM WSDataVault_dev_incremental.raw.s_test_hroc_national
			GROUP BY hk_h_test) curr ON curr.hk_h_test = s_test_hroc_national.hk_h_test
										AND curr.dss_start_date = s_test_hroc_national.dss_start_date
 INNER JOIN raw.h_test on h_test.hk_h_test = s_test_hroc_national.hk_h_test
INNER JOIN raw.l_test_product tp on tp.hk_h_test = h_test.hk_h_test
INNER JOIN raw.h_product p ON p.hk_h_product = tp.hk_h_product
LEFT JOIN ref_tracking r on r.key_value = LEFT(h_test.test_no, CHARINDEX('|', test_no)-1) 
							and r.product_code_base = CASE WHEN CHARINDEX('|', p.product_code) = 0 THEN p.product_code ELSE LEFT(p.product_code,  CHARINDEX('|', p.product_code)-1) END 
	                        and r.matnum_base = CASE WHEN CHARINDEX('|', p.product_code_bkcc) = 0 THEN p.product_code_bkcc ELSE LEFT(p.product_code_bkcc,  CHARINDEX('|', p.product_code_bkcc)-1) END             
					        and r.parent = CASE WHEN CHARINDEX('|', product_code) = 0 THEN '' ELSE SUBSTRING(product_code,  CHARINDEX('|', product_code)+1, LEN(product_code)) END 
WHERE NOT EXISTS (SELECT DISTINCT 1 FROM ref.r_record_tracking 
                    where key_value = LEFT(h_test.test_no, CHARINDEX('|', test_no)-1) 
					 AND old_value = 'OLD MATNUM:'+ 
					 CASE WHEN charindex('|',test_no_bkcc)=0  THEN SUBSTRING(test_no_bkcc,  1,  len(test_no_bkcc)) ELSE SUBSTRING(test_no_bkcc, 1,  charindex('|',test_no_bkcc)-1) END  
						+'**OLD PMATNUMREF:'+
					 CASE WHEN charindex('|',test_no_bkcc, charindex('|',test_no_bkcc))= 0 THEN ''  ELSE  SUBSTRING(test_no_bkcc,  charindex('|',test_no_bkcc)+1,  len(test_no_bkcc)-charindex('|',test_no_bkcc)+1) END  
					 AND new_value = 'OLD PROD:' + 	
					 CASE WHEN charindex('|',test_no, charindex('|',test_no)+1)=0  THEN SUBSTRING(test_no,  CHARINDEX('|', test_no)+1, len(test_no) - CHARINDEX('|', test_no)+1) ELSE SUBSTRING(test_no,  CHARINDEX('|', test_no)+1, charindex('|',test_no, charindex('|',test_no)+ 1)- CHARINDEX('|', test_no)-1) END 
					    +'**OLD PPRODREF:'+
					CASE WHEN charindex('|',test_no, charindex('|',test_no)+1)= 0 THEN ''  ELSE  SUBSTRING(test_no,  charindex('|',test_no, charindex('|',test_no)+1)+1, len(test_no)-charindex('|',test_no, charindex('|',test_no)+1)+1) END
					 AND audit_table = 'ORDERMAST'  AND audit_action = 'DELETE'  
					 AND audit_date = r.[DELETE] AND r.[DELETE] >COALESCE(r.[INSERT],'1900-01-01')  
					 UNION ALL
                    SELECT 1 FROM ref.r_record_tracking 
                   WHERE key_value = LEFT(h_test.test_no, CHARINDEX('|', test_no)-1) 
					 AND old_value = 'OLD MATNUM:'+ 
					  CASE WHEN charindex('|',test_no_bkcc, charindex('|',test_no_bkcc))= 0 THEN ''  ELSE  SUBSTRING(test_no_bkcc,  charindex('|',test_no_bkcc)+1,  len(test_no_bkcc)-charindex('|',test_no_bkcc)+1) END  
						+'**OLD PMATNUMREF:' 
					 AND new_value = 'OLD PROD:' + 	
					CASE WHEN charindex('|',test_no, charindex('|',test_no)+1)= 0 THEN ''  ELSE  SUBSTRING(test_no,  charindex('|',test_no, charindex('|',test_no)+1)+1, len(test_no)-charindex('|',test_no, charindex('|',test_no)+1)+1) END
					    +'**OLD PPRODREF:' 
					 AND audit_table = 'ORDERMAST'  AND audit_action = 'DELETE'  
					 AND audit_date = r.[DELETE] AND r.[DELETE] > COALESCE(r.[INSERT],'1900-01-01')  )
AND NOT EXISTS (SELECT 1 FROM ref.r_record_tracking i
				where i.key_value = LEFT(h_test.test_no, CHARINDEX('|', h_test.test_no)-1) 
				AND i.new_value like 'OLD PROD:'+pprodref+'%'
			    AND i.audit_date > r.[DELETE])

GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
