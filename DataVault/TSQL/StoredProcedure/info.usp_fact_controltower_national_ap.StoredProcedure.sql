/****** Object:  StoredProcedure [info].[usp_fact_controltower_national_ap]    Script Date: 2/5/2024 10:41:23 AM ******/
DROP PROCEDURE [info].[usp_fact_controltower_national_ap]
GO
/****** Object:  StoredProcedure [info].[usp_fact_controltower_national_ap]    Script Date: 2/5/2024 10:41:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [info].[usp_fact_controltower_national_ap]    @work_order_no varchar(50) = NULL -- 'L1577869'-- 'L1632346'--'L1645127'--L1643669'--'L1642261'-- 'L1639141'--'L1641864' -- ='L1642911'-- 'L1642261'---l1641985'  --='L1641864'--'L1638501'--'L1641864'--'L1641017'--'L1636842'  --= 'L1642891'  --'L1629949'-- 'L1622150'--'L1637130' --'L1621899'

AS 

-- exec info.usp_fact_controltower_national_ap   'L1577869'   
-- select top 1000 * from info.fact_controltower_national_ap where [sample nbr] LIKE 'L1598546-26'  and product like 'GROCA%'  order by  [Sample Nbr], Analysis,   CAST([Department id] as int) 
-- select top 1000 * from info.fact_controltower_ap 

if object_id('info.fact_controltower_national_ap') IS NOT NULL  DROP TABLE info.fact_controltower_national_ap
 
  
SELECT hk_h_sample, hk_h_analysis_process, b .hk_h_work_order, hk_h_pace_account, hk_h_invoice, MAX(method) method,
		CAST(NULL AS DATE) first_review_complete, CAST(NULL AS DATE) second_review_complete, CAST(NULL AS DATE) preprep_complete, CAST(NULL AS DATE) prep_complete
INTO #sample_analysis_process
FROM bus.bridge_controltower_national b
INNER JOIN bus.s_product_mroc_national_current s on s.hk_h_product = b.hk_h_product
INNER JOIN raw.l_analysis_process_product llink ON llink.hk_h_product = b.hk_h_product  
INNER JOIN raw.l_customer_workorder c ON c.hk_h_work_order = b.hk_h_work_order
INNER JOIN raw.l_customer_paceaccount a ON a.hk_h_customer = c.hk_h_customer
INNER JOIN raw.l_test_invoice i on i.hk_h_test = b.hk_h_test 
WHERE hk_h_analysis_process is not null 
AND product_code_bkcc!= '11' 
AND ISNULL(@work_order_no, work_order_no) = b.work_order_no
GROUP BY  hk_h_sample,  hk_h_analysis_process, b.hk_h_work_order, hk_h_pace_account, hk_h_invoice
 
SELECT #sample_analysis_process.hk_h_sample, #sample_analysis_process.hk_h_analysis_process, hk_h_department,  
		MAX(process_status_date) process_status_date, CAST(NULL AS INT) attempt_count
INTO #sample_analysis_process_department
from #sample_analysis_process 
INNER JOIN raw.h_sample ON h_sample.hk_h_sample = #sample_analysis_process.hk_h_sample
INNER JOIN raw.l_analysis_process_product ON l_analysis_process_product.hk_h_analysis_process =  #sample_analysis_process .hk_h_analysis_process
INNER JOIN raw.l_test_product on l_test_product.hk_h_product = l_analysis_process_product.hk_h_product
INNER JOIN raw.l_department_test_schedule on l_department_test_schedule.hk_h_test = l_test_product.hk_h_test
INNER JOIN bus.s_department_test_schedule_hroc_national_current s on s.hk_l_department_test_schedule = l_department_test_schedule.hk_l_department_test_schedule
GROUP BY #sample_analysis_process.hk_h_sample, #sample_analysis_process.hk_h_analysis_process, hk_h_department

SELECT t.hk_h_sample, t.hk_h_analysis_process, t.hk_h_department,  ls.process_status_code, ls.process_status_date, s.process_status_batch_no
INTO #sample_analysis_process_department_status
FROM #sample_analysis_process_department t
INNER JOIN raw.l_analysis_process_product l on l.hk_h_analysis_process = t.hk_h_analysis_process
join raw.l_test_product on l_test_product.hk_h_product =l.hk_h_product
join raw.l_test_sample on l_test_sample.hk_h_test = l_test_product.hk_h_test and l_test_sample.hk_h_sample = t.hk_h_sample
left JOIN raw.l_department_test_status ls ON ls.hk_h_test = l_test_product.hk_h_test and ls.hk_h_department = t.hk_h_department
left JOIN bus.s_department_test_status_tran_national_current s ON s.hk_l_department_test_status = ls.hk_l_department_test_status
GROUP BY t.hk_h_sample, t.hk_h_analysis_process, t.hk_h_department, ls.process_status_code, ls.process_status_date, s.process_status_batch_no

SELECT * 
INTO #temppvtmindates
FROM (
SELECT hk_h_sample, hk_h_analysis_process, hk_h_department, process_status_code, process_status_date 
FROM #sample_analysis_process_department_status) t
PIVOT(MIN(process_status_date)
FOR process_status_code IN (CAPT,DONE,EMAL,FIX,HERE,HOLD,IREV,NEED,RECP,REDO,SUB,WAIT,WG,WIP)) AS pvt  -- 1,117,570   00:17
CREATE INDEX #temppvtmindates_IDX1 on #temppvtmindates(hk_h_sample, hk_h_analysis_process)   -- 02:19 1164276

SELECT * 
INTO #temppvtmaxdates
FROM (
SELECT hk_h_sample, hk_h_analysis_process, hk_h_department, process_status_code, process_status_date
FROM #sample_analysis_process_department_status) t
PIVOT(MAX(process_status_date)
FOR process_status_code IN (CAPT,DONE,EMAL,FIX,HERE,HOLD,IREV,NEED,RECP,REDO,SUB,WAIT,WG,WIP)) AS pvt    ---- 02:19 1164276
CREATE INDEX #temppvtmaxdates_IDX1 on #temppvtmaxdates(hk_h_sample, hk_h_analysis_process, hk_h_department) 

SELECT hk_h_sample, hk_h_analysis_process, hk_h_department, MIN(process_status_date) avail_status_date 
INTO #tempavaildates
FROM #sample_analysis_process_department_status
WHERE process_status_code != 'NEED'
GROUP BY hk_h_sample, hk_h_analysis_process, hk_h_department  --02:08 1163619
CREATE INDEX #tempavaildates_IDX1 on #tempavaildates(hk_h_sample, hk_h_analysis_process, hk_h_department)
 
SELECT hk_h_sample, hk_h_analysis_process, hk_h_department, MIN(process_status_date) progress_status_date--, MAX(worknum) progressworknum
INTO #tempprogressdates
FROM #sample_analysis_process_department_status
WHERE process_status_code NOT IN ('HERE','NEED')
GROUP BY hk_h_sample, hk_h_analysis_process, hk_h_department  -- 01:59  1163618

SELECT hk_h_sample, hk_h_analysis_process, hk_h_department, MIN(process_status_date) done_status_date--, MAX(worknum) progressworknum
INTO #tempdonedates
FROM #sample_analysis_process_department_status
WHERE process_status_code ='DONE'
GROUP BY hk_h_sample, hk_h_analysis_process, hk_h_department  -- 01:59  1163618

SELECT t.hk_h_sample, 
         t.hk_h_analysis_process, 
        MIN(s.receivedate) received_date,
	    MAX(ts.holddate) expiration_date, 
	    MIN(s.duedate) internal_due_date, 
	    MAX(s.duedate2) external_due_date 
 INTO #temptestagg 
 FROM #sample_analysis_process_department_status t
INNER JOIN raw.l_analysis_process_product l on l.hk_h_analysis_process = t.hk_h_analysis_process
INNER JOIN raw.l_test_sample ON l_test_sample.hk_h_sample = t.hk_h_sample
INNER JOIN bus.s_sample_mroc_national_current s on s.hk_h_sample = t.hk_h_sample
INNER JOIN bus.s_test_hroc_national_current ts on ts.hk_h_test = l_test_sample.hk_h_test
GROUP BY t.hk_h_sample, t.hk_h_analysis_process
CREATE INDEX #tmp_testagg on #temptestagg(hk_h_sample, hk_h_analysis_process)  -- 00:32 249758

SELECT hk_h_sample, hk_h_analysis_process, hk_h_department 
INTO #tmp_test_department_current
FROM (
SELECT hk_h_sample, hk_h_analysis_process, hk_h_department , process_status_date 
		,row_number() OVER (PARTITION BY  a.hk_h_sample, a.hk_h_analysis_process ORDER BY process_status_date DESC) rownum
FROM #sample_analysis_process_department_status a ) a
WHERE rownum = 1

SELECT process_status_code,
        CASE process_status_code
		     WHEN 'DONE' THEN 1
		     WHEN 'CAPT' THEN 2
		     WHEN 'WG' THEN 4 
			 WHEN 'WIP' Then 3
			 WHEN 'SUB' THEN 6
			 WHEN 'REDO' THEN 7
			 WHEN 'NEED' THEN 10
			 WHEN 'WAIT' THEN 9
			 WHEN 'HERE' THEN 8
			 WHEN 'HOLD' THEN 11
			 ELSE 12 END batch_status_rank 
INTO #batch_status
FROM raw.l_department_test_status
GROUP BY process_status_code 
CREATE UNIQUE INDEX #batch_status_IDX1 on #batch_status(process_status_code)  

SELECT hk_h_sample,  hk_h_analysis_process, hk_h_department,  process_status_date,  a.process_status_code, tie  , lowstep  , batch_status_rank
INTO #tmpdeptstatus
FROM (
SELECT a.hk_h_sample, a.hk_h_analysis_process,  a.process_status_date,  a.process_status_code, a.hk_h_department   , batch_status_rank
    ,rank() OVER (PARTITION BY a.hk_h_sample, a.hk_h_analysis_process, a.hk_h_department, a.process_status_date ORDER BY batch_status_rank) tie
	,rank()  OVER (PARTITION BY a.hk_h_sample, a.hk_h_analysis_process, a.hk_h_department ORDER BY batch_status_rank desc, process_status_date) lowstep
FROM #sample_analysis_process_department_status a 
INNER JOIN #batch_status ON #batch_status.process_status_code = a.process_status_code
INNER JOIN raw.h_department on h_department.hk_h_department = a.hk_h_department )a
WHERE tie= 1 and lowstep = 1

SELECT a.hk_h_analysis_process
INTO #temppreprep
FROM ref.r_seedpak_mm_prodmatlist mpml 
INNER JOIN ref.r_seedpak_mm_header mh on mh.methodid = mpml.methodid
INNER JOIN raw.h_product p on p.product_code = mpml.prod and p.product_code_bkcc = mpml.matnum
INNER JOIN raw.l_analysis_process_product l ON l.hk_h_product =  p.hk_h_product
INNER JOIN raw.h_analysis_process on h_analysis_process.hk_h_analysis_process = l.hk_h_analysis_process
INNER JOIN #sample_analysis_process a ON a.hk_h_analysis_process = l.hk_h_analysis_process
INNER JOIN bus.s_product_mroc_national_current s on s.hk_h_product = p.hk_h_product
WHERE mh.active = 'Y' and mh.method_type = 'P' and mh.esc_method_name like 'PrePrep%'
GROUP BY a.hk_h_analysis_process  --283  01:21

;WITH analysis_process_attempt AS (
SELECT t.hk_h_sample, t.hk_h_analysis_process, s.hk_h_department, process_occurence_no
FROM #sample_analysis_process t
INNER JOIN raw.l_test_sample ts on ts.hk_h_sample = t.hk_h_sample
INNER JOIN raw.l_department_test_schedule s on s.hk_h_test = ts.hk_h_test  
INNER JOIN raw.l_department_instrument_run i on i.hk_h_sample = ts.hk_h_sample and i.hk_h_department = s.hk_h_department )

UPDATE #sample_analysis_process_department
SET attempt_count= (SELECT count(*)
					FROM analysis_process_attempt a 
					WHERE a.hk_h_analysis_process = #sample_analysis_process_department.hk_h_analysis_process
					  AND  a.hk_h_department = #sample_analysis_process_department.hk_h_department)

UPDATE #sample_analysis_process
SET first_review_complete = 
			(SELECT MAX(i.DONE) FROM #temppvtmaxdates i 
			  INNER JOIN raw.h_department on h_department.hk_h_department = i.hk_h_department
			  INNER JOIN mas.department_type it ON it.department_no = h_department.department_no 
			   WHERE i.hk_h_analysis_process = #sample_analysis_process.hk_h_analysis_process and it.department_level = 3)  

UPDATE #sample_analysis_process
SET second_review_complete = 
			(SELECT  MAX(i.DONE) FROM #temppvtmaxdates i 
			  INNER JOIN raw.h_department on h_department.hk_h_department = i.hk_h_department
			  INNER JOIN mas.department_type it ON it.department_no = h_department.department_no 
			  WHERE i.hk_h_analysis_process = #sample_analysis_process.hk_h_analysis_process and it.department_level = 9)  

UPDATE #sample_analysis_process
SET preprep_complete = 
			(SELECT  MAX(i.DONE) FROM #temppvtmaxdates i 
			    INNER JOIN raw.h_department on h_department.hk_h_department = i.hk_h_department
				INNER JOIN mas.department_type dt on dt.department_no = h_department.department_no
				INNER JOIN raw.h_analysis_process ON h_analysis_process.hk_h_analysis_process = i.hk_h_analysis_process
				INNER JOIN #temppreprep t on t.hk_h_analysis_process = h_analysis_process.hk_h_analysis_process
				WHERE dt.department_level = 1 AND h_analysis_process.analysis_process_code_bkcc like 'TCLP')			
 
UPDATE #sample_analysis_process
SET prep_complete = 
			(SELECT MAX(i.DONE) FROM #temppvtmaxdates i
			    INNER JOIN raw.h_department on h_department.hk_h_department = i.hk_h_department
				INNER JOIN mas.department_type t on t.department_no =h_department.department_no 
				WHERE i.hk_h_analysis_process = #sample_analysis_process.hk_h_analysis_process AND t.department_level = 2 )

SELECT  ad.hk_h_sample, ad.hk_h_analysis_process, ad.hk_h_department, d.department_no, department_short_name,  attempt_count, department_type,department_level, s.process_status_date, process_status_code, avail_status_date, progress_status_date, done_status_date
INTO #deptstatusdata
FROM #sample_analysis_process_department ad 
INNER JOIN raw.h_department d on d.hk_h_department = ad.hk_h_department
INNER JOIN mas.department_type dt on dt.department_no = d.department_no
INNER JOIN raw.h_sample on h_sample.hk_h_sample = ad.hk_h_sample
INNER JOIN raw.h_analysis_process on h_analysis_process.hk_h_analysis_process = ad.hk_h_analysis_process
LEFT  JOIN #tmpdeptstatus s on s.hk_h_sample = ad.hk_h_sample and s.hk_h_analysis_process = ad.hk_h_analysis_process and s.hk_h_department = ad.hk_h_department
LEFT JOIN #tempavaildates a on a.hk_h_sample = ad.hk_h_sample and a.hk_h_analysis_process = ad.hk_h_analysis_process  and a.hk_h_department = ad.hk_h_department
LEFT JOIN #tempprogressdates p on p.hk_h_sample = ad.hk_h_sample and p.hk_h_analysis_process = ad.hk_h_analysis_process  and p.hk_h_department = ad.hk_h_department
LEFT JOIN #tempdonedates dd on dd.hk_h_sample = ad.hk_h_sample and dd.hk_h_analysis_process = ad.hk_h_analysis_process  and dd.hk_h_department = ad.hk_h_department
				
SELECT  h_sample.sample_no,
		h_analysis_process.analysis_process_code, h_analysis_process.analysis_process_code_bkcc,
		method,  
		received_date, expiration_date holddate,	
		DATEADD(day, ISNULL(g.due_date_correction,0), internal_due_date) internal_duedate,
	    DATEADD(day, ISNULL(g.due_date_correction,0), external_due_date) external_duedate, 
		CASE WHEN preprep.hk_h_analysis_process IS NULL THEN 'N' ELSE 'Y' END as preprep_required,
		first_review_complete,	
		second_review_complete,
		h_work_order.work_order_no,
		h_pace_account.pace_account_no,
		original_invoice_date, 
		invoicedate,
		h_department.department_no  current_department_no,

		sd1.department_no login_department_no,
		sd1.department_short_name login_department_short_name,
		sd1.process_status_code login_process_status_code,
		sd1.process_status_date login_process_status_date,
		sd1.avail_status_date login_avail_status_date,
		sd1.progress_status_date login_progress_status_date,
		sd1.done_status_date login_dept_done_status_date,
		sd1.attempt_count login_attempt_count,
		
		sd2.department_no prep_department_no,
		sd2.department_short_name prep_department_short_name,
		sd2.process_status_code prep_process_status_code,
		sd2.process_status_date prep_process_status_date,
		sd2.avail_status_date prep_avail_status_date,
		sd2.progress_status_date prep_progress_status_date,
		sd2.done_status_date prep_dept_done_status_date,
		sd2.attempt_count prep_attempt_count,

		sd3.department_no analysis_department_no,
		sd3.department_short_name analysis_department_short_name,
		sd3.process_status_code analysis_process_status_code,
		sd3.process_status_date analysis_process_status_date,
		sd3.avail_status_date analysis_avail_status_date,
		sd3.progress_status_date analysis_progress_status_date,
		sd3.done_status_date analysis_dept_done_status_date,
		sd3.attempt_count analysis_attempt_count,

		sd4.department_no reporting_department_no,
		sd4.department_short_name reporting_department_short_name,
		sd4.process_status_code reporting_process_status_code,
		sd4.process_status_date reporting_process_status_date,
		sd4.avail_status_date reporting_avail_status_date,
		sd4.progress_status_date reporting_progress_status_date,
		sd4.done_status_date reporting_dept_done_status_date,
		sd4.attempt_count reporting_attempt_count,

		sd5.department_no invoice_department_no,
		sd5.department_short_name invoice_department_short_name,
		sd5.process_status_code invoice_process_status_code,
		sd5.process_status_date invoice_process_status_date,
		sd5.avail_status_date invoice_avail_status_date,
		sd5.progress_status_date invoice_progress_status_date,
		sd5.done_status_date invoice_dept_done_status_date,
		sd5.attempt_count invoice_attempt_count 
 
INTO info.fact_controltower_national_ap 
FROM #sample_analysis_process test_grain
INNER JOIN raw.h_sample on h_sample.hk_h_sample = test_grain.hk_h_sample
INNER JOIN raw.h_analysis_process ON h_analysis_process.hk_h_analysis_process = test_grain.hk_h_analysis_process 
INNER JOIN raw.h_work_order ON h_work_order.hk_h_work_order = test_grain.hk_h_work_order
INNER JOIN raw.h_pace_account ON h_pace_account.hk_h_pace_account = test_grain.hk_h_pace_account
LEFT JOIN raw.h_invoice ON h_invoice.hk_h_invoice = test_grain.hk_h_invoice
LEFT JOIN #tmp_test_department_current cdept ON cdept.hk_h_analysis_process = h_analysis_process.hk_h_analysis_process AND cdept.hk_h_sample = h_sample.hk_h_sample
LEFT JOIN raw.h_department on h_department.hk_h_department = cdept.hk_h_department
LEFT JOIN #temptestagg test_data ON test_data.hk_h_analysis_process = h_analysis_process.hk_h_analysis_process AND test_data.hk_h_sample = h_sample.hk_h_sample
LEFT JOIN #temppreprep preprep on preprep.hk_h_analysis_process = test_grain.hk_h_analysis_process 
LEFT JOIN mas.lab_reporting_group g ON g.list_type = h_analysis_process.analysis_process_code AND g.list_matclass = h_analysis_process.analysis_process_code_bkcc
LEFT JOIN bus.s_department_lroc_national_current s on s.hk_h_department = h_department.hk_h_department
LEFT JOIN bus.s_invoice_mroc_national_current si ON si.hk_h_invoice = test_grain.hk_h_invoice
LEFT JOIN #deptstatusdata sd1 ON sd1.hk_h_sample = test_grain.hk_h_sample and sd1.hk_h_analysis_process = test_grain.hk_h_analysis_process and sd1.department_level = 1
LEFT JOIN #deptstatusdata sd2 ON sd2.hk_h_sample = test_grain.hk_h_sample and sd2.hk_h_analysis_process = test_grain.hk_h_analysis_process and sd2.department_level = 2
LEFT JOIN #deptstatusdata sd3 ON sd3.hk_h_sample = test_grain.hk_h_sample and sd3.hk_h_analysis_process = test_grain.hk_h_analysis_process and sd3.department_level = 3
LEFT JOIN #deptstatusdata sd4 ON sd4.hk_h_sample = test_grain.hk_h_sample and sd4.hk_h_analysis_process = test_grain.hk_h_analysis_process and sd4.department_level = 4
LEFT JOIN #deptstatusdata sd5 ON sd5.hk_h_sample = test_grain.hk_h_sample and sd5.hk_h_analysis_process = test_grain.hk_h_analysis_process and sd5.department_level = 5


RETURN

GO
