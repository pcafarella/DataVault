/****** Object:  View [info].[fact_controltower_ap3_v]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [info].[fact_controltower_ap3_v]
GO
/****** Object:  View [info].[fact_controltower_ap3_v]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*
if Object_ID('info.fact_controltower_adp') IS NOT NULL
	DROP TABLE info.fact_controltower_adp

SELECT *
 INTO info.fact_controltower_adp 
FROM info.fact_controltower_adp_v


*/
 
 

CREATE                                         VIEW [info].[fact_controltower_ap3_v] AS   

--select top 100 * from [info].[fact_controltower_ap3_v]

SELECT work_order_no [Work Order Nbr]
      ,sample_no [Sample Nbr]
      ,pace_account_no [Customer Nbr]
	  , CASE WHEN  LEFT(analysis_process_code,3) = 'ALL' THEN '75'
			 WHEN  LEFT(analysis_process_code,3) = 'COR' THEN '75'
			 WHEN  LEFT(analysis_process_code,3) = 'FTW' THEN '75'
			 ELSE '80' END  Lab
      --,NULL [Lab Location]
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
	  --,prep_attempt_count [Prep Dept Attempt Count] 

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
	  ,CAST(NULL AS VARCHAR)  [Analysis Instrument]
	  ,CAST(NULL AS VARCHAR) [Location]
	  ,CAST(batch_no_cnt AS VARCHAR) [Analysis Dept Attempt Count]

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
 
  FROM info.fact_controltower_national_ap2


 -- drop table info.fact_controltower_ap3 select * into info.fact_controltower_ap3 from info.fact_controltower_ap3_v
GO
