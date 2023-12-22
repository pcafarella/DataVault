/****** Object:  StoredProcedure [info].[usp_fact_controltower_national_ap2]    Script Date: 12/21/2023 7:17:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE           PROCEDURE [info].[usp_fact_controltower_national_ap2]    @work_order_no varchar(50) = NULL -- 'L1577869'-- 'L1632346'--'L1645127'--L1643669'--'L1642261'-- 'L1639141'--'L1641864' -- ='L1642911'-- 'L1642261'---l1641985'  --='L1641864'--'L1638501'--'L1641864'--'L1641017'--'L1636842'  --= 'L1642891'  --'L1629949'-- 'L1622150'--'L1637130' --'L1621899'
AS 

-- exec info.usp_fact_controltower_national_ap2   'L1662351'   
-- select top 1000 * from info.fact_controltower_national_ap2   WHERE sample_no LIKE '%-02' and  analysis_process_code like 'TOC'   order by   sample_no, analysis_process_code, analysis_process_code_bkcc
 --select top 1000 * from info.fact_controltower_national  where [sample_no] LIKE 'L1671801%'    order by   sample_no, analysis_process_code, analysis_process_code_bkcc, department_no
-- select top 1000 * from info.fact_controltower_ap3 WHERE [sample nbr] like 'L1671801%'   order by   sample_no, analysis_process_code, analysis_process_code_bkcc

if object_id('info.fact_controltower_national_ap2') IS NOT NULL  DROP TABLE info.fact_controltower_national_ap2

SELECT [work_order_no]
      ,[sample_no]
      ,[pace_account_no]
	  ,LEFT(pace_account_no,2) lab
      ,analysis_process_code
      ,analysis_process_code_bkcc 
      ,MIN([method]) method
      ,MIN([receivedate]) [receivedate]
      ,MIN([holddate]) [holddate]
      ,MAX([internal_duedate]) [internal_duedate]
      ,MIN([external_duedate]) [external_duedate]
      ,MIN([preprep_required]) [preprep_required]
      ,MIN([original_invoice_date]) [original_invoice_date]
      ,MIN([invoicedate]) [invoicedate]
 INTO #sample_analysis_process 
FROM info.fact_controltower_national b
 WHERE ISNULL(@work_order_no, work_order_no) = b.work_order_no
GROUP BY [work_order_no]
      ,[sample_no]
      ,[pace_account_no]
      ,analysis_process_code
      ,analysis_process_code_bkcc   

SELECT 'DONE' process_status_code ,1 batch_status_rank
INTO #batch_status
UNION ALL
SELECT 'CAPT',2
UNION ALL
SELECT 'WIP',3
UNION ALL
SELECT 'WG',4
UNION ALL
SELECT 'SUB',6
UNION ALL
SELECT 'REDO',7
UNION ALL
SELECT 'HERE', 8
UNION ALL
SELECT 'WAIT',9
UNION ALL
SELECT 'NEED',10
UNION ALL
SELECT 'HOLD',11

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc,product_code_base, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date, MAX(ISNULL(dept_batch_date,'1900-01-01')) dept_batch_date, MAX(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date,
	MAX(ISNULL(work_capture_date,'1900-01-01')) work_capture_date, MAX(ISNULL(work_complete_date,'1900-01-01')) work_complete_date
INTO #login1
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 1 
GROUP BY f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc,  product_code_base, d.department_no, department_short_name , process_status_batch_no

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(NULLIF(dept_avail_date,'1900-01-01'),'9999-12-31')) dept_avail_date, MAX(ISNULL(NULLIF(dept_batch_date,'1900-01-01'),'9999-12-31')) dept_batch_date, MAX(ISNULL(NULLIF(work_inprogress_date,'1900-01-01'),'9999-12-31')) work_inprogress_date,
	MAX(ISNULL(NULLIF(work_capture_date,'1900-01-01'),'9999-12-31')) work_capture_date, MAX(ISNULL(NULLIF(work_complete_date,'1900-01-01'),'9999-12-31')) work_complete_date
INTO #login
FROM #login1 f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 1 
GROUP BY f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name , process_status_batch_no

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, product_code_base, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date, MAX(ISNULL(dept_batch_date,'1900-01-01')) dept_batch_date, MAX(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date,
	MAX(ISNULL(work_capture_date,'1900-01-01')) work_capture_date, MAX(ISNULL(work_complete_date,'1900-01-01')) work_complete_date
INTO #preprep1
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 1.5
GROUP BY f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc,  product_code_base, d.department_no, department_short_name, process_status_batch_no

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(NULLIF(dept_avail_date,'1900-01-01'),'9999-12-31')) dept_avail_date, MAX(ISNULL(NULLIF(dept_batch_date,'1900-01-01'),'9999-12-31')) dept_batch_date, MAX(ISNULL(NULLIF(work_inprogress_date,'1900-01-01'),'9999-12-31')) work_inprogress_date,
	MAX(ISNULL(NULLIF(work_capture_date,'1900-01-01'),'9999-12-31')) work_capture_date, MAX(ISNULL(NULLIF(work_complete_date,'1900-01-01'),'9999-12-31')) work_complete_date
INTO #preprep
FROM #preprep1 f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 1.5
GROUP BY f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name, process_status_batch_no

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, product_code_base, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date, MAX(ISNULL(dept_batch_date,'1900-01-01')) dept_batch_date, MAX(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date,
	MAX(ISNULL(work_capture_date,'1900-01-01')) work_capture_date, MAX(ISNULL(work_complete_date,'1900-01-01')) work_complete_date
INTO #prep1
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 2 
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc,  product_code_base, d.department_no, department_short_name  ,process_status_batch_no

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(NULLIF(dept_avail_date,'1900-01-01'),'9999-12-31')) dept_avail_date, MAX(ISNULL(NULLIF(dept_batch_date,'1900-01-01'),'9999-12-31')) dept_batch_date, MAX(ISNULL(NULLIF(work_inprogress_date,'1900-01-01'),'9999-12-31')) work_inprogress_date,
	MAX(ISNULL(NULLIF(work_capture_date,'1900-01-01'),'9999-12-31')) work_capture_date, MAX(ISNULL(NULLIF(work_complete_date,'1900-01-01'),'9999-12-31')) work_complete_date
INTO #prep
FROM #prep1 f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 2 
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name  ,process_status_batch_no

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc,product_code_base, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date, MAX(ISNULL(dept_batch_date,'1900-01-01')) dept_batch_date, MAX(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date,
	MAX(ISNULL(work_capture_date,'1900-01-01')) work_capture_date, MAX(ISNULL(work_complete_date,'1900-01-01')) work_complete_date
INTO #analytical1
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 3   
AND f.department_no = (SELECT min(department_no) FROM  info.fact_controltower_national i WHERE i.department_level= 3 AND i.sample_no = f.sample_no AND i.analysis_process_code = f.analysis_process_code AND i.analysis_process_code_bkcc = f.analysis_process_code_bkcc)
GROUP BY  f.sample_no, f.analysis_process_code,  f.analysis_process_code_bkcc, product_code_base, d.department_no, department_short_name, process_status_batch_no 
 
SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(NULLIF(dept_avail_date,'1900-01-01'),'9999-12-31')) dept_avail_date, MAX(ISNULL(NULLIF(dept_batch_date,'1900-01-01'),'9999-12-31')) dept_batch_date, MAX(ISNULL(NULLIF(work_inprogress_date,'1900-01-01'),'9999-12-31')) work_inprogress_date,
	MAX(ISNULL(NULLIF(work_capture_date,'1900-01-01'),'9999-12-31')) work_capture_date, MAX(ISNULL(NULLIF(work_complete_date,'1900-01-01'),'9999-12-31')) work_complete_date
INTO #analytical
FROM #analytical1 f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 3   
AND f.department_no = (SELECT min(department_no) FROM  info.fact_controltower_national i WHERE i.department_level= 3 AND i.sample_no = f.sample_no AND i.analysis_process_code = f.analysis_process_code AND i.analysis_process_code_bkcc = f.analysis_process_code_bkcc)
GROUP BY  f.sample_no, f.analysis_process_code,  f.analysis_process_code_bkcc, d.department_no, d.department_short_name, process_status_batch_no 

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, product_code_base, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date, MAX(ISNULL(dept_batch_date,'1900-01-01')) dept_batch_date, MAX(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date,
	MAX(ISNULL(work_capture_date,'1900-01-01')) work_capture_date, MAX(ISNULL(work_complete_date,'1900-01-01')) work_complete_date
INTO #reporting1
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 4 
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, product_code_base, d.department_no, department_short_name, process_status_batch_no 

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(NULLIF(dept_avail_date,'1900-01-01'),'9999-12-31')) dept_avail_date, MAX(ISNULL(NULLIF(dept_batch_date,'1900-01-01'),'9999-12-31')) dept_batch_date, MAX(ISNULL(NULLIF(work_inprogress_date,'1900-01-01'),'9999-12-31')) work_inprogress_date,
	MAX(ISNULL(NULLIF(work_capture_date,'1900-01-01'),'9999-12-31')) work_capture_date, MAX(ISNULL(NULLIF(work_complete_date,'1900-01-01'),'9999-12-31')) work_complete_date
INTO #reporting
FROM #reporting1 f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 4 
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name, process_status_batch_no 

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, product_code_base, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date, MAX(ISNULL(dept_batch_date,'1900-01-01')) dept_batch_date, MAX(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date,
	MAX(ISNULL(work_capture_date,'1900-01-01')) work_capture_date, MAX(ISNULL(work_complete_date,'1900-01-01')) work_complete_date
INTO #invoice1
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 5
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, product_code_base, d.department_no, department_short_name, process_status_batch_no 

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MAX(process_status_date) process_status_date,
	MAX(ISNULL(NULLIF(dept_avail_date,'1900-01-01'),'9999-12-31')) dept_avail_date, MAX(ISNULL(NULLIF(dept_batch_date,'1900-01-01'),'9999-12-31')) dept_batch_date, MAX(ISNULL(NULLIF(work_inprogress_date,'1900-01-01'),'9999-12-31')) work_inprogress_date,
	MAX(ISNULL(NULLIF(work_capture_date,'1900-01-01'),'9999-12-31')) work_capture_date, MAX(ISNULL(NULLIF(work_complete_date,'1900-01-01'),'9999-12-31')) work_complete_date
INTO #invoice
FROM #invoice1 f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 5
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, d.department_short_name, process_status_batch_no  

SELECT sa.sample_no, sa.analysis_process_code, sa.analysis_process_code_bkcc, product_code_base, department_no,  min(batch_status_rank) min_process_status_rank, max(batch_status_rank) max_process_status_rank
INTO #temp1
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process sa on sa.sample_no = f.sample_no and sa.analysis_process_code = f.analysis_process_code and sa.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN #batch_status b on b.process_status_code  = f.process_status_code
GROUP BY sa.sample_no, sa.analysis_process_code, sa.analysis_process_code_bkcc, product_code_base, department_no
CREATE INDEX idx_temp on #temp1(sample_no, analysis_process_code, product_code_base, department_no)
 
SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,  f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #login_status1
FROM  #login1 l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
INNER JOIN #batch_status s ON s.process_status_code = f.process_status_code
INNER JOIN #temp1 t on t.sample_no = f.sample_no and t.analysis_process_code = f.analysis_process_code and t.analysis_process_code_bkcc = f.analysis_process_code_bkcc and t.product_code_base = f.product_code_base  AND t.department_no = f.department_no  and t.min_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,  f.process_status_code,  f.process_status_batch_no
 
SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc,   l.department_no,  l.process_status_code,  ISNULL(l.process_status_batch_no,'') process_status_batch_no
INTO #login_status
FROM  #login_status1 l
INNER JOIN #batch_status s ON s.process_status_code = l.process_status_code
INNER JOIN #temp1 t on t.sample_no = l.sample_no and t.analysis_process_code = l.analysis_process_code and t.analysis_process_code_bkcc = l.analysis_process_code_bkcc and t.department_no = l.department_no  and t.max_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  l.process_status_code,  l.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base,  l.department_no,    f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #preprep_status1
FROM  #preprep1 l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
INNER JOIN #batch_status s ON s.process_status_code = f.process_status_code
INNER JOIN #temp1 t on t.sample_no = f.sample_no and t.analysis_process_code = f.analysis_process_code and t.analysis_process_code_bkcc = f.analysis_process_code_bkcc and t.product_code_base = f.product_code_base  AND t.department_no = f.department_no  and t.min_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc,   l.department_no,  l.process_status_code,  ISNULL(l.process_status_batch_no,'') process_status_batch_no
INTO #preprep_status
FROM  #preprep_status1 l
INNER JOIN #batch_status s ON s.process_status_code = l.process_status_code
INNER JOIN #temp1 t on t.sample_no = l.sample_no and t.analysis_process_code = l.analysis_process_code and t.analysis_process_code_bkcc = l.analysis_process_code_bkcc and t.department_no = l.department_no  and t.max_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  l.process_status_code,  l.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base,  l.department_no,  f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #analytical_status1
FROM  #analytical1 l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.product_code_base = f.product_code_base AND  l.department_no = f.department_no
INNER JOIN #batch_status s ON s.process_status_code = f.process_status_code
INNER JOIN #temp1 t on t.sample_no = f.sample_no and t.analysis_process_code = f.analysis_process_code and t.analysis_process_code_bkcc = f.analysis_process_code_bkcc and t.product_code_base = f.product_code_base AND  t.department_no = f.department_no  and t.min_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc,   l.department_no,   l.process_status_code,  ISNULL(l.process_status_batch_no,'') process_status_batch_no
INTO #analytical_status 
FROM  #analytical_status1 l
INNER JOIN #batch_status s ON s.process_status_code = l.process_status_code
INNER JOIN #temp1 t on t.sample_no = l.sample_no and t.analysis_process_code = l.analysis_process_code and t.analysis_process_code_bkcc = l.analysis_process_code_bkcc and t.department_no = l.department_no  and t.max_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  l.process_status_code,  l.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,  f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #prep_status1
FROM  #prep1 l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
INNER JOIN #batch_status s ON s.process_status_code = f.process_status_code
INNER JOIN #temp1 t on t.sample_no = f.sample_no and t.analysis_process_code = f.analysis_process_code and t.analysis_process_code_bkcc = f.analysis_process_code_bkcc and t.product_code_base = f.product_code_base AND  t.department_no = f.department_no  and t.min_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc,   l.department_no,  l.process_status_code,  ISNULL(l.process_status_batch_no,'') process_status_batch_no
INTO #prep_status 
FROM  #prep_status1 l
INNER JOIN #batch_status s ON s.process_status_code = l.process_status_code
INNER JOIN #temp1 t on t.sample_no = l.sample_no and t.analysis_process_code = l.analysis_process_code and t.analysis_process_code_bkcc = l.analysis_process_code_bkcc and t.department_no = l.department_no  and t.max_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  l.process_status_code,  l.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,   f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #reporting_status1
FROM  #reporting1 l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
INNER JOIN #batch_status s ON s.process_status_code = f.process_status_code
INNER JOIN #temp1 t on t.sample_no = f.sample_no and t.analysis_process_code = f.analysis_process_code and t.analysis_process_code_bkcc = f.analysis_process_code_bkcc and t.product_code_base = f.product_code_base AND  t.department_no = f.department_no  and t.min_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc,   l.department_no,  l.process_status_code,  ISNULL(l.process_status_batch_no,'') process_status_batch_no
INTO #reporting_status 
FROM  #reporting_status1 l
INNER JOIN #batch_status s ON s.process_status_code = l.process_status_code
INNER JOIN #temp1 t on t.sample_no = l.sample_no and t.analysis_process_code = l.analysis_process_code and t.analysis_process_code_bkcc = l.analysis_process_code_bkcc and t.department_no = l.department_no  and t.max_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  l.process_status_code,  l.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,  f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #invoice_status1
FROM  #invoice1 l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
INNER JOIN #batch_status s ON s.process_status_code = f.process_status_code
INNER JOIN #temp1 t on t.sample_no = f.sample_no and t.analysis_process_code = f.analysis_process_code and t.analysis_process_code_bkcc = f.analysis_process_code_bkcc and t.product_code_base = f.product_code_base AND  t.department_no = f.department_no  and t.min_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.product_code_base, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc,   l.department_no,  l.process_status_code,  ISNULL(l.process_status_batch_no,'') process_status_batch_no
INTO #invoice_status 
FROM  #invoice_status1 l
INNER JOIN #batch_status s ON s.process_status_code = l.process_status_code
INNER JOIN #temp1 t on t.sample_no = l.sample_no and t.analysis_process_code = l.analysis_process_code and t.analysis_process_code_bkcc = l.analysis_process_code_bkcc and t.department_no = l.department_no  --and t.max_process_status_rank = s.batch_status_rank
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  l.process_status_code,  l.process_status_batch_no

--pivot batch numbers for grain
SELECT sample_no, analysis_process_code, analysis_process_code_bkcc, 
	[1.50],[2.00],[3.00]
INTO #three
FROM (
SELECT department_level, sa.sample_no, sa.analysis_process_code, sa.analysis_process_code_bkcc, 
 process_status_batch_no
FROM  info.fact_controltower_national f
INNER JOIN #sample_analysis_process sa on sa.sample_no = f.sample_no and sa.analysis_process_code =f.analysis_process_code and sa.analysis_process_code_bkcc = f.analysis_process_code_bkcc
GROUP BY department_level, process_status_batch_no,  sa.sample_no, sa.analysis_process_code, sa.analysis_process_code_bkcc, process_status_batch_no
) as SourceTable
PIVOT (max(process_status_batch_no)
FOR department_level in ([1.50],[2.00],[3.00])) as Pivottable  
WHERE COALESCE([1.50],[2.00],[3.00]) IS NOT NULL

SELECT sa.work_order_no
	  ,sa.[sample_no]
      ,sa.[pace_account_no]
      ,sa.analysis_process_code [analysis_process_code]
      ,sa.analysis_process_code_bkcc [analysis_process_code_bkcc]
      ,sa.[method]
      ,sa.[holddate]
      ,sa.[internal_duedate]
      ,sa.[external_duedate]
      ,sa.[original_invoice_date]
      ,sa.[invoicedate]

      ,l.department_no [login_department_no]
      ,l.department_short_name [login_department_short_name]
      ,ls.process_status_code [login_process_status_code]
      ,l.process_status_date [login_process_status_date]
	  ,sa.receivedate login_dept_avail_date
      ,NULLIF(l.work_complete_date,'9999-12-31 00:00:00.0000000') [login_dept_done_status_date]

      ,lp.department_no [preprep_department_no]
      ,lp.department_short_name [preprep_department_short_name]
	  ,lps.process_status_batch_no  [preprep_process_status_batch_no]
      ,lps.process_status_code [preprep_process_status_code]
      ,lp.process_status_date [preprep_process_status_date]
      ,NULLIF(lp.dept_avail_date,'9999-12-31 00:00:00.0000000') [preprep_dept_avail_status_date]
      ,NULLIF(lp.dept_batch_date,'9999-12-31 00:00:00.0000000') [preprep_dept_batch_status_date]
      ,NULLIF(lp.work_complete_date,'9999-12-31 00:00:00.0000000') [preprep_dept_done_status_date]

      ,p.department_no [prep_department_no]
      ,p.department_short_name [prep_department_short_name]
	  ,ps.process_status_batch_no [prep_process_status_batch_no]
      ,ps.process_status_code [prep_process_status_code]
      ,p.process_status_date [prep_process_status_date]
      ,NULLIF(p.dept_avail_date,'9999-12-31 00:00:00.0000000') [prep_dept_avail_status_date]
	  ,NULLIF(p.dept_batch_date,'9999-12-31 00:00:00.0000000') [prep_dept_batch_status_date]
      ,NULLIF(p.work_inprogress_date,'9999-12-31 00:00:00.0000000') [prep_dept_inprogress_status_date]
	  ,NULLIF(p.work_complete_date,'9999-12-31 00:00:00.0000000') [prep_dept_done_status_date]
 
      ,a.department_no [analysis_department_no]
      ,a.department_short_name [analysis_department_short_name]
	  ,als.process_status_batch_no [analysis_process_status_batch_no]
      ,als.process_status_code [analysis_process_status_code]
      ,a.process_status_date [analysis_process_status_date]
      ,NULLIF(a.dept_avail_date,'9999-12-31 00:00:00.0000000') [analysis_dept_avail_status_date]
	  ,NULLIF(a.dept_batch_date,'9999-12-31 00:00:00.0000000') [analysis_dept_batch_status_date]
      ,NULLIF(a.work_inprogress_date,'9999-12-31 00:00:00.0000000') [analysis_dept_inprogress_status_date]
	  ,NULLIF(a.work_capture_date,'9999-12-31 00:00:00.0000000') [analysis_dept_capture_status_date]
      ,NULLIF(a.work_complete_date,'9999-12-31 00:00:00.0000000') [analysis_dept_done_status_date]
 
	  ,r.department_no [reporting_department_no]
      ,r.department_short_name [reporting_department_short_name]
      ,rs.process_status_code [reporting_process_status_code]
      ,r.process_status_date [reporting_process_status_date]
      ,NULLIF(r.work_complete_date,'9999-12-31 00:00:00.0000000') [reporting_dept_done_status_date]
	
	  ,i.department_no [invoice_department_no]
      ,i.department_short_name [invoice_department_short_name]
      ,iis.process_status_code [invoice_process_status_code]
      ,i.process_status_date [invoice_process_status_date]
      ,NULLIF(i.work_complete_date,'9999-12-31 00:00:00.0000000') [invoice_dept_done_status_date]
INTO info.fact_controltower_national_ap2 
FROM  #sample_analysis_process sa  
INNER JOIN #three t ON t.sample_no = sa.sample_no AND t.analysis_process_code = sa.analysis_process_code AND t.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  
LEFT OUTER JOIN #login l ON l.sample_no = sa.sample_no AND l.analysis_process_code = sa.analysis_process_code AND l.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  
LEFT OUTER JOIN #login_status ls ON ls.sample_no = sa.sample_no AND ls.analysis_process_code = sa.analysis_process_code AND ls.analysis_process_code_bkcc = sa.analysis_process_code_bkcc AND ls.process_status_batch_no = l.process_status_batch_no
LEFT OUTER JOIN #reporting r ON r.sample_no = sa.sample_no AND r.analysis_process_code = sa.analysis_process_code AND r.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #reporting_status rs ON rs.sample_no = sa.sample_no AND rs.analysis_process_code = sa.analysis_process_code AND rs.analysis_process_code_bkcc = sa.analysis_process_code_bkcc   
LEFT OUTER JOIN #invoice i  ON i.sample_no = sa.sample_no AND i.analysis_process_code = sa.analysis_process_code AND i.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #invoice_status iis  ON iis.sample_no = sa.sample_no AND iis.analysis_process_code = sa.analysis_process_code AND iis.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  
LEFT OUTER JOIN #analytical a ON a.sample_no = sa.sample_no AND a.analysis_process_code = sa.analysis_process_code AND a.analysis_process_code_bkcc = sa.analysis_process_code_bkcc and a.process_status_batch_no = t.[3.00]
LEFT OUTER JOIN #analytical_status als ON als.sample_no = sa.sample_no AND als.analysis_process_code = sa.analysis_process_code AND als.analysis_process_code_bkcc = sa.analysis_process_code_bkcc AND als.process_status_batch_no = a.process_status_batch_no  
LEFT OUTER JOIN #prep p ON p.sample_no = sa.sample_no AND p.analysis_process_code = sa.analysis_process_code AND p.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  and p.process_status_batch_no = t.[2.00]
LEFT OUTER JOIN #prep_status ps ON ps.sample_no = sa.sample_no AND ps.analysis_process_code = sa.analysis_process_code AND ps.analysis_process_code_bkcc = sa.analysis_process_code_bkcc AND ps.process_status_batch_no = p.process_status_batch_no                
LEFT OUTER JOIN #preprep lp ON lp.sample_no = sa.sample_no AND lp.analysis_process_code = sa.analysis_process_code AND lp.analysis_process_code_bkcc = sa.analysis_process_code_bkcc   and lp.process_status_batch_no = t.[1.50]
LEFT OUTER JOIN #preprep_status lps ON lps.sample_no = sa.sample_no AND lps.analysis_process_code = sa.analysis_process_code AND lps.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  AND lps.process_status_batch_no = lp.process_status_batch_no  

 
RETURN
GO
