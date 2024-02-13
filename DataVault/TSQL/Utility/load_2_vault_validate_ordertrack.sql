 -- ordertrack load table lastdate is yesterday
SELECT  o.samplenum,  o.prod,   o.matnum, deptnum, worknum, dstatus 
into #TEMP1
FROM load.load_ordertrack_national o
INNER JOIN psa.load_sample_national_v s on s.samplenum = o.samplenum and s.receivedate >=  '2023-09-17'
INNER JOIN psa.load_ordermast_national_v t on t.samplenum = o.samplenum and t.prod = o.prod and t.matnum = o.matnum
WHERE CAST(o.lastdate AS DATE) = CAST(getdate()-1  AS DATE) and o.matnum !=11

--EXCEPT
 
SELECT  LEFT(test_no,  CHARINDEX('|', test_no)-1) sample_no
       ,SUBSTRING(test_no,  CHARINDEX('|', test_no)+1,  
		    CASE WHEN CHARINDEX('|', test_no, CHARINDEX('|', test_no)+1 ) != 0 
				 THEN CHARINDEX('|', test_no, CHARINDEX('|', test_no)+1 ) - CHARINDEX('|', test_no) -1
				 ELSE LEN(test_no) -   CHARINDEX('|', test_no) 
			 END) product_code_base
      ,SUBSTRING(test_no_bkcc, 1,  
			CASE WHEN CHARINDEX('|', test_no_bkcc) = 0 THEN  len(test_no_bkcc)  
			     ELSE CHARINDEX('|', test_no_bkcc) -1 
			END) matnum_base
	  ,department_no  
	  ,s.process_status_batch_no
	  ,process_status_code
	  INTO #TEMP2
FROM raw.l_department_test_status ts 
INNER JOIN bus.s_department_test_status_tran_national_current s on s.hk_l_department_test_status = ts.hk_l_department_test_status
INNER JOIN raw.h_test on h_test.hk_h_test = ts.hk_h_test
INNER JOIN raw.h_department on h_department.hk_h_department = ts.hk_h_department
WHERE LEFT(test_no_bkcc,2) !='11'
AND process_status_date > CAST(getdate()-1  AS DATE) 
ORDER BY 1,2,3,4,5

SELECT * FROM #TEMP1
EXCEPT
SELECT * FROM #TEMP2