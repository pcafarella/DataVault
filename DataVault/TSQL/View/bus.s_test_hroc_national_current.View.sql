EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_create_time'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_version'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_start_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_load_date'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_record_source'
GO
EXEC sys.sp_dropextendedproperty @name=N'Comment' , @level0type=N'SCHEMA',@level0name=N'bus', @level1type=N'VIEW',@level1name=N's_test_hroc_national_current', @level2type=N'COLUMN',@level2name=N'dss_change_hash'
GO
/****** Object:  View [bus].[s_test_hroc_national_current]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [bus].[s_test_hroc_national_current]
GO
/****** Object:  View [bus].[s_test_hroc_national_current]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE                                  VIEW [bus].[s_test_hroc_national_current]

-- select * from [bus].[s_test_hroc_national_current] s join raw.h_test on h_test.hk_h_test = s.hk_h_test WHERE h_test.test_no like   'L1698865-14%'
-- select * from [bus].[s_test_hroc_national_history] s join raw.h_test on h_test.hk_h_test = s.hk_h_test WHERE h_test.test_no like    'L1698865-14%'
-- select * from [raw].[s_test_hroc_national] s join raw.h_test on h_test.hk_h_test = s.hk_h_test WHERE h_test.test_no like    'L1698865-14%'
-- select * from ref.r_record_tracking where key_value = 'L1661969-01'

AS

WITH ref_tracking AS (
SELECT * 
FROM (
SELECT	 key_value, audit_table, audit_action  ,charindex(':',new_value) comm, charindex('*',new_value) astr, new_value, old_value,
		 SUBSTRING(new_value, charindex(':',new_value)+1 ,CASE WHEN charindex('*',new_value)=0 THEN 9999 ELSE  charindex('*',new_value) END -  charindex(':',new_value)-1 ) product_code_base, 
		 SUBSTRING(old_value, charindex(':',old_value)+1 ,CASE WHEN charindex('*',old_value)=0 THEN 9999 ELSE  charindex('*',old_value) END -  charindex(':',old_value)-1 ) matnum_base, 
		 audit_date, audit_action audit_action1,   audit_table  audit_table1,  audit_date  audit_date1
FROM ref.r_record_tracking
WHERE audit_table = 'ORDERMAST' AND audit_action IN ('DELETE','INSERT') ) t
PIVOT(MAX(audit_date)
FOR audit_action IN ([DELETE], [INSERT]) )AS pvt)
 
  --select * from ref_tracking where key_value like 'L1698865-14%'
 SELECT test_no, test_no_bkcc,
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
 WHERE ISNULL((SELECT max(audit_date1)  FROM ref_tracking i
               WHERE i.key_value = LEFT(h_test.test_no, CHARINDEX('|', test_no)-1) 
			 	 AND i.new_value LIKE 'OLD PROD:' + substring(test_no, charindex( '|',test_no)+1 , CASE WHEN  charindex( '|',test_no, charindex( '|',test_no ) +1)   - charindex( '|',test_no)+1 <= 0 THEN len(test_no) ELSE   charindex( '|',test_no, charindex( '|',test_no ) +1)   - charindex( '|',test_no)+1 -2 END) +'**%'  
				 AND i.old_value LIKE 'OLD MATNUM:' + substring(test_no_bkcc, 1,   CASE WHEN  charindex( '|',test_no_bkcc) <= 0 THEN len(test_no_bkcc) ELSE   charindex( '|',test_no_bkcc)-1 END) +'**%'    
			 	 AND i.audit_table1 = 'ORDERMAST'  AND i.audit_action1 = 'DELETE' 
				 AND i.audit_date1 = i.[DELETE]), '1900-01-01') 
    <= ISNULL((SELECT max(audit_date1)  FROM ref_tracking i
	           WHERE i.key_value = LEFT(h_test.test_no, CHARINDEX('|', test_no)-1) 
			  	 AND i.new_value LIKE 'NEW PROD:' + substring(test_no, charindex( '|',test_no)+1 , CASE WHEN  charindex( '|',test_no, charindex( '|',test_no ) +1)   - charindex( '|',test_no)+1 <= 0 THEN len(test_no) ELSE   charindex( '|',test_no, charindex( '|',test_no ) +1)   - charindex( '|',test_no)+1 -2 END) +'**%'  
				 AND i.old_value LIKE 'NEW MATNUM:' + substring(test_no_bkcc, 1,   CASE WHEN  charindex( '|',test_no_bkcc) <= 0 THEN len(test_no_bkcc) ELSE   charindex( '|',test_no_bkcc)-1 END) +'**%'    
				 AND i.audit_table1 = 'ORDERMAST'  AND i.audit_action1 = 'INSERT' 
				 AND i.audit_date1 = i.[INSERT]) ,'1900-01-01')
 --AND test_no like 'L1698865-14%'		

 
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
