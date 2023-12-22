/****** Object:  View [bus].[s_test_hroc_national_history]    Script Date: 12/21/2023 12:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE                  VIEW [bus].[s_test_hroc_national_history] AS
 

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
s_test_hroc_national.dss_create_time, 
CASE WHEN COALESCE(r.key_value,rm.key_value) IS NOT NULL AND LEAD(dss_start_date) OVER(PARTITION BY h_test.hk_h_test  ORDER BY dss_start_date) IS NULL THEN dss_start_date ELSE
		 LEAD(dss_start_date, 1, '9999-12-31') OVER(PARTITION BY h_test.hk_h_test  ORDER BY dss_start_date) END dss_end_date, 
CASE WHEN LEAD(dss_start_date, 1, NULL) OVER(PARTITION BY s_test_hroc_national.hk_h_test ORDER BY dss_start_date) IS NOT NULL OR (COALESCE(r.key_value,rm.key_value) IS NOT NULL and COALESCE(ri.key_value, rim.key_value) IS NULL) THEN 'N' ELSE 'Y' END dss_current_flag
FROM WSDataVault_dev_incremental.raw.s_test_hroc_national s_test_hroc_national
JOIN raw.h_test on h_test.hk_h_test = s_test_hroc_national.hk_h_test
LEFT JOIN bus.r_record_tracking r on  r.key_value = LEFT(h_test.test_no, CHARINDEX('|', test_no)-1) 
					 AND r.old_value = 'OLD MATNUM:'+ 
					 CASE WHEN charindex('|',test_no_bkcc)=0  THEN SUBSTRING(test_no_bkcc,  1,  len(test_no_bkcc)) ELSE SUBSTRING(test_no_bkcc, 1,  charindex('|',test_no_bkcc)-1) END  
						+'**OLD PMATNUMREF:'+
					 CASE WHEN charindex('|',test_no_bkcc, charindex('|',test_no_bkcc))= 0 THEN ''  ELSE  SUBSTRING(test_no_bkcc,  charindex('|',test_no_bkcc)+1,  len(test_no_bkcc)-charindex('|',test_no_bkcc)+1) END  
					 AND r.new_value = 'OLD PROD:' + 	
					 CASE WHEN charindex('|',test_no, charindex('|',test_no)+1)=0  THEN SUBSTRING(test_no,  CHARINDEX('|', test_no)+1, len(test_no) - CHARINDEX('|', test_no)+1) ELSE SUBSTRING(test_no,  CHARINDEX('|', test_no)+1, charindex('|',test_no, charindex('|',test_no)+ 1)- CHARINDEX('|', test_no)-1) END 
					    +'**OLD PPRODREF:'+
					CASE WHEN charindex('|',test_no, charindex('|',test_no)+1)= 0 THEN ''  ELSE  SUBSTRING(test_no,  charindex('|',test_no, charindex('|',test_no)+1)+1, len(test_no)-charindex('|',test_no, charindex('|',test_no)+1)+1) END
					 AND r.audit_table = 'ORDERMAST'  AND r.audit_action = 'DELETE' 

LEFT JOIN bus.r_record_tracking rm on  rm.key_value =  LEFT(h_test.test_no, CHARINDEX('|', test_no)-1) 
					 AND rm.old_value = 'OLD MATNUM:'+ 
					  CASE WHEN charindex('|',test_no_bkcc, charindex('|',test_no_bkcc))= 0 THEN ''  ELSE  SUBSTRING(test_no_bkcc,  charindex('|',test_no_bkcc)+1,  len(test_no_bkcc)-charindex('|',test_no_bkcc)+1) END  
						+'**OLD PMATNUMREF:' 
					 AND rm.new_value = 'OLD PROD:' + 	
					CASE WHEN charindex('|',test_no, charindex('|',test_no)+1)= 0 THEN ''  ELSE  SUBSTRING(test_no,  charindex('|',test_no, charindex('|',test_no)+1)+1, len(test_no)-charindex('|',test_no, charindex('|',test_no)+1)+1) END
					    +'**OLD PPRODREF:' 
					 AND rm.audit_table = 'ORDERMAST'  AND rm.audit_action = 'DELETE' 

LEFT JOIN bus.r_record_tracking ri on  ri.key_value = LEFT(h_test.test_no, CHARINDEX('|', test_no)-1) 
					 AND ri.old_value = 'NEW MATNUM:'+ 
					 CASE WHEN charindex('|',test_no_bkcc)=0  THEN SUBSTRING(test_no_bkcc,  1,  len(test_no_bkcc)) ELSE SUBSTRING(test_no_bkcc, 1,  charindex('|',test_no_bkcc)-1) END  
						+'**NEW PMATNUMREF:'+
					 CASE WHEN charindex('|',test_no_bkcc, charindex('|',test_no_bkcc))= 0 THEN ''  ELSE  SUBSTRING(test_no_bkcc,  charindex('|',test_no_bkcc)+1,  len(test_no_bkcc)-charindex('|',test_no_bkcc)+1) END  
					 AND ri.new_value = 'NEW PROD:' + 	
					 CASE WHEN charindex('|',test_no, charindex('|',test_no)+1)=0  THEN SUBSTRING(test_no,  CHARINDEX('|', test_no)+1, len(test_no) - CHARINDEX('|', test_no)+1) ELSE SUBSTRING(test_no,  CHARINDEX('|', test_no)+1, charindex('|',test_no, charindex('|',test_no)+ 1)- CHARINDEX('|', test_no)-1) END 
					    +'**NEW PPRODREF:'+
					CASE WHEN charindex('|',test_no, charindex('|',test_no)+1)= 0 THEN ''  ELSE  SUBSTRING(test_no,  charindex('|',test_no, charindex('|',test_no)+1)+1, len(test_no)-charindex('|',test_no, charindex('|',test_no)+1)+1) END
					 AND ri.audit_table = 'ORDERMAST'  AND ri.audit_action = 'INSERT' 

LEFT JOIN bus.r_record_tracking rim on  rim.key_value =  LEFT(h_test.test_no, CHARINDEX('|', test_no)-1) 
					 AND rim.old_value = 'NEW MATNUM:'+ 
					  CASE WHEN charindex('|',test_no_bkcc, charindex('|',test_no_bkcc))= 0 THEN ''  ELSE  SUBSTRING(test_no_bkcc,  charindex('|',test_no_bkcc)+1,  len(test_no_bkcc)-charindex('|',test_no_bkcc)+1) END  
						+'**NEW PMATNUMREF:' 
					 AND rim.new_value = 'OLD PROD:' + 	
					CASE WHEN charindex('|',test_no, charindex('|',test_no)+1)= 0 THEN ''  ELSE  SUBSTRING(test_no,  charindex('|',test_no, charindex('|',test_no)+1)+1, len(test_no)-charindex('|',test_no, charindex('|',test_no)+1)+1) END
					    +'**NEW PPRODREF:' 
					 AND rim.audit_table = 'ORDERMAST'  AND rm.audit_action = 'INSERT' 
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'The changing hash' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Record source' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was loaded in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row started in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Version number of a business key in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'Date and time the row was inserted in the data vault' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'End date determined by the next Satellite change record dss_start_date' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_end_date'
GO
EXEC sys.sp_addextendedproperty @name=N'Comment', @value=N'CurrentFlag ''N'' unless next Satellite change record dss_start_date is null, indicating this is the most current record.' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_history', @level2type=N'COLUMN',@level2name=N'dss_current_flag'
GO
