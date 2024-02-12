/****** Object:  View [psa].[load_sample_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
DROP VIEW [psa].[load_sample_national_v]
GO
/****** Object:  View [psa].[load_sample_national_v]    Script Date: 2/8/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW    [psa].[load_sample_national_v]
 AS

SELECT [samplenum]
      ,[clientid]
      ,[acctnum]
      ,[projectnum]
      ,[site]
      ,[locator]
      ,[qctype]
      ,[collectby]
      ,[receivedate]
      ,[collectdate]
      ,[tat]
      ,[duedate]
      ,[priorityflag]
      ,[loginnum]
      ,[login_seq]
      ,[prelognum]
      ,[presamplenum]
      ,[expectdate]
      ,[orderdate]
      ,[description]
      ,[comments]
      ,[quotenumref]
      ,[totalprice]
      ,[invoicenum]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[samp_function]
      ,[designid]
      ,[reportdate]
      ,[prelog_exportedon]
      ,[original_report_date]
      ,[tableid]
      ,[duedate2]
      ,[collect_timezone]
      ,[utc_collectdate]
      ,[dss_record_source]
      ,[dss_load_date]
  FROM [psa].[load_sample_national] o
  WHERE dss_load_date = (SELECT MAX(dss_load_date) 
                           FROM  [psa].[load_sample_national] i 
                          WHERE   i.[samplenum] = o.[samplenum] )

GO
