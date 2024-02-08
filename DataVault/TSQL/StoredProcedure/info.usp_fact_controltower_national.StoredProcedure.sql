/****** Object:  StoredProcedure [info].[usp_fact_controltower_national]    Script Date: 2/8/2024 9:19:56 AM ******/
DROP PROCEDURE [info].[usp_fact_controltower_national]
GO
/****** Object:  StoredProcedure [info].[usp_fact_controltower_national]    Script Date: 2/8/2024 9:19:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [info].[usp_fact_controltower_national] @work_order_no varchar(50) = NULL
AS 
 
-- exec info.usp_fact_controltower_national 'L1663905'-- 'L1691793'--'L1695717' --'L1665725'
-- select top 1000 * from info.fact_controltower_national   order by  [Sample_no], test_no, Analysis_process_code,  department_level, CAST([Department_no] as int) 
-- select top 1000 * from info.fact_controltower_national  where [Sample_no] LIKE 'L1614785-01' and product_code_base = 'V8260TCLP'  order by  [Sample_no], test_no, Analysis_process_code,  department_level, CAST([Department_no] as int) 

if object_id('info.fact_controltower_national') IS NOT NULL  DROP TABLE info.fact_controltower_national
 
  SELECT test_no
      ,test_no_bkcc
      ,hk_h_test	 
      ,sample_no
	  ,hk_h_sample
      ,receivedate
      ,holddate 
      ,duedate
      ,duedate2
	  -- strip off parent_product data
  	  ,CASE WHEN a.product_code IS NULL THEN substring(test_no, charindex( '|',test_no,charindex( '|',test_no ))+1, LEN(test_no))  ELSE a.product_code END product_code 
	  ,a.hk_h_product
	  ,CASE WHEN a.product_code_bkcc IS NULL THEN test_no_bkcc ELSE a.product_code_bkcc END matnum 
      ,CASE WHEN a.product_code IS NULL THEN '' ELSE method END method
	  ,CASE WHEN product_code_base IS NULL THEN substring(test_no, charindex( '|',test_no,charindex( '|',test_no ))+1, LEN(test_no))  ELSE product_code_base END product_code_base
	  ,CASE WHEN matnum_base IS NULL THEN substring(test_no_bkcc, charindex( '|',test_no_bkcc,charindex( '|',test_no_bkcc ))+1, LEN(test_no_bkcc)) ELSE matnum_base END matnum_base 
	  ,product_code_parent, matnum_parent
	  INTO #test_wo_ap
	  FROM (SELECT  b.test_no, test_no_bkcc, b.sample_no, b.hk_h_sample,
					b.product_code, b.product_code_bkcc,
					p.method,
					CASE WHEN CHARINDEX('|', product_code_bkcc) = 0 THEN product_code_bkcc ELSE LEFT(product_code_bkcc,  CHARINDEX('|', product_code_bkcc)-1) END matnum_base,
					CASE WHEN CHARINDEX('|', product_code) = 0 THEN product_code ELSE LEFT(product_code,  CHARINDEX('|', product_code)-1) END product_code_base,
					CASE WHEN CHARINDEX('|', product_code) = 0 THEN '' ELSE SUBSTRING(product_code,  CHARINDEX('|', product_code)+1, LEN(product_code)) END product_code_parent,
		        	CASE WHEN CHARINDEX('|', product_code_bkcc) = 0 THEN '' ELSE  SUBSTRING(product_code_bkcc,  CHARINDEX('|', product_code_bkcc)+1, LEN(product_code_bkcc)) END matnum_parent,
					s.receivedate, 
					t.holddate, 
					s.duedate, duedate2,   
					b.hk_h_product,
					b.hk_h_test 
			FROM bus.bridge_controltower_national b
		  	 JOIN bus.s_product_mroc_national_current p ON p.hk_h_product = b.hk_h_product
			 JOIN bus.s_sample_mroc_national_current s ON s.hk_h_sample = b.hk_h_sample
		     JOIN bus.s_test_hroc_national_current t ON t.hk_h_test = b.hk_h_test
			WHERE ISNULL(b.product_code_bkcc,0) NOT LIKE '11%'   --324,089  00:17
			 AND ISNULL(@work_order_no, LEFT(b.sample_no,8)) = LEFT(b.sample_no,8) ) a

;WITH app AS (
SELECT test_no, hk_h_test,  a.hk_h_product, hk_h_analysis_process   
FROM #test_wo_ap a
INNER JOIN raw.l_analysis_process_product llink ON llink.hk_h_product  =  a.hk_h_product  
INNER JOIN bus.s_analysis_process_product_mroc_national_current s on s.hk_l_analysis_process_product  = llink.hk_l_analysis_process_product and s.list_func = 'ANALYTICAL')
,apb AS (
SELECT test_no, hk_h_test, a.hk_h_product,  hk_h_analysis_process  
FROM #test_wo_ap  a 
INNER JOIN raw.h_product p on p.product_code = a.product_code_base and p.product_code_bkcc = a.matnum_base  
INNER JOIN raw.l_analysis_process_product llink ON llink.hk_h_product  =  p.hk_h_product  
INNER JOIN bus.s_analysis_process_product_mroc_national_current s ON s.hk_l_analysis_process_product  = llink.hk_l_analysis_process_product and s.list_func = 'ANALYTICAL')
 
SELECT t.* ,ap.analysis_process_code, ap.analysis_process_code_bkcc, ap.hk_h_analysis_process
INTO #test
FROM #test_wo_ap t
LEFT JOIN app ON app.hk_h_test = t.hk_h_test
LEFT JOIN apb ON apb.hk_h_test = t.hk_h_test
LEFT JOIN raw.h_analysis_process ap ON ap.hk_h_analysis_process = COALESCE(app.hk_h_analysis_process, apb.hk_h_analysis_process) 
CREATE INDEX #test_IDX1 on #test_wo_ap(hk_h_test)   -- 00:21  613181
 
SELECT 'DONE' process_status_code ,1 batch_status_rank
INTO #batch_status
UNION ALL SELECT 'CAPT',2 UNION ALL SELECT 'WIP',3 UNION ALL SELECT 'WG',4 UNION ALL SELECT 'SUB',6UNION ALL
SELECT 'REDO',7 UNION ALL SELECT 'HERE', 8 UNION ALL SELECT 'WAIT',9 UNION ALL SELECT 'NEED',10 UNION ALL SELECT 'HOLD',11 UNION ALL SELECT 'RECP',12
CREATE UNIQUE INDEX #batch_status_IDX1 on #batch_status(process_status_code)  
 
SELECT pm.product_code, pm.product_code_bkcc
INTO #temppreprep
FROM ref.r_seedpak_mm_prodmatlist mpml 
INNER JOIN ref.r_seedpak_mm_header mh on mh.methodid = mpml.methodid
INNER JOIN raw.h_product pm on pm.product_code = mpml.prod and pm.product_code_bkcc = mpml.matnum
INNER JOIN #test tt ON tt.product_code_base = mpml.prod AND tt.matnum_base = mpml.matnum
WHERE mh.active = 'Y' and mh.method_type = 'P' and mh.esc_method_name like 'PrePrep%'
GROUP BY pm.product_code, pm.product_code_bkcc  --283  01:21

SELECT #test.test_no, #test.test_no_bkcc, #test.hk_h_test, #test.sample_no, #test.hk_h_sample,  #test.receivedate, #test.holddate, #test.duedate, #test.duedate2,
		#test.product_code, #test.hk_h_product, #test.matnum, #test.method, #test.product_code_base, #test.matnum_base, 
		#test.analysis_process_code, #test.analysis_process_code_bkcc, #test.hk_h_analysis_process ,
        h_department.hk_h_department, h_department.department_no, dt.department_level, dt.department_type
INTO #test_department 
FROM #test
INNER JOIN raw.l_department_test_schedule l on l.hk_h_test = #test.hk_h_test 
INNER JOIN raw.h_department on h_department.hk_h_department = l.hk_h_department 
INNER JOIN mas.department_type dt on dt.department_no =  h_department.department_no 
INNER JOIN bus.s_department_test_schedule_hroc_national_current s1 on s1.hk_l_department_test_schedule = l.hk_l_department_test_schedule
WHERE 1=2

INSERT #test_department 
SELECT #test.test_no, #test.test_no_bkcc, #test.hk_h_test, #test.sample_no, #test.hk_h_sample,  #test.receivedate, #test.holddate, #test.duedate, #test.duedate2,
		#test.product_code, #test.hk_h_product, #test.matnum, #test.method, #test.product_code_base, #test.matnum_base, 
		#test.analysis_process_code, #test.analysis_process_code_bkcc, #test.hk_h_analysis_process ,
        h_department.hk_h_department, h_department.department_no, dt.department_level, dt.department_type
FROM #test
INNER JOIN raw.l_department_test_schedule l on l.hk_h_test = #test.hk_h_test 
INNER JOIN raw.h_department on h_department.hk_h_department = l.hk_h_department 
INNER JOIN mas.department_type dt on dt.department_no =  h_department.department_no 
INNER JOIN bus.s_department_test_schedule_hroc_national_current s1 on s1.hk_l_department_test_schedule = l.hk_l_department_test_schedule
WHERE #test.hk_h_analysis_process IS NOT NULL  --3788788 02:28
CREATE UNIQUE INDEX #test_department_IDX1 on #test_department(hk_h_test, hk_h_department, department_no)    WITH (IGNORE_DUP_KEY=ON  )

INSERT #test_department  
SELECT #test.test_no, #test.test_no_bkcc, #test.hk_h_test, #test.sample_no, #test.hk_h_sample,  #test.receivedate, #test.holddate, #test.duedate, #test.duedate2,
		#test.product_code, #test.hk_h_product, #test.matnum, #test.method, #test.product_code_base, #test.matnum_base, 
		#test.analysis_process_code, #test.analysis_process_code_bkcc, #test.hk_h_analysis_process ,
        h_department.hk_h_department, h_department.department_no, dt.department_level, dt.department_type
FROM #test  
INNER JOIN #temppreprep preprep ON preprep.product_code = #test.product_code_base and preprep.product_code_bkcc =#test.matnum_base
INNER JOIN raw.h_department on department_no = 1
INNER JOIN raw.l_department_test_schedule l on l.hk_h_test = #test.hk_h_test and l.hk_h_department = h_department.hk_h_department
INNER JOIN mas.department_type dt on dt.department_no =  h_department.department_no 
INNER JOIN bus.s_department_test_schedule_hroc_national_current s1 on s1.hk_l_department_test_schedule = l.hk_l_department_test_schedule
WHERE #test.hk_h_analysis_process IS NOT NULL   --  0  00:17
-- Create table
SELECT * 
INTO #test_department_batch
FROM (
select  t.test_no,t.test_no_bkcc, t.hk_h_test, t.sample_no, t.hk_h_sample,  t.receivedate, t.holddate, t.duedate, t.duedate2,
		t.product_code, t.hk_h_product, t.matnum, t.method, t.product_code_base, t.matnum_base,   t.product_code_parent, t.matnum_parent,
		t.analysis_process_code, t.analysis_process_code_bkcc, t.hk_h_analysis_process, 
		td.hk_h_department, td.department_no, td.department_level, td.department_type, COALESCE(sc.process_status_batch_no,'')  process_status_batch_no,
		CAST(NULL AS VARCHAR(50)) process_status_code,  CAST(NULL AS DATETIME) process_status_date, 
		row_number() OVER (PARTITION BY t.hk_h_test, td.hk_h_department, sc.process_status_batch_no ORDER BY t.receivedate) rank_no, 0 batch_no_cnt 
FROM #test_department td
INNER JOIN #test t ON t.hk_h_test = td.hk_h_test
INNER JOIN raw.l_test_product tp ON tp.hk_h_test = t.hk_h_test
INNER JOIN raw.h_product on h_product.product_code = t.product_code_base and product_code_bkcc = t.matnum_base
INNER JOIN raw.l_department_test_schedule sh ON sh.hk_h_test =  t.hk_h_test and sh.hk_h_department =  td.hk_h_department 
INNER JOIN bus.s_department_test_schedule_hroc_national_current sc on sc.hk_l_department_test_schedule = sh.hk_l_department_test_schedule
) a
WHERE 1=2
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]ON [dbo].[#test_department_batch] ([hk_h_test],[department_no])  INCLUDE ([hk_h_analysis_process],[department_level])
 
-- standalone or emancipated child
INSERT  #test_department_batch
SELECT * 
FROM (
select  h_test.test_no, h_test.test_no_bkcc, h_test.hk_h_test,  t.sample_no, t.hk_h_sample,  t.receivedate, t.holddate, t.duedate, t.duedate2,
		t.product_code, t.hk_h_product, t.matnum, t.method, t.product_code_base, t.matnum_base,  t.product_code_parent, t.matnum_parent,
		t.analysis_process_code, t.analysis_process_code_bkcc, t.hk_h_analysis_process, 
		td.hk_h_department, td.department_no,  td.department_level, td.department_type, COALESCE(sc.process_status_batch_no,'')  process_status_batch_no,
		process_status_code, process_status_date, 
		row_number() OVER (PARTITION BY h_test.hk_h_test, td.hk_h_department  ORDER BY  sc.process_status_batch_no DESC, t.receivedate, sc.process_status_date, sc.dss_version) rank_no ,0 batch_no_cnt
FROM #test_department td
INNER JOIN #test t ON t.hk_h_test = td.hk_h_test
INNER JOIN raw.l_test_product tp ON tp.hk_h_test = td.hk_h_test
INNER JOIN raw.h_product on h_product.product_code = t.product_code_base and product_code_bkcc = t.matnum_base
INNER JOIN raw.h_test  ON h_test.test_no = t.sample_no + '|'+ t.product_code_base AND h_test.test_no_bkcc = t.matnum_base
LEFT JOIN raw.l_department_test_schedule sh ON sh.hk_h_test =  h_test.hk_h_test and sh.hk_h_department =  td.hk_h_department 
LEFT JOIN bus.s_department_test_schedule_hroc_national_current  sc on sc.hk_l_department_test_schedule = sh.hk_l_department_test_schedule
LEFT JOIN bus.s_test_hroc_national_current s on s.hk_h_test = h_test.hk_h_test
WHERE t.product_code_parent = '') a
WHERE rank_no = 1    --2,649,529  02:25

SELECT t.*
INTO #parenttest
FROM #test t  
INNER JOIN raw.h_test  ON h_test.test_no LIKE t.sample_no + '|'+ t.product_code_base+'|%'
WHERE 1=2
CREATE UNIQUE INDEX #tempidx ON #parenttest(hk_h_test)  with (IGNORE_DUP_KEY =ON)

--check for parent
INSERT #parenttest
SELECT t.*
FROM #test t   
INNER JOIN raw.h_test  ON h_test.test_no LIKE t.sample_no + '|'+ t.product_code_base+'|%'  --224801 00:49

IF @@rowcount != 0  
BEGIN
	INSERT  #test_department_batch
	SELECT * FROM (
	select  t.test_no,t.test_no_bkcc, t.hk_h_test, t.sample_no, t.hk_h_sample,  t.receivedate, t.holddate, t.duedate, t.duedate2,
			t.product_code, t.hk_h_product, t.matnum, t.method, t.product_code_base, t.matnum_base, t.product_code_parent, t.matnum_parent,
			t.analysis_process_code, t.analysis_process_code_bkcc, t.hk_h_analysis_process, 
			td.hk_h_department, td.department_no,  td.department_level, td.department_type, COALESCE(sc.process_status_batch_no,'')  process_status_batch_no,
			process_status_code,  process_status_date, 
			row_number() OVER (PARTITION BY t.hk_h_test, td.hk_h_department ORDER BY sc.process_status_batch_no DESC, t.receivedate, sc.process_status_date, sc.dss_version) rank_no, 0 batch_no_cnt  
	FROM #test_department td
	INNER JOIN #parenttest t ON t.hk_h_test = td.hk_h_test
	INNER JOIN bus.s_test_hroc_national_current s on s.hk_h_test = t.hk_h_test
	INNER JOIN raw.l_department_test_schedule sh ON sh.hk_h_test =  t.hk_h_test and sh.hk_h_department =  td.hk_h_department 
	INNER JOIN bus.s_department_test_schedule_hroc_national_current sc on sc.hk_l_department_test_schedule = sh.hk_l_department_test_schedule
	WHERE t.product_code_parent != '') a
	WHERE rank_no = 1  --1139259  02:04
	CREATE NONCLUSTERED INDEX [<Name of Missing Index2, sysname,>]ON [dbo].[#test_department_batch] ([department_level],[process_status_batch_no]) INCLUDE ([hk_h_test],[hk_h_analysis_process])
END

SELECT l.hk_h_test, test_no, test_no_bkcc,l. hk_h_department, department_no, MAX(process_status_date) process_status_date , count(distinct process_status_batch_no) batch_no_cnt
INTO #latest_track
FROM raw.l_department_test_status l
INNER JOIN raw.s_department_test_status_tran_national s on s.hk_l_department_test_status = l.hk_l_department_test_status
JOIN #test_department d on d.hk_h_test = l.hk_h_test and d.hk_h_department = l.hk_h_department
WHERE department_level IN (1,2,3)
GROUP BY l.hk_h_test, test_no, test_no_bkcc, l.hk_h_department, department_no --2182394 01:43
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>] ON [dbo].[#latest_track] ([hk_h_test],[process_status_date]) INCLUDE ([test_no],[test_no_bkcc],[department_no],[batch_no_cnt])
 
SELECT hk_h_test, test_no, test_no_bkcc, process_status_date , MAX(department_no) department_no, max(batch_no_cnt) batch_no_cnt
INTO #driving_dept
FROM #latest_track t 
WHERE process_status_date = (SELECT MAX(process_status_date) from #latest_track i where i.hk_h_test = t.hk_h_test)  
GROUP BY hk_h_test, test_no, test_no_bkcc, process_status_date   --764013  00:03

SELECT b.hk_h_test,  b.hk_h_analysis_process, b.department_no, department_level, dd.batch_no_cnt,
 	(SELECT ISNULL(MAX(process_status_batch_no),'') FROM raw.l_department_test_status i 
	  INNER JOIN  #driving_dept d ON d.hk_h_test = i.hk_h_test  AND d.process_status_date = i.process_status_date  
	  INNER JOIN bus.s_department_test_status_tran_national_current s on s.hk_l_department_test_status = i.hk_l_department_test_status
	  WHERE  i.hk_h_test = b.hk_h_test) process_status_batch_no 
INTO #test_driving_batch  
FROM #test_department_batch b 
INNER JOIN #driving_dept dd ON dd.hk_h_test = b.hk_h_test  AND dd.department_no = b.department_no   -- 764013  00:15
CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]ON [dbo].[#test_driving_batch] ([hk_h_test],[hk_h_analysis_process]) INCLUDE ([process_status_batch_no])

UPDATE tdb
SET batch_no_cnt = tb.batch_no_cnt  
FROM #test_department_batch tdb
INNER JOIN #test_driving_batch  tb on tb.hk_h_test = tdb.hk_h_test and tb.hk_h_analysis_process = tdb.hk_h_analysis_process

-- reset status on redo
UPDATE tdb
SET process_status_code = 'NEED', process_status_batch_no = '', tdb.batch_no_cnt = tb.batch_no_cnt
FROM #test_department_batch tdb
INNER JOIN #test_driving_batch  tb on tb.hk_h_test = tdb.hk_h_test and tb.hk_h_analysis_process = tdb.hk_h_analysis_process
WHERE tdb.process_status_batch_no != tb.process_status_batch_no  
  AND tdb.department_level > tb.department_level
  AND tb.batch_no_cnt > 1   --139742 00:07


SELECT  tdb.hk_h_test, tdb.test_no, tdb.hk_h_department , tdb.department_no, ts.process_status_code, ts.process_status_date, COALESCE(s.process_status_batch_no ,'') process_status_batch_no,
        ts.hk_l_department_test_status, batch_status_rank,
		row_number() OVER (PARTITION BY tdb.hk_h_test,  tdb.test_no, tdb.test_no_bkcc, tdb.hk_h_department, h_department.department_no, s.process_status_batch_no ORDER BY ts.process_status_date DESC,  batch_status_rank) batch_status_date_rank,
		row_number() OVER (PARTITION BY tdb.hk_h_test, tdb.test_no, tdb.test_no_bkcc, tdb.hk_h_department, h_department.department_no, s.process_status_batch_no, ts.process_status_date ORDER BY batch_status_rank) batch_status_date_dup_row_no 
INTO #batch_status_rank
FROM #test_department_batch tdb
JOIN raw.h_product p on p.product_code =product_code_base and p.product_code_bkcc = matnum_base
JOIN raw.l_analysis_process_product app ON app.hk_h_analysis_process = tdb.hk_h_analysis_process and app.hk_h_product = p.hk_h_product
INNER JOIN raw.h_department on h_department.hk_h_department = tdb.hk_h_department
INNER JOIN mas.department_type d on d.department_no = h_department.department_no
INNER JOIN raw.l_department_test_status ts on ts.hk_h_test = tdb.hk_h_test AND ts.hk_h_department = tdb.hk_h_department 
INNER JOIN bus.s_department_test_status_tran_national_current s on s.hk_l_department_test_status = ts.hk_l_department_test_status AND isnull(s.process_status_batch_no,'')  = ISNULL(tdb.process_status_batch_no,'')
INNER JOIN #batch_status ON #batch_status.process_status_code = ts.process_status_code 
WHERE ISNULL(s.lasttool,'lasttool') != 'PREPLOGINTOOL'  --6951440  03:27
CREATE INDEX #batch_status_rank_IDX1  on #batch_status_rank(hk_h_test, hk_h_department,  department_no, process_status_date, process_status_batch_no, process_status_code)  --  00:24

SELECT td.hk_h_test ,td.test_no,  td.test_no_bkcc, td.hk_h_department, td.department_no ,  r.process_status_code, r.process_status_date, r.process_status_batch_no ,td.department_level, td.department_type, td.hk_h_analysis_process, td.analysis_process_code, td.analysis_process_code_bkcc
INTO #test_department_batch_status
FROM #test_department_batch td 
INNER JOIN #batch_status_rank r on r.hk_h_test = td.hk_h_test AND  r.hk_h_department = td.hk_h_department and r.department_no = td.department_no  
WHERE batch_status_date_rank = 1 AND batch_status_date_dup_row_no  = 1    --3549257  00:16
CREATE  INDEX #test_department_batch_status_IDX1 on #test_department_batch_status(hk_h_test, test_no, test_no_bkcc, hk_h_department,  department_no, process_status_date, process_status_batch_no, process_status_code)   -- 0015

-- overwrite orderdetail data with ordertrack if there
UPDATE t
SET process_status_code = s.process_status_code,
	process_status_date = s.process_status_date,
	process_status_batch_no = s.process_status_batch_no  
FROM #test_department_batch t 
INNER JOIN #test_department_batch_status s on s.hk_h_test = t.hk_h_test and s.hk_h_department = t.hk_h_department 
  AND s.department_no = t.department_no  and s.process_status_batch_no = t.process_status_batch_no  
WHERE s.process_status_date = (SELECT MAX(process_status_date) process_status_date 
                                 FROM #test_department_batch_status i 
                                WHERE i.hk_h_test = s.hk_h_test and i.hk_h_department = s.hk_h_department AND i.hk_h_analysis_process = s.hk_h_analysis_process AND i.process_status_batch_no = s.process_status_batch_no)
  AND NOT (t.department_no = 2 and t.department_level = 3)   -- 3364074 00:33

-- reset analytical batch if prep_batch is different and driving 
UPDATE tdb
SET  process_status_batch_no = tb.process_status_batch_no
FROM #test_department_batch tdb
INNER JOIN #test_driving_batch  tb on tb.hk_h_test = tdb.hk_h_test and tb.hk_h_analysis_process = tdb.hk_h_analysis_process
WHERE tdb.process_status_batch_no != '' AND tdb.process_status_batch_no != tb.process_status_batch_no  
  AND tdb.department_level = 3   --0  00:05
  and tdb.batch_no_cnt > 1

SELECT * 
INTO #temppvtmindates
FROM (
SELECT hk_h_test, test_no, test_no_bkcc,  hk_h_department, department_no, COALESCE(process_status_batch_no,'') process_status_batch_no, process_status_code, process_status_date 
FROM #test_department_batch_status) t
PIVOT(MIN(process_status_date)
FOR process_status_code IN (CAPT,DONE,EMAL,FIX,HERE,HOLD,IREV,NEED,RECP,REDO,SUB,WAIT,WG,WIP)) AS pvt  -- 3549257   00:14
CREATE INDEX #temppvtmindates_IDX1 on #temppvtmindates(hk_h_test, hk_h_department)   

SELECT * 
INTO #temppvtmaxdates
FROM (
SELECT hk_h_test, test_no, test_no_bkcc, hk_h_department, department_no, process_status_code,  process_status_date, COALESCE(process_status_batch_no,'') process_status_batch_no
FROM #test_department_batch_status) t
PIVOT(MAX(process_status_date)
FOR process_status_code IN (CAPT,DONE,EMAL,FIX,HERE,HOLD,IREV,NEED,RECP,REDO,SUB,WAIT,WG,WIP)) AS pvt    ----3549257 00:12
CREATE INDEX #temppvtmaxdates_IDX1 on #temppvtmaxdates(hk_h_test, hk_h_department)

SELECT hk_h_test, test_no, test_no_bkcc,  hk_h_department, department_no, process_status_batch_no, MIN(process_status_date) process_status_date
 INTO #tempavaildates
FROM (
SELECT hk_h_test, test_no, test_no_bkcc,  hk_h_department, department_no, COALESCE(process_status_batch_no,'') process_status_batch_no,  (process_status_date) process_status_date 
FROM  #test_department_batch_status 
WHERE process_status_code NOT IN ('NEED')
UNION
SELECT hk_h_test, test_no, test_no_bkcc, hk_h_department, department_no, COALESCE(process_status_batch_no,'') process_status_batch_no,  (process_status_date) process_status_date
FROM #test_department_batch
WHERE process_status_code NOT IN ('NEED')) a
GROUP BY  hk_h_test, test_no, test_no_bkcc, hk_h_department, department_no, process_status_batch_no  --3546843 00:11
CREATE INDEX #tempavaildates_IDX1 on #tempavaildates(hk_h_test, hk_h_department)

SELECT hk_h_test, test_no, test_no_bkcc,  hk_h_department, department_no, process_status_batch_no, MIN(process_status_date) process_status_date
INTO #tempbatchdates
FROM (
SELECT hk_h_test, test_no, test_no_bkcc, hk_h_department, department_no, COALESCE(process_status_batch_no,'') process_status_batch_no, (process_status_date) process_status_date--, MAX(worknum) progressworknum
FROM #test_department_batch_status
WHERE process_status_code NOT IN ('NEED','HERE')  AND process_status_batch_no IS NOT NULL 
UNION
SELECT hk_h_test, test_no, test_no_bkcc, hk_h_department, department_no, COALESCE(process_status_batch_no,'') process_status_batch_no,  (process_status_date) process_status_date
FROM #test_department_batch
WHERE process_status_code NOT IN ('NEED','HERE')) a
GROUP BY hk_h_test, test_no, test_no_bkcc,  hk_h_department, department_no, process_status_batch_no  -- 3532884  00:13

SELECT hk_h_test, test_no, test_no_bkcc,  hk_h_department, department_no, process_status_batch_no, MIN(process_status_date) process_status_date
INTO #tempprogressdates
FROM (
SELECT hk_h_test, test_no, test_no_bkcc, hk_h_department, department_no, COALESCE(process_status_batch_no,'') process_status_batch_no,  (process_status_date) process_status_date--, MAX(worknum) progressworknum
FROM #test_department_batch_status
WHERE process_status_code NOT IN ('NEED','HERE','WG') 
UNION
SELECT hk_h_test, test_no, test_no_bkcc, hk_h_department, department_no, COALESCE(process_status_batch_no,'') process_status_batch_no,  (process_status_date) process_status_date
FROM #test_department_batch
WHERE process_status_code NOT IN ('NEED','HERE','WG') 
) a
GROUP BY hk_h_test, test_no, test_no_bkcc,  hk_h_department, department_no, process_status_batch_no -- 3528670 00:12 

SELECT hk_h_test, test_no, test_no_bkcc,  hk_h_department, department_no, process_status_batch_no, MIN(process_status_date) process_status_date
 INTO #tempcapturedates
FROM (
SELECT hk_h_test, test_no, test_no_bkcc, hk_h_department, department_no, COALESCE(process_status_batch_no,'') process_status_batch_no,  (process_status_date) process_status_date--, MAX(worknum) progressworknum
FROM #test_department_batch_status 
WHERE process_status_code NOT IN ('NEED','HERE','WG','WIP')  
UNION 
SELECT hk_h_test, test_no, test_no_bkcc, hk_h_department, department_no, COALESCE(process_status_batch_no,'') process_status_batch_no,  (process_status_date) process_status_date
FROM #test_department_batch
WHERE process_status_code NOT IN ('NEED','HERE','WG','WIP')  ) a
GROUP BY hk_h_test, test_no, test_no_bkcc,  hk_h_department, department_no, process_status_batch_no  -- 3523544 00:16 
SELECT  #test.hk_h_test,  #test.test_no, #test.test_no_bkcc, 
	    MAX(holddate) expiration_date, 
	    MIN(duedate)  internal_due_date, 
	    MAX(duedate2) external_due_date 
INTO #temptestagg
FROM  #test_department_batch #test
INNER JOIN #temppvtmaxdates pvt_maxdates ON pvt_maxdates.test_no = #test.test_no and pvt_maxdates.test_no_bkcc = #test.test_no_bkcc
GROUP BY #test.hk_h_test,  #test.test_no , #test.test_no_bkcc
CREATE INDEX #tmp_testagg on #temptestagg(hk_h_test)  -- 760424 01:50

;with work_order as (
SELECT * FROM (
SELECT  wt.hk_h_test, wt.hk_h_work_order,  rank() OVER (PARTITION BY wt.hk_h_test ORDER BY wt.dss_load_date DESC, wt.hk_h_work_order)  work_order_rank
FROM raw.l_workorder_test wt  ) a
WHERE work_order_rank = 1) 
,customer AS (
SELECT * FROM (
SELECT  w.hk_h_test, cw.hk_h_customer,  rank() OVER (PARTITION BY w.hk_h_test ORDER BY cw.dss_load_date DESC, cw.hk_h_customer) customer_rank
FROM raw.l_customer_workorder cw  
INNER JOIN  work_order w ON w.hk_h_work_order = cw.hk_h_work_order) a
WHERE customer_rank = 1)
,invoice AS (
SELECT * FROM (
SELECT  ti.hk_h_test, ti.hk_h_invoice,  rank() OVER (PARTITION BY ti.hk_h_test ORDER BY ti.dss_load_date DESC, ti.hk_h_invoice) invoice_rank
FROM raw.l_test_invoice ti  ) a
WHERE invoice_rank = 1) 
,pace_account AS (SELECT * FROM (
SELECT  c.hk_h_test, cp.hk_h_pace_account,  rank() OVER (PARTITION BY c.hk_h_test ORDER BY cp.dss_load_date DESC, cp.hk_h_customer) pace_account_rank
FROM raw.l_customer_paceaccount cp
INNER JOIN customer c ON c.hk_h_customer = cp.hk_h_customer ) a
WHERE pace_account_rank = 1)
 
SELECT tdb.hk_h_test, hk_h_work_order, customer.hk_h_customer, invoice.hk_h_invoice, account_no, pace_account.hk_h_pace_account , test_no
INTO #singlelink 
FROM #test_department_batch tdb
LEFT JOIN work_order on work_order.hk_h_test = tdb.hk_h_test
LEFT JOIN customer on customer.hk_h_test = tdb.hk_h_test
LEFT JOIN raw.h_customer on h_customer.hk_h_customer = customer.hk_h_customer
LEFT JOIN invoice on invoice.hk_h_test = tdb.hk_h_test
LEFT JOIN raW.h_invoice on h_invoice.hk_h_invoice = invoice.hk_h_invoice
LEFT JOIN pace_account on pace_account.hk_h_test = tdb.hk_h_test
LEFT JOIN raw.h_pace_account on h_pace_account.hk_h_pace_account = pace_account.hk_h_pace_account
WHERE ISNULL(account_no,'account_no') != 'DELETE'
  AND NOT EXISTS (SELECT 1 FROM ref.r_seedpak_trans tr WHERE application = 'INTRNL_RPT' and  specific = 'EXCLUDE_ACCOUNT' and  column_name = 'ACCTNUM' and tr.from_value =  account_no )
GROUP BY  tdb.hk_h_test, hk_h_work_order, customer.hk_h_customer, invoice.hk_h_invoice, account_no, pace_account.hk_h_pace_account , test_no
CREATE INDEX tmp_singlelink ON #singlelink (hk_h_test)

SELECT  isnull(w.work_order_no, left(sample_no,8)) work_order_no,  
        batch_grain.sample_no, 
		CASE WHEN d.department_no = 1 AND preprep.product_code IS NOT NULL THEN 101 ELSE d.department_no END department_no,
		batch_grain.test_no,
		dt.department_type, dt.department_level,
		batch_grain.process_status_batch_no,
		p.pace_account_no,
		batch_grain.analysis_process_code, batch_grain.analysis_process_code_bkcc,
	    batch_grain.product_code_base, batch_grain.matnum_base, r_seedpak_matrixdef.matrix, batch_grain.method,  
	    batch_grain.process_status_code process_status_code,
	    batch_grain.process_status_date process_status_date,
		batch_grain.receivedate, batch_grain.holddate,	
		DATEADD(day, ISNULL(g.due_date_correction,0), internal_due_date) internal_duedate,
	    DATEADD(day, ISNULL(g.due_date_correction,0), external_due_date) external_duedate, 
		CASE WHEN batch_grain.department_no != 1 THEN batch_grain.receivedate ELSE avail.process_status_date  END dept_avail_date,  
        batch.process_status_date  dept_batch_date,
	    progress.process_status_date work_inprogress_date,
	    capture.process_status_date  work_capture_date,
	    pvt_maxdates.DONE work_complete_date,
		CASE WHEN preprep.product_code IS NULL THEN 'N' ELSE 'Y' END as preprep_required,	
		sinvoice.original_invoice_date, 
		sinvoice.invoicedate,
		batch_no_cnt,
		CASE LEFT(product_code_base,3) WHEN 'ALL' THEN 75  ELSE 80  END operating_lab, 
	    n.on_behalf_of_lab_no,
		n2.on_behalf_of_lab_no subout_lab_no
INTO info.fact_controltower_national
FROM #test_department_batch batch_grain 
INNER JOIN raw.h_department d  on d.hk_h_department = batch_grain.hk_h_department  
INNER JOIN mas.department_type dt  on dt.department_no = batch_grain.department_no  
INNER JOIN #singlelink sl ON sl.hk_h_test = batch_grain.hk_h_test  
LEFT JOIN bus.s_invoice_mroc_national_current sinvoice on sinvoice.hk_h_invoice = sl.hk_h_invoice
LEFT JOIN raw.h_work_order w on w.hk_h_work_order = sl.hk_h_work_order
LEFT JOIN raw.h_pace_account p on p.hk_h_pace_account = sl.hk_h_pace_account
LEFT JOIN #temptestagg test_data ON test_data.hk_h_test = batch_grain.hk_h_test 
LEFT JOIN #temppvtmaxdates pvt_maxdates on pvt_maxdates.hk_h_test = batch_grain.hk_h_test AND pvt_maxdates.hk_h_department = batch_grain.hk_h_department and batch_grain.department_no =pvt_maxdates.department_no and batch_grain.process_status_batch_no  = pvt_maxdates.process_status_batch_no
lEFT JOIN #temppvtmindates pvt_mindates on pvt_mindates.hk_h_test = batch_grain.hk_h_test AND pvt_mindates.hk_h_department = batch_grain.hk_h_department and batch_grain.department_no =pvt_maxdates.department_no and batch_grain.process_status_batch_no = pvt_mindates.process_status_batch_no
lEFT JOIN #tempavaildates avail on avail.hk_h_test = batch_grain.hk_h_test AND avail.hk_h_department = batch_grain.hk_h_department  and batch_grain.department_no =  avail.department_no and batch_grain.process_status_batch_no = avail.process_status_batch_no
LEFT JOIN #tempprogressdates progress on progress.hk_h_test = batch_grain.hk_h_test AND progress.hk_h_department = batch_grain.hk_h_department  and batch_grain.department_no =progress.department_no and batch_grain.process_status_batch_no = progress.process_status_batch_no
LEFT JOIN #tempbatchdates batch on batch.hk_h_test = batch_grain.hk_h_test AND batch.hk_h_department = batch_grain.hk_h_department  and batch_grain.department_no = batch.department_no and batch_grain.process_status_batch_no = batch.process_status_batch_no
LEFT JOIN #tempcapturedates capture on capture.hk_h_test = batch_grain.hk_h_test AND capture.hk_h_department = batch_grain.hk_h_department and batch_grain.department_no = capture.department_no and batch_grain.process_status_batch_no = capture.process_status_batch_no
LEFT JOIN #temppreprep preprep on preprep.product_code = batch_grain.product_code_base and preprep.product_code_bkcc = batch_grain.matnum_base
LEFT JOIN ref.r_seedpak_matrixdef on r_seedpak_matrixdef.matnum = batch_grain.matnum_base 
LEFT JOIN mas.lab_reporting_group g ON g.list_type = batch_grain.analysis_process_code AND g.list_matclass = batch_grain.analysis_process_code_bkcc
LEFT JOIN mas.work_location_map n on n.acctnum = sl.account_no and n.system_id = 'lims80' and operating_lab_no = CASE LEFT(product_code_base,3) WHEN 'ALL' THEN 75  ELSE 80  END
LEFT JOIN ref.r_seedpak_prep_data prep on  prep.datapoint_id = 630  and prep.worknum =batch_grain.process_status_batch_no and dt.department_level = 3
LEFT JOIN  mas.work_location_map n2 on n2.acctnum = prep.datavalue and n2.system_id = 'lims80'
    AND n2.operating_lab_no = CASE WHEN LEFT(product_code_base,3) = 'ALL' THEN 75 ELSE 80 end

 RETURN
GO
