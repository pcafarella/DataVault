 
CREATE OR ALTER VIEW [info].[fact_controltower_ap3_compare_v] AS   

--select top 100 * from [info].[fact_controltower_ap3_compare_v] where  [Sample Nbr] =   'L1694291-04'  

SELECT work_order_no [Work Order Nbr]
      ,sample_no [Sample Nbr]
      ,pace_account_no [Customer Nbr]
	  ,LEFT(pace_account_no, 2) Lab
      ,analysis_process_code + ' ' + analysis_process_code_bkcc [Analysis Process]
      ,method [Method]
      ,analysis_process_code_bkcc Matrix

      ,CAST(holddate AS DATE) [Hold Date]
      ,CAST(internal_duedate AS DATE) [Internal Due Date]
      ,CASE WHEN CAST(analysis_dept_capture_status_date AS DATE) <= CAST(internal_duedate AS DATE) THEN 'Y' ELSE 'N' END [Met Int Due Date Flag]
	  ,CAST(external_duedate AS DATE) [External Due Date]
      ,CASE WHEN CAST(analysis_dept_done_status_date AS DATE) <= CAST(external_duedate AS DATE) THEN 'Y' ELSE 'N' END [Met Ext Due Date Flag]  
 
      ,CAST(original_invoice_date AS DATE) [Original Invoice Date]
      ,CAST(Invoicedate  AS DATE) [Delivered Date]

	  ,login_department_no [Login Dept Nbr]
	  ,login_department_short_name [Login Dept Abbrev]
 
	  ,login_process_status_code [Login Dept Lims Status] 
	  ,login_process_status_date [Login Dept Lims Status Date]
  	  ,login_dept_avail_date [Login Dept Received Date] 
	  ,login_dept_done_status_date [Login Dept Logged In Date] 

  	  ,preprep_department_no [PrePrep Dept Nbr]
	  ,preprep_department_short_name [PrePrep Dept Abbrev] 
	  ,preprep_process_status_batch_no [PrePrep Dept Batch Nbr]
	  ,preprep_process_status_code [PrePrep Dept Lims Status]
	  ,preprep_process_status_date [PrePrep Dept Lims Status Date]
	  ,preprep_dept_avail_status_date [PrePrep Available] 
	  ,preprep_dept_batch_status_date [PrePrep Batched] 
	  ,preprep_dept_done_status_date [PrePrep Complete] 
	 	
  	  ,prep_department_no [Prep Dept Nbr]
	  ,prep_department_short_name [Prep Dept Abbrev] 
	  ,prep_process_status_batch_no [Prep Dept Batch Nbr]
	  ,prep_process_status_code [Prep Dept Lims Status]
	  ,prep_process_status_date [Prep Dept Lims Status Date]
	  ,prep_dept_avail_status_date [Prep Available] 
	  ,prep_dept_batch_status_date [Prep Batched] 
	  ,prep_dept_inprogress_status_date [Prep Benchwork Started] 
	  ,prep_dept_done_status_date [Prep Complete] 

	  ,analysis_department_no [Analysis Dept Nbr] 
	  ,analysis_department_short_name [Analysis Dept Abbrev]
	  ,analysis_process_status_batch_no [Analysis Dept Batch Nbr]
	  ,analysis_process_status_code [Analysis Dept Lims Status]
	  ,analysis_process_status_date [Analysis Dept Lims Status Date]
	  ,analysis_dept_avail_status_date [Analysis Available]
	  ,analysis_dept_batch_status_date [Analysis Batched] 
	  ,analysis_dept_inprogress_status_date [Analysis Started]
	  ,analysis_dept_capture_status_date [First Review Complete]
	  ,analysis_dept_done_status_date [Second Review Complete]
	  ,'' [Analysis Instrument]
	  ,'' [Location]
	  ,CASE WHEN batch_no_cnt = 0 THEN 1 ELSE batch_no_cnt END [Analysis Dept Attempt Count]

	  ,reporting_department_no [Reporting Dept Nbr]
	  ,reporting_department_short_name [Reporting Dept Abbrev]
	  ,reporting_process_status_code [Reporting Dept Lims Status]
	  ,reporting_process_status_date [Reporting Dept Lims Status Date]
	  ,reporting_dept_done_status_date [Report Generated Date]
 
	  ,invoice_department_no [Invoice Dept Nbr]
	  ,invoice_department_short_name [Invoice Dept Abbrev]
	  ,invoice_process_status_code [Invoice Dept Lims Status]
	  ,invoice_process_status_date [Invoice Dept Lims Status Date]
	  ,invoice_dept_done_status_date [Invoice Generated Date]
 
FROM info.fact_controltower_national_ap2 o
LEFT JOIN mas.lab_reporting_group g on g.list_type = o.analysis_process_code and g.list_matclass = o.analysis_process_code_bkcc
WHERE NOT LEFT(analysis_process_code,3) IN ('ALL','COR','FTW')
     AND NOT (LEFT(analysis_process_code,3) is null or (LEFT(analysis_process_code,3) = 'DEC' and analysis_department_no in (2,5)) OR analysis_process_code  like 'VICP%')  
	AND [login_dept_avail_date] >= DATEADD(month, -4, getdate())
	AND (CAST(analysis_dept_done_status_date AS DATE) IS NULL OR CAST(analysis_dept_done_status_date AS DATE) =  DATEADD(dd,-1,CAST(getdate() AS DATE)))
	AND NOT (prep_department_no = 2  AND Analysis_process_code LIKE '%TCLP%' AND (CAST(prep_dept_done_status_date AS DATE) IS NOT NULL OR CAST(prep_dept_done_status_date AS DATE) =  DATEADD(dd,-1,CAST(getdate() AS DATE))))
    AND NOT (prep_department_no = 23 AND Analysis_process_code LIKE '%SPLP%' AND (CAST(prep_dept_done_status_date AS DATE) IS NOT NULL OR CAST(prep_dept_done_status_date AS DATE) =  DATEADD(dd,-1,CAST(getdate() AS DATE))))
    AND NOT (prep_department_no = 3  AND Analysis_process_code ='EXTRACT-HOLD' AND (CAST(prep_dept_done_status_date AS DATE) IS NOT NULL OR CAST(prep_dept_done_status_date AS DATE) =  DATEADD(dd,-1,CAST(getdate() AS DATE))))
    AND NOT EXISTS (SELECT 1 FROM info.fact_controltower_national i WHERE i.sample_no = o.sample_no and i.analysis_process_code = o.analysis_process_code and i.analysis_process_code_bkcc = o.analysis_process_code_bkcc and i.department_no = 10)
 

GO


