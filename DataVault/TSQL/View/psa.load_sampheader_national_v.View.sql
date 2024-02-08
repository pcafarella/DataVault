/****** Object:  View [psa].[load_sampheader_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [psa].[load_sampheader_national_v]
GO
/****** Object:  View [psa].[load_sampheader_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE VIEW [psa].[load_sampheader_national_v]
AS 

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
  FROM [psa].[load_sampheader_national]  o
  WHERE dss_load_date = (SELECT MAX(dss_load_date) 
                           FROM  [psa].[load_sampheader_national] i 
                          WHERE i.[samp_joinid] = o.[samp_joinid]
						  AND i.[samplenum] = o.[samplenum] )

GO
