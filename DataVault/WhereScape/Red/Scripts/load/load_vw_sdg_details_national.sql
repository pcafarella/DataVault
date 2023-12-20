Truncate table WSDataVault_dev_incremental.load.load_vw_sdg_details_national;
Insert /*+ APPEND */ into WSDataVault_dev_incremental.load.load_vw_sdg_details_national
(
loginnum
,sdgid
,receivedate
,acctnum
,projectnum
,site
,locator
,description
,status
,report_complete
,tsr
,first_login_seq
,dss_record_source
,dss_load_date
)
Select VW_SDG_DETAILS.LOGINNUM
,VW_SDG_DETAILS.SDGID
,VW_SDG_DETAILS.RECEIVEDATE
,VW_SDG_DETAILS.ACCTNUM
,VW_SDG_DETAILS.PROJECTNUM
,VW_SDG_DETAILS.SITE
,VW_SDG_DETAILS.LOCATOR
,VW_SDG_DETAILS.DESCRIPTION
,VW_SDG_DETAILS.STATUS
,VW_SDG_DETAILS.REPORT_COMPLETE
,VW_SDG_DETAILS.TSR
,VW_SDG_DETAILS.FIRST_LOGIN_SEQ
,''
,''
From
SEEDPAK.VW_SDG_DETAILS VW_SDG_DETAILS
 WHERE EXISTS (
SELECT 1 FROM sample s
WHERE vw_sdg_details.loginnum = s.loginnum
and s.samp_function = 'L'    
and s.login_seq = (select min(login_seq) from sample where sample.loginnum = s.loginnum) 
AND s.lastdate > to_date('$Plast_lastdate_sample$','YYYY-MM-DD HH24:MI:SS') );
UPDATE WSDataVault_dev_incremental.load.load_vw_sdg_details_national SET dss_record_source = 'National.SEEDPAK.VW_SDG_DETAILS'
,dss_load_date = getdate()
 WHERE dss_load_date IS NULL;