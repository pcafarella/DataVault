/****** Object:  StoredProcedure [load].[usp_getlastdate_sample_national]    Script Date: 2/8/2024 9:19:56 AM ******/
DROP PROCEDURE [load].[usp_getlastdate_sample_national]
GO
/****** Object:  StoredProcedure [load].[usp_getlastdate_sample_national]    Script Date: 2/8/2024 9:19:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE         PROCEDURE [load].[usp_getlastdate_sample_national] @lastdate datetime OUT 
AS

/* 
DECLARE @retval varchar
DECLARE @lastdate datetime
exec @retval = load.usp_getlastdate_invoicedef_national  @lastdate OUTPUT
select @retval, @lastdate
 */

;WITH lastdate_cte AS(
select max(lastdate) lastdate FROM (
--select max(lastdate) lastdate from raw.s_sample_mroc_national
 select max(lastdate) lastdate from psa.load_sample_national
  WHERE lastdate < getdate()
 ) b ) 

UPDATE p
SET dss_parameter_value = CONVERT(VARCHAR,COALESCE(lastdate,'1900-01-01'), 20)
 --select *
FROM dss_parameter p
JOIN lastdate_cte c ON 1=1
WHERE dss_parameter_name = 'last_lastdate_sample'  --2023-02-24 12:38:58

select @lastdate = dss_parameter_value
FROM dss_parameter p
WHERE dss_parameter_name ='last_lastdate_sample'  --2023-02-24 12:38:58

SELECT dss_parameter_value
from dss_parameter
WHERE dss_parameter_name ='last_lastdate_sample'

 RETURN  
GO
