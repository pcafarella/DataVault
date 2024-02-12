/****** Object:  View [load].[load_sampheader_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
DROP VIEW [load].[load_sampheader_national_v]
GO
/****** Object:  View [load].[load_sampheader_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE     VIEW [load].[load_sampheader_national_v] AS 
  
 
SELECT [samp_joinid]
      ,[audit_seq]
      ,[samplenum]
      ,[samp_tag]
      ,[loginnum]
      ,[login_seq]
      ,[list_joinid]
      ,[snapshot_flag]
      ,[dkey_flag]
      ,[parm_validate_flag]
      ,[dkey_cnt]
      ,[pchain_id]
      ,[calcid]
      ,[process_step]
      ,[process_id]
      ,[nextprocess_id]
      ,[process_status]
      ,[process_message]
      ,[reqavail_flag]
      ,[calcavail_flag]
      ,[approval_status]
      ,[galp_id]
      ,[input_seq]
      ,[inputdate]
      ,[samp_type]
      ,[run_id]
      ,[link_id]
      ,[enterdate]
      ,[prep_date1]
      ,[prep_date2]
      ,[measuredate]
      ,[rptremarks]
      ,[comments]
      ,[lastdate]
      ,[lastuser]
      ,[lasttool]
      ,[analysis_type]
      ,[analysis_count]
      ,[rpt_mdl]
      ,[virtual_set]
      ,[worknum]
      ,[tic]
      ,[dss_record_source]
      ,[dss_load_date]
 




FROM (
select *, row_number() OVER (PARTITION BY [samplenum]
      ,run_id
 
	  ORDER BY   lastdate desc)  rownum from load.load_sampheader_national) a
WHERE rownum  = 1
GO
