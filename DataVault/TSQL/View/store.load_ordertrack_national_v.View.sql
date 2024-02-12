/****** Object:  View [store].[load_ordertrack_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
DROP VIEW [store].[load_ordertrack_national_v]
GO
/****** Object:  View [store].[load_ordertrack_national_v]    Script Date: 2/12/2024 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     view [store].[load_ordertrack_national_v] AS

select [samplenum]
      ,[matnum]
      ,[prod]
      ,[deptnum]
      ,[worknum]
      ,[dstatus]
      ,[dstatusdate]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[dss_record_source]
      ,[dss_load_date] from (
 
SELECT [samplenum]
      ,[matnum]
      ,[prod]
      ,[deptnum]
      ,[worknum]
      ,[dstatus]
      ,[dstatusdate]
      ,[lastdate]
      ,[lasttool]
      ,[lastuser]
      ,[dss_record_source]
      ,[dss_load_date]
     ,row_number() OVER (Partition by samplenum, prod, matnum, deptnum, dstatus, lastdate, worknum ORDER BY [dstatusdate], [lasttool], [lastuser] ) rownum
from load.load_ordertrack_national
--where samplenum = 'L1615541-01'  and prod = 'REACTS'  and dstatus = 'WG' and deptnum =19
 ) a
 where rownum = 1
GO
