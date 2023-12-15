/****** Object:  StoredProcedure [info].[usp_fact_controltower_national_ap3]    Script Date: 12/15/2023 2:05:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE               PROCEDURE [info].[usp_fact_controltower_national_ap3]    @work_order_no varchar(50) = NULL -- 'L1577869'-- 'L1632346'--'L1645127'--L1643669'--'L1642261'-- 'L1639141'--'L1641864' -- ='L1642911'-- 'L1642261'---l1641985'  --='L1641864'--'L1638501'--'L1641864'--'L1641017'--'L1636842'  --= 'L1642891'  --'L1629949'-- 'L1622150'--'L1637130' --'L1621899'
AS 

-- exec info.usp_fact_controltower_national_ap3   'L1577869'   
 --select top 1000 * from info.fact_controltower_national_ap3  where [sample_no] LIKE 'L1577869%18'    order by   sample_no, analysis_process_code, analysis_process_code_bkcc
 --select top 1000 * from info.fact_controltower_national  where [sample_no] LIKE 'L1577869%18'    order by   sample_no, analysis_process_code, analysis_process_code_bkcc, department_no
-- select top 1000 * from info.fact_controltower_ap3 

if object_id('info.fact_controltower_national_ap3') IS NOT NULL  DROP TABLE info.fact_controltower_national_ap3


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

 SELECT  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name,
		ISNULL(  (process_status_batch_no),'') process_status_batch_no, MIN(process_status_date) process_status_date,
		 MIN(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date, MIN(ISNULL(dept_batch_date,'1900-01-01')) dept_batch_date, MIN(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date,  MIN(ISNULL(work_complete_date,'1900-01-01')) work_complete_date	
 INTO #login
 
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 1 
GROUP BY f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name , process_status_batch_no

SELECT  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MIN(process_status_date) process_status_date,
		MIN(dept_avail_date) dept_avail_date, MIN(work_inprogress_date) work_inprogress_date, MIN(work_complete_date) work_complete_date
INTO #preprep
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 1.5
GROUP BY f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name, process_status_batch_no

SELECT  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name, ISNULL(  (process_status_batch_no),'') process_status_batch_no, MIN(process_status_date) process_status_date,
		MAX(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date, MIN(ISNULL(dept_batch_date,'1900-01-01')) dept_batch_date, MIN(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date,  MIN(ISNULL(work_complete_date,'1900-01-01')) work_complete_date	
INTO #prep
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
 WHERE d.department_level= 2 
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name  ,process_status_batch_no

SELECT  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MIN(process_status_date) process_status_date,
		MAX(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date, MIN(ISNULL(dept_batch_date,'1900-01-01')) dept_batch_date, MIN(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date,  MIN(ISNULL(work_capture_date,'1900-01-01')) work_capture_date, MIN(ISNULL(work_complete_date,'1900-01-01')) work_complete_date
 INTO #analytical
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 3   
AND f.department_no = (SELECT min(department_no) FROM  info.fact_controltower_national i WHERE i.department_level= 3 AND i.sample_no = f.sample_no AND i.analysis_process_code = f.analysis_process_code AND i.analysis_process_code_bkcc = f.analysis_process_code_bkcc)
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name, process_status_batch_no 

SELECT f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MIN(process_status_date) process_status_date,
		MIN(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date,  MIN(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date, MIN(ISNULL(work_complete_date,'1900-01-01')) work_complete_date
INTO #reporting
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 4 
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name, process_status_batch_no 

SELECT  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name, ISNULL(process_status_batch_no,'') process_status_batch_no, MIN(process_status_date) process_status_date,
		MIN(ISNULL(dept_avail_date,'1900-01-01')) dept_avail_date,  MIN(ISNULL(work_inprogress_date,'1900-01-01')) work_inprogress_date, MIN(ISNULL(work_complete_date,'1900-01-01')) work_complete_date 		 
INTO #invoice
FROM info.fact_controltower_national f
INNER JOIN #sample_analysis_process a ON a.sample_no = f.sample_no AND a.analysis_process_code = f.analysis_process_code AND a.analysis_process_code_bkcc = f.analysis_process_code_bkcc
INNER JOIN mas.department_type d on d.department_no = f.department_no
WHERE d.department_level= 5
GROUP BY  f.sample_no, f.analysis_process_code, f.analysis_process_code_bkcc, d.department_no, department_short_name, process_status_batch_no 

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #login_status
FROM  #login l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
WHERE isnull(l.process_status_date,'1900-01-01') =ISNULL(f.process_status_date,'1900-01-01')
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  f.process_status_batch_no
 
SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,    f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #preprep_status
FROM  #preprep l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
WHERE isnull(l.process_status_date,'1900-01-01') =ISNULL(f.process_status_date,'1900-01-01')
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #analytical_status
FROM  #analytical l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
WHERE isnull(l.process_status_date,'1900-01-01') =ISNULL(f.process_status_date,'1900-01-01')
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #prep_status
FROM  #prep l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
WHERE isnull(l.process_status_date,'1900-01-01') =ISNULL(f.process_status_date,'1900-01-01')
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,   f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #reporting_status
FROM  #reporting l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
WHERE isnull(l.process_status_date,'1900-01-01') =ISNULL(f.process_status_date,'1900-01-01')
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  ISNULL(f.process_status_batch_no,'') process_status_batch_no
INTO #invoice_status
FROM  #invoice l
INNER JOIN info.fact_controltower_national f ON l.sample_no = f.sample_no AND l.analysis_process_code = f.analysis_process_code AND l.analysis_process_code_bkcc = f.analysis_process_code_bkcc AND l.department_no = f.department_no
WHERE isnull(l.process_status_date,'1900-01-01') =ISNULL(f.process_status_date,'1900-01-01')
GROUP BY l.sample_no, l.analysis_process_code, l.analysis_process_code_bkcc, l.department_no,  f.process_status_code,  f.process_status_batch_no

SELECT sa.[sample_no]
      ,sa.analysis_process_code [analysis_process_code]
      ,sa.analysis_process_code_bkcc [analysis_process_code_bkcc]
      ,sa.[method]
      ,sa.[holddate]
      ,sa.[internal_duedate]
      ,sa.[external_duedate]
      ,sa.[preprep_required]
      ,sa.[work_order_no]
      ,sa.[pace_account_no]
	  ,sa.lab
      ,sa.[original_invoice_date]
      ,sa.[invoicedate]
      ,l.department_no [login_department_no]
      ,l.department_short_name [login_department_short_name]
      ,l.process_status_date [login_process_status_date]
      ,ls.process_status_code [login_process_status_code]
	  ,sa.receivedate [login_dept_avail_date]
      ,NULLIF(l.work_complete_date,'1900-01-01') [login_dept_done_status_date]
      ,lp.department_no [preprep_department_no]
      ,lp.department_short_name [preprep_department_short_name]
      ,lp.process_status_date [preprep_process_status_date]
      ,lps.process_status_code [preprep_process_status_code]
	  ,NULL    [preprep_process_status_batch_no]
      ,NULLIF(lp.dept_avail_date,'1900-01-01') [preprep_dept_avail_status_date]
      ,NULLIF(lp.work_inprogress_date,'1900-01-01') [preprep_dept_batch_status_date]
      ,NULLIF(lp.work_complete_date,'1900-01-01') [preprep_dept_done_status_date]
      ,p.department_no [prep_department_no]
      ,p.department_short_name [prep_department_short_name]
      ,p.process_status_date [prep_process_status_date]
      ,ps.process_status_code [prep_process_status_code]
	  ,NULL [prep_process_status_batch_no]
      ,NULLIF(p.dept_avail_date,'1900-01-01') [prep_dept_avail_status_date]
	  ,NULLIF(p.dept_batch_date,'1900-01-01') [prep_dept_batch_status_date]
      ,NULLIF(p.work_inprogress_date,'1900-01-01') [prep_dept_inprogress_status_date]
	  ,NULLIF(p.work_complete_date,'1900-01-01') [prep_dept_done_status_date]
      --,p.attempt_count [prep_attempt_count]
      ,a.department_no [analysis_department_no]
      ,a.department_short_name [analysis_department_short_name]
      ,a.process_status_date [analysis_process_status_date]
      ,als.process_status_code [analysis_process_status_code]
	  ,als.process_status_batch_no [analysis_process_status_batch_no]
      ,NULLIF(a.dept_avail_date,'1900-01-01') [analysis_dept_avail_status_date]
	  ,NULLIF(a.dept_batch_date,'1900-01-01') [analysis_dept_batch_status_date]
      ,NULLIF(a.work_inprogress_date,'1900-01-01') [analysis_dept_inprogress_status_date]
	  ,NULLIF(a.work_capture_date,'1900-01-01') [analysis_dept_capture_status_date]
      ,NULLIF(a.work_complete_date,'1900-01-01') [analysis_dept_done_status_date]
      --,a.attempt_count [analysis_attempt_count]
	  ,''  [analysis_instrument_no]
	  --,a.analysis_location_code [analysis_location]
	  ,r.department_no [reporting_department_no]
      ,r.department_short_name [reporting_department_short_name]
      ,r.process_status_date [reporting_process_status_date]
      ,rs.process_status_code [reporting_process_status_code]
      ,NULLIF(r.work_complete_date,'1900-01-01') [reporting_dept_done_status_date]
	  ,i.department_no [invoice_department_no]
      ,i.department_short_name [invoice_department_short_name]
      ,i.process_status_date [invoice_process_status_date]
      ,iis.process_status_code [invoice_process_status_code]
      ,NULLIF(i.work_complete_date,'1900-01-01') [invoice_dept_done_status_date]
 INTO info.fact_controltower_national_ap3	  
FROM  #sample_analysis_process sa  
INNER JOIN #analytical a ON a.sample_no = sa.sample_no and a.analysis_process_code = sa.analysis_process_code and a.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
INNER JOIN #analytical_status als ON als.sample_no = a.sample_no and als.analysis_process_code = a.analysis_process_code and als.analysis_process_code_bkcc = a.analysis_process_code_bkcc and als.process_status_batch_no = a.process_status_batch_no
INNER JOIN #prep p ON p.sample_no = sa.sample_no and p.analysis_process_code = sa.analysis_process_code and p.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  and ISNULL(p.process_status_batch_no,'') = a.process_status_batch_no 
INNER JOIN #prep_status ps ON ps.sample_no = p.sample_no and ps.analysis_process_code = p.analysis_process_code and ps.analysis_process_code_bkcc = p.analysis_process_code_bkcc and  ps.process_status_batch_no = p.process_status_batch_no
LEFT OUTER JOIN #login l ON l.sample_no = sa.sample_no and l.analysis_process_code = sa.analysis_process_code and l.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  
LEFT OUTER JOIN #login_status ls ON ls.sample_no = l.sample_no and ls.analysis_process_code = l.analysis_process_code and ls.analysis_process_code_bkcc = l.analysis_process_code_bkcc and ls.process_status_batch_no = l.process_status_batch_no
LEFT OUTER JOIN #preprep lp ON lp.sample_no = sa.sample_no and lp.analysis_process_code = sa.analysis_process_code and lp.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #preprep_status lps ON lps.sample_no = lp.sample_no and lps.analysis_process_code = lp.analysis_process_code and lps.analysis_process_code_bkcc = lp.analysis_process_code_bkcc and  lps.process_status_batch_no = lp.process_status_batch_no
LEFT OUTER JOIN #reporting r ON r.sample_no = sa.sample_no and r.analysis_process_code = sa.analysis_process_code and r.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #reporting_status rs ON rs.sample_no = r.sample_no and rs.analysis_process_code = r.analysis_process_code and rs.analysis_process_code_bkcc = r.analysis_process_code_bkcc and  rs.process_status_batch_no = r.process_status_batch_no
LEFT OUTER JOIN #invoice i  ON i.sample_no = sa.sample_no and i.analysis_process_code = sa.analysis_process_code and i.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #invoice_status iis  ON iis.sample_no = i.sample_no and iis.analysis_process_code = i.analysis_process_code and iis.analysis_process_code_bkcc = i.analysis_process_code_bkcc and  iis.process_status_batch_no = i.process_status_batch_no
WHERE 1=2


INSERT info.fact_controltower_national_ap3	
SELECT sa.[sample_no]
      ,sa.analysis_process_code [analysis_process_code]
      ,sa.analysis_process_code_bkcc [analysis_process_code_bkcc]
      ,sa.[method]
      ,sa.[holddate]
      ,sa.[internal_duedate]
      ,sa.[external_duedate]
      ,sa.[preprep_required]
      ,sa.[work_order_no]
      ,sa.[pace_account_no]
	  ,sa.lab
      ,sa.[original_invoice_date]
      ,sa.[invoicedate]
      ,l.department_no [login_department_no]
      ,l.department_short_name [login_department_short_name]
      ,l.process_status_date [login_process_status_date]
      ,ls.process_status_code [login_process_status_code]
	  ,sa.receivedate [login_dept_avail_date]
      ,NULLIF(l.work_complete_date,'1900-01-01') [login_dept_done_status_date]
      ,lp.department_no [preprep_department_no]
      ,lp.department_short_name [preprep_department_short_name]
      ,lp.process_status_date [preprep_process_status_date]
      ,lps.process_status_code [preprep_process_status_code]
	  ,lps.process_status_batch_no  [preprep_process_status_batch_no]
      ,NULLIF(lp.dept_avail_date,'1900-01-01') [preprep_dept_avail_status_date]
      ,NULLIF(lp.work_inprogress_date,'1900-01-01') [preprep_dept_batch_status_date]
      ,NULLIF(lp.work_complete_date,'1900-01-01') [preprep_dept_done_status_date]
      ,p.department_no [prep_department_no]
      ,p.department_short_name [prep_department_short_name]
      ,p.process_status_date [prep_process_status_date]
      ,ps.process_status_code [prep_process_status_code]
	  ,ps.process_status_batch_no [prep_process_status_batch_no]
      ,NULLIF(p.dept_avail_date,'1900-01-01') [prep_dept_avail_status_date]
	  ,NULLIF(p.dept_batch_date,'1900-01-01') [prep_dept_batch_status_date]
      ,NULLIF(p.work_inprogress_date,'1900-01-01') [prep_dept_inprogress_status_date]
	  ,NULLIF(p.work_complete_date,'1900-01-01') [prep_dept_done_status_date]
      --,p.attempt_count [prep_attempt_count]
      ,a.department_no [analysis_department_no]
      ,a.department_short_name [analysis_department_short_name]
      ,a.process_status_date [analysis_process_status_date]
      ,als.process_status_code [analysis_process_status_code]
	  ,als.process_status_batch_no [analysis_process_status_batch_no]
      ,NULLIF(a.dept_avail_date,'1900-01-01') [analysis_dept_avail_status_date]
	  ,NULLIF(a.dept_batch_date,'1900-01-01') [analysis_dept_batch_status_date]
      ,NULLIF(a.work_inprogress_date,'1900-01-01') [analysis_dept_inprogress_status_date]
	  ,NULLIF(a.work_capture_date,'1900-01-01') [analysis_dept_capture_status_date]
      ,NULLIF(a.work_complete_date,'1900-01-01') [analysis_dept_done_status_date]
      --,a.attempt_count [analysis_attempt_count]
	  ,''   [analysis_instrument_no]
	  --,a.analysis_location_code [analysis_location]
	  ,r.department_no [reporting_department_no]
      ,r.department_short_name [reporting_department_short_name]
      ,r.process_status_date [reporting_process_status_date]
      ,rs.process_status_code [reporting_process_status_code]
      ,NULLIF(r.work_complete_date,'1900-01-01') [reporting_dept_done_status_date]
	  ,i.department_no [invoice_department_no]
      ,i.department_short_name [invoice_department_short_name]
      ,i.process_status_date [invoice_process_status_date]
      ,iis.process_status_code [invoice_process_status_code]
      ,NULLIF(i.work_complete_date,'1900-01-01') [invoice_dept_done_status_date]
FROM  #sample_analysis_process sa  
INNER JOIN #analytical a ON a.sample_no = sa.sample_no and a.analysis_process_code = sa.analysis_process_code and a.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
INNER JOIN #analytical_status als ON als.sample_no = a.sample_no and als.analysis_process_code = a.analysis_process_code and als.analysis_process_code_bkcc = a.analysis_process_code_bkcc and als.process_status_batch_no = a.process_status_batch_no
INNER JOIN #prep p ON p.sample_no = sa.sample_no and p.analysis_process_code = sa.analysis_process_code and p.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  and ISNULL(p.process_status_batch_no,'') = a.process_status_batch_no 
INNER JOIN #prep_status ps ON ps.sample_no = p.sample_no and ps.analysis_process_code = p.analysis_process_code and ps.analysis_process_code_bkcc = p.analysis_process_code_bkcc and  ps.process_status_batch_no = p.process_status_batch_no
LEFT OUTER JOIN #login l ON l.sample_no = sa.sample_no and l.analysis_process_code = sa.analysis_process_code and l.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  
LEFT OUTER JOIN #login_status ls ON ls.sample_no = l.sample_no and ls.analysis_process_code = l.analysis_process_code and ls.analysis_process_code_bkcc = l.analysis_process_code_bkcc and ls.process_status_batch_no = l.process_status_batch_no
LEFT OUTER JOIN #preprep lp ON lp.sample_no = sa.sample_no and lp.analysis_process_code = sa.analysis_process_code and lp.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #preprep_status lps ON lps.sample_no = lp.sample_no and lps.analysis_process_code = lp.analysis_process_code and lps.analysis_process_code_bkcc = lp.analysis_process_code_bkcc and  lps.process_status_batch_no = lp.process_status_batch_no
LEFT OUTER JOIN #reporting r ON r.sample_no = sa.sample_no and r.analysis_process_code = sa.analysis_process_code and r.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #reporting_status rs ON rs.sample_no = r.sample_no and rs.analysis_process_code = r.analysis_process_code and rs.analysis_process_code_bkcc = r.analysis_process_code_bkcc and  rs.process_status_batch_no = r.process_status_batch_no
LEFT OUTER JOIN #invoice i  ON i.sample_no = sa.sample_no and i.analysis_process_code = sa.analysis_process_code and i.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #invoice_status iis  ON iis.sample_no = i.sample_no and iis.analysis_process_code = i.analysis_process_code and iis.analysis_process_code_bkcc = i.analysis_process_code_bkcc and  iis.process_status_batch_no = i.process_status_batch_no

INSERT info.fact_controltower_national_ap3	
SELECT sa.[sample_no]
      ,sa.analysis_process_code [analysis_process_code]
      ,sa.analysis_process_code_bkcc [analysis_process_code_bkcc]
      ,sa.[method]
      ,sa.[holddate]
      ,sa.[internal_duedate]
      ,sa.[external_duedate]
      ,sa.[preprep_required]
      ,sa.[work_order_no]
      ,sa.[pace_account_no]
	  ,sa.lab
      ,sa.[original_invoice_date]
      ,sa.[invoicedate]
      ,l.department_no [login_department_no]
      ,l.department_short_name [login_department_short_name]
      ,l.process_status_date [login_process_status_date]
      ,ls.process_status_code [login_process_status_code]
	  ,sa.receivedate [login_dept_avail_date]
      ,NULLIF(l.work_complete_date,'1900-01-01') [login_dept_done_status_date]
      ,lp.department_no [preprep_department_no]
      ,lp.department_short_name [preprep_department_short_name]
      ,lp.process_status_date [preprep_process_status_date]
      ,lps.process_status_code [preprep_process_status_code]
	  ,NULL  [preprep_process_status_batch_no]
      ,NULLIF(lp.dept_avail_date,'1900-01-01') [preprep_dept_avail_status_date]
      ,NULLIF(lp.work_inprogress_date,'1900-01-01') [preprep_dept_batch_status_date]
      ,NULLIF(lp.work_complete_date,'1900-01-01') [preprep_dept_done_status_date]
      ,p.department_no [prep_department_no]
      ,p.department_short_name [prep_department_short_name]
      ,p.process_status_date [prep_process_status_date]
      ,ps.process_status_code [prep_process_status_code]
	  ,ps.process_status_batch_no [prep_process_status_batch_no]
      ,NULLIF(p.dept_avail_date,'1900-01-01') [prep_dept_avail_status_date]
	  ,NULLIF(p.dept_batch_date,'1900-01-01') [prep_dept_batch_status_date]
      ,NULLIF(p.work_inprogress_date,'1900-01-01') [prep_dept_inprogress_status_date]
	  ,NULLIF(p.work_complete_date,'1900-01-01') [prep_dept_done_status_date]
      --,p.attempt_count [prep_attempt_count]
      ,a.department_no [analysis_department_no]
      ,a.department_short_name [analysis_department_short_name]
      ,a.process_status_date [analysis_process_status_date]
      ,als.process_status_code [analysis_process_status_code]
	  ,als.process_status_batch_no [analysis_process_status_batch_no]
      ,NULLIF(a.dept_avail_date,'1900-01-01') [analysis_dept_avail_status_date]
	  ,NULLIF(a.dept_batch_date,'1900-01-01') [analysis_dept_batch_status_date]
      ,NULLIF(a.work_inprogress_date,'1900-01-01') [analysis_dept_inprogress_status_date]
	  ,NULLIF(a.work_capture_date,'1900-01-01') [analysis_dept_capture_status_date]
      ,NULLIF(a.work_complete_date,'1900-01-01') [analysis_dept_done_status_date]
      --,a.attempt_count [analysis_attempt_count]
	  ,'' [analysis_instrument_no]
	  --,a.analysis_location_code [analysis_location]
	  ,r.department_no [reporting_department_no]
      ,r.department_short_name [reporting_department_short_name]
      ,r.process_status_date [reporting_process_status_date]
      ,rs.process_status_code [reporting_process_status_code]
      ,NULLIF(r.work_complete_date,'1900-01-01') [reporting_dept_done_status_date]
	  ,i.department_no [invoice_department_no]
      ,i.department_short_name [invoice_department_short_name]
      ,i.process_status_date [invoice_process_status_date]
      ,iis.process_status_code [invoice_process_status_code]
      ,NULLIF(i.work_complete_date,'1900-01-01') [invoice_dept_done_status_date]
FROM  #sample_analysis_process sa  
LEFT OUTER JOIN #login l ON l.sample_no = sa.sample_no and l.analysis_process_code = sa.analysis_process_code and l.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  
LEFT OUTER JOIN #login_status ls ON ls.sample_no = l.sample_no and ls.analysis_process_code = l.analysis_process_code and ls.analysis_process_code_bkcc = l.analysis_process_code_bkcc and ls.process_status_batch_no = l.process_status_batch_no
LEFT OUTER JOIN #preprep lp ON lp.sample_no = sa.sample_no and lp.analysis_process_code = sa.analysis_process_code and lp.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #preprep_status lps ON lps.sample_no = lp.sample_no and lps.analysis_process_code = lp.analysis_process_code and lps.analysis_process_code_bkcc = lp.analysis_process_code_bkcc and  lps.process_status_batch_no = lp.process_status_batch_no
LEFT OUTER JOIN #analytical a ON a.sample_no = sa.sample_no and a.analysis_process_code = sa.analysis_process_code and a.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #analytical_status als ON als.sample_no = a.sample_no and als.analysis_process_code = a.analysis_process_code and als.analysis_process_code_bkcc = a.analysis_process_code_bkcc and als.process_status_batch_no = a.process_status_batch_no
LEFT OUTER JOIN #prep p ON p.sample_no = sa.sample_no and p.analysis_process_code = sa.analysis_process_code and p.analysis_process_code_bkcc = sa.analysis_process_code_bkcc  
LEFT OUTER JOIN #prep_status ps ON ps.sample_no = p.sample_no and ps.analysis_process_code = p.analysis_process_code and ps.analysis_process_code_bkcc = p.analysis_process_code_bkcc and  ps.process_status_batch_no = p.process_status_batch_no
LEFT OUTER JOIN #reporting r ON r.sample_no = sa.sample_no and r.analysis_process_code = sa.analysis_process_code and r.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #reporting_status rs ON rs.sample_no = r.sample_no and rs.analysis_process_code = r.analysis_process_code and rs.analysis_process_code_bkcc = r.analysis_process_code_bkcc and  rs.process_status_batch_no = r.process_status_batch_no
LEFT OUTER JOIN #invoice i  ON i.sample_no = sa.sample_no and i.analysis_process_code = sa.analysis_process_code and i.analysis_process_code_bkcc = sa.analysis_process_code_bkcc
LEFT OUTER JOIN #invoice_status iis  ON iis.sample_no = i.sample_no and iis.analysis_process_code = i.analysis_process_code and iis.analysis_process_code_bkcc = i.analysis_process_code_bkcc and  iis.process_status_batch_no = i.process_status_batch_no
WHERE NOT EXISTS(
SELECT 1 FROM info.fact_controltower_national_ap2 f WHERE f.sample_no = sa.sample_no and f.analysis_process_code = sa.analysis_process_code AND f.prep_process_status_batch_no  = ps.process_status_batch_no )



 RETURN
GO
